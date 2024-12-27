# import json
import os
import re
import sys
import tempfile
import traceback

import requests
from credentials import APPLICATION_KEY

# from urllib.parse import quote as urlquote
# from urllib.request import urlopen


class WesterAPIV3(object):

    def __init__(self, api_key, language="en", timeout=10):

        assert api_key != "", "Non empty api_key"
        self.session = requests.Session()
        self.session.headers = {"application": "PythonWrapper"}
        self.api_key = api_key
        self.headers = {}
        self._LANGUAGE = language
        self.timeout = timeout
        self.api_root = "https://www.dictionaryapi.com/api/v3/references/learners/json"

    def send_request(self, word, method="GET"):
        """Make a GET request to the API"""
        full_uri = f"https://www.dictionaryapi.com/api/v3/references/learners/json/{word}?key={self.api_key}"
        response = self.session.request(
            method, full_uri, timeout=self.timeout, headers=self.headers
        )

        return response

    def subdirectory(self, name):

        if re.compile(r"bix").match(name):
            return "bix"

        if re.compile(r"gg").match(name):
            return "gg"

        if re.compile(r"_").match(name):
            return "number"

        return name[0]

    def pronunciation(self, word):

        try:
            res = self.send_request(word).json()
            ipa = res[0]["hwi"]["prs"][0]["ipa"]
            audio_name = res[0]["hwi"]["prs"][0]["sound"]["audio"]
        except Exception as e:
            print("get pronunciation failed:", e)
            traceback.print_exc()
            return

        if len(audio_name) < 2:
            print("audio name parse error!")
            return

        subdir = self.subdirectory(audio_name)

        audio_url = f"https://media.merriam-webster.com/audio/prons/en/us/mp3/{subdir}/{audio_name}.mp3"

        audio_data = requests.get(audio_url).content

        with tempfile.NamedTemporaryFile() as fp:
            fp.write(audio_data)
            fp.seek(0)
            print(ipa)
            os.system(f"paplay {fp.name}")
            fp.close()

        # print(audio_name)


if __name__ == "__main__":
    query = " ".join(sys.argv[1:])
    wester = WesterAPIV3(APPLICATION_KEY)
    wester.pronunciation(query)
