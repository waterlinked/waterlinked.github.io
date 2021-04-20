# W-DN-17002 User Manuals

[![Deploy Water Linked Docs](https://github.com/waterlinked/waterlinked.github.io/actions/workflows/build.yml/badge.svg)](https://github.com/waterlinked/waterlinked.github.io/actions/workflows/build.yml)

We are using mkdocs to manage our documentation.

# Contributing

We're really happy if you want to contribute to make the documentation better!
This is done by creating a pull request.

1. Download, install dependencies

Make sure you have Python3 installed.

```
git clone https://github.com/waterlinked/waterlinked.github.io
cd waterlinked.github.io

python -m venv venv
source venv/bin/activate (Linux)
venv\Scripts\activate.bat (Windows)
pip install -r requirements.txt

mkdocs serve
```

2. Make changes using your favorite editor

3. Test them

* Fire up your browser and go to localhost:8000

## Deploy changes to server
After the changes have been tested and they work, push the changes to the master branch and Github will build the website and publish it on https://waterlinked.github.io.

