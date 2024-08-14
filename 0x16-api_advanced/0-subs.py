#!/usr/bin/python3
"""
 function that queries the Reddit API
 and returns the number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """initializate"""
    if (type(subreddit) is not str):
        return(0)
    url_api = ("https://www.reddit.com/r/{}/about.json".format(subreddit))
    headers = {'user-agent': 'safari:holberton/0.1.0'}
    response = requests.get(url_api, headers=headers)
    if response.status_code is not 200:
        return(0)
    return(response.json().get("data").get("subscribers"))
