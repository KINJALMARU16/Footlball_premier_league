
from bs4 import BeautifulSoup
import urllib2
import urllib
import pandas as pd
import re
import MySQLdb.cursors
import requests
from requests.exceptions import HTTPError
import sys
import codecs
import json
import time
import re
import httplib
import csv

def get_url(url):
  user_agent = 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.7) Gecko/2009021910 Firefox/3.0.7'
  headers = {'User-Agent':user_agent,}
  req = urllib2.Request(url, None,headers)
  try:
    open = urllib2.urlopen(req).read()
    return open
  except urllib2.HTTPError, e:
    print('HTTPError = ' + str(e.code))
  except urllib2.URLError, e:
    print('URLError = ' + str(e.reason))
  except httplib.HTTPException, e:
    print('HTTPException')
  except Exception:
    print("NODONENENNENEE " )
    return "ERROR"
# makes the source tree format like

def beautify(url):
  source = get_url(url)
  time.sleep(4)
  if source == 'ERROR':
    return "ERROR"
  else:
    beauty = BeautifulSoup(source,"html.parser")
    if 'play.google' in url:
      return beauty
    else:
      return beauty

def fetch_data(query,mysql_cur):
  data = get_data(mysql_cur,query)
  dataArr = data.fetchall()
  print(dataArr)
  return dataArr

def get_data(cursor_obj,query):
  cursor_obj.execute(query)
  return cursor_obj

def load_review(page,url,values):
  values["pageNum"] = str(page)
  data = urllib.urlencode(values)
  req = urllib2.Request(url, data)
  try:
    response = urllib2.urlopen(req)
    time.sleep(5)
    jdata = response.read()
    page = json.loads(jdata[6:])
  except Exception:
    print("NODONENENNENEE " )
    return None
  try:
    review = page[0][2]
    return review
  except IndexError:
    return None
  except:
    return None


####-------------------- WIKIPEDIA                    STADIUM DATA START ----------------------
url = "https://en.wikipedia.org/wiki/List_of_Premier_League_stadiums"
jobs = beautify(url)
result_allData = jobs.findAll('tr')
with open('WIKI_stadiumTeam_test.csv', mode='w') as csv_file :
  csv_writer = csv.writer(csv_file, delimiter = ',' ,quotechar = '"', quoting=csv.QUOTE_MINIMAL)
  csv_writer.writerow(['Team','Stadium'])
  for tr in result_allData: 
    value = tr.text
    print('-------------------------------------------------')
    value_stadium1 =value.split('\n')[1].encode("utf8")
    value_image2 =value.split('\n')[3].encode("utf8")
    value_team3 =value.split('\n')[4].encode("utf8")
    print(value_team3)
    csv_writer.writerow([value_team3,value_stadium1]) 


