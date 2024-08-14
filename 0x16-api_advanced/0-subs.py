#!/usr/bin/python3
""" queries the Reddit API and returns the number of subscribers """
import requests


def number_of_subscribers(subreddit):
    """ return number of subscribers of a subredit"""
    url = f"https://www.reddit.com/r/{subreddit}/about/.json"
    headers = {'User-Agent': 'my-app/0.0.1'}

    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return 0
    result = response.json().get("data")
    return result.get("subscribers")
