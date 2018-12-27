# Python 3
import io
import os
import re
import zipfile

import requests

EXE_NAME = "kolmafia.jar"
PWD = os.path.dirname(os.path.abspath(__file__))
ZIP_LINK = "https://ci.kolmafia.us/job/Kolmafia/lastSuccessfulBuild/artifact/*zip*/archive.zip"

if __name__ == "__main__":
    r = requests.get(ZIP_LINK)
    with io.BytesIO(r.content) as f:
        with zipfile.ZipFile(f) as z:
            files = z.namelist()
            for filename in files:
                if re.match(r'archive/dist/KoLmafa-[0-9]*\.jar', filename) is not None:
                    break
            with z.open(filename, 'r') as jar:
                jar_bytes = jar.read()

    with io.open(EXE_NAME, 'wb') as jar:
        jar.write(jar_bytes)
