from bs4 import BeautifulSoup as bs
import requests as r
import pandas as pd
import numpy as np
import nltk
from nltk.corpus import stopwords
from collections import Counter

# Scrapes artist information
def get_artist(artist):
    page = r.get("https://www.lyrics.com/artist/" + artist)
    soup = bs(page.content, 'html.parser')
    return soup

# Scrapes albums for a given artist
def get_albums(artist):
    soup = get_artist(artist)
    albums = [titles.text for titles in soup.find_all('h3', {"class": "artist-album-label"})]
    return albums

# Scrapes and creates dictionary for songs and albums
def get_all_content(artist):
    soup = get_artist(artist)
    album_content_raw = soup.find('div', {"class": "tdata-ext"})
    album_content = album_content_raw.find_all('div',{"class": "clearfix"})
    dict = {}
    
    for t in album_content :
        album_title = t.find('h3', {"class": "artist-album-label"}).text
        song = t.find_all('strong')[2:]
        for song in song:
            dict[song] = album_title
    return dict
content = get_all_content("Adele")

# Scrapes all song URLs
def get_links_songs(artist):
    soup = get_all_content(artist)
    links = soup.keys()
    songLinks = []
    for l in links :
        song = l.find('a')
        songLinks.append("https://www.lyrics.com" + song.get('href'))
    return songLinks
songLinks = get_links_songs(artist)

# Scrapes all song lyrics from a given artist
def get_all_lyrics(artist):
    songLinks = get_links_songs(artist)
    all_lyrics = {}
    count = 0
    for song in songLinks:
        page = r.get(song)
        soup = bs(page.content, 'html.parser')
        song_title = soup.find('h2')
        lyrics = [lyrics.text for lyrics in soup.find_all('pre')]
        all_lyrics[song_title.text] = lyrics[0]
        count = 0
        for key in all_lyrics.keys():
            count = count + len(all_lyrics[key])
    return all_lyrics, count
all_lyrics, count = get_all_lyrics(artist)

# Scrapes songs by a given artist
def get_song(artist):
    page = r.get('https://www.lyrics.com/artist/' + artist)
    soup = bs(page.content, 'html.parser')
    song = [t.text for t in soup.find_all('strong')][2:]
    return song
song = get_song(artist)

# Returns the most common "non-stop" word
def stop_word(lyrics):
    import nltk
    nltk.download('punkt')
    from nltk.corpus import stopwords
    nltk.download("stopwords")
    from nltk.tokenize import word_tokenize 

    stop_words = set(stopwords.words('english')) 
    word_tokens = word_tokenize(lyrics) 
    nonstop_lyrics = [w for w in word_tokens if not w in stop_words] 
    nonstop_lyrics = []
    for w in word_tokens: 
        if w not in stop_words: 
            nonstop_lyrics.append(w) 

    return nonstop_lyrics

common = []
def get_mostCommon(nonstop_lyrics):
    common.append(max(set(nonstop_lyrics), key=nonstop_lyrics.count))
    return common
most_common = get_mostCommon(nonstop_lyrics)

# Returns the total number of words in a given song   
def totalWords(artist_name, song_name):
    lyrics = get_all_lyrics('Adele')
    for song in all_lyrics.keys():
        if song == song:
            words = all_lyrics.get(song).split(' ')
            numWords = len(words)
    return numWords

totalWords(artist_name, song_name)

# Saves columns in dataframe which is then converted to .csv file
lists = {'songs' : list(content.keys()), 'albums': list(content.values()), 'links': songLinks}
df = pd.DataFrame(lists)
df.to_csv('df-1.csv')
    
