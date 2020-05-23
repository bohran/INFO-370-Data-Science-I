# Part 2: Asses grade differences between male and female students in an Informartics course
# For each question, make sure to clearly calculate your answer, and (where appropriate)
# write additional observations as comments in this script.

# Set up
library(dplyr)
library(tidyr)
library(ggplot2)

# Load grades from the `grades.csv` file
setwd("~/INFO370/nb3-bohran")
grade.data = read.csv("grades.csv", stringsAsFactors = FALSE)
print(grade.data)

# How many students are there of each sex?
male = grade.data %>% filter(sex=='m')
male_count = nrow(male)
female = grade.data %>% filter(sex=='f')
female_count = nrow(female)

# Calculate the average grade for each assignment by sex
# Hint: use `summarize_all`
male_average = male %>% summarise(a1_mean = mean(a1), a2_mean = mean(a2),
                                   a3_mean = mean(a3), a4_mean = mean(a4),
                                   a5_mean = mean(a5), a6_mean = mean(a6),
                                   a7_mean = mean(a7), a8_mean = mean(a8))

female_average = female %>% summarise(a1_mean = mean(a1), a2_mean = mean(a2),
                                       a3_mean = mean(a3), a4_mean = mean(a4),
                                       a5_mean = mean(a5), a6_mean = mean(a6),
                                       a7_mean = mean(a7), a8_mean = mean(a8))
averages = grade.data%>% group_by(sex) %>%  summarise(a1_mean = mean(a1), a2_mean = mean(a2),
                                               a3_mean = mean(a3), a4_mean = mean(a4),
                                               a5_mean = mean(a5), a6_mean = mean(a6),
                                               a7_mean = mean(a7), a8_mean = mean(a8),
                                               total_mean = mean(total))

# Create a scatter plot showing the average female score (x) v.s. male score (y)
# on each assignment. Then, add a 45 degree line to the graph
# Hint: this requires reshaping your data
grade.data.reshape = gather(averages, "assignment", "score", a1_mean:a8_mean)
grade.data.reshape = spread(grade.data.reshape, sex, score)
plot(grade.data.reshape$f, grade.data.reshape$m, main="Female Grades vs Male Grades", 
     xlab="Female Grades ", ylab="Male Grades")
abline(0,1)

# Perform a T test comparing the "total" grade of male and female students?
# Is there an observed and significant different by sex?

t.test(female$total)
t.test(male$total)
# There is no significant difference by sex

# Now run a t-test on each assignment comparing the grade of male and female students
# (feel free to use a loop or `lapply`)
# Were there any assignments with an observed difference in male and female grades?
maleT <- for(i in 3:10) {
  print(t.test(male[i]))
}

 femaleT <- for(i in 3:10) {
  print(t.test(female[i]))
 }

# For any assignments with a statistically significant difference in performance, 
# create an overlapping histogram showing the distribution of male and female grades.
# Use these histograms to interpret why the differences were statistically significant
grades_sex <- grade.data %>%  select(sex, a1, a2, a3, a4, a5, a6, a7, a8) %>% group_by(sex)

f_grades <- grades_sex[grades_sex$sex == 'f',]
m_grades <- grades_sex[grades_sex$sex == 'm' ,]

fm_grades <- rbind(maleT, femaleT)
ggplot(data = averages, aes(x = averages$a3_mean, fill = sex)) + geom_histogram(alpha = 0.3)




# We can use similar techniques to make comparisons across assignments (*not* by sex)
# As an example, use a t-test to answer the question, 
# Was assignment 4 harder than assignment 5? 
# Make sure to account for the fact that the data is *paried*
# Create a graphic that supports this comparison
 
print(t.test(grade.data$a4, grade.data$a5), paired = TRUE)

plot(grade.data$a4, grade.data$a5, main="Assignment 4 vs Assignment 5", 
     xlab="Assignment 4 Grades ", ylab="Assignment 5 Grades")
abline(0,1)


