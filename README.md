# waterlinked.github.io
We are using mkdocs to manage our documentation.

# Contributing
We're really happy if you want to contribute to make the documentation better!
This is done by creating a pull request.

1. Download, install dependencies

```
git clone --recursive https://github.com/waterlinked/docs
cd docs

virtualenv venv
source ven/bin/activate
pip install -r requirements.txt

mkdocs serve
```

2. Make changes using your favorite editor

3. Test them

* Fire up your browser and go to localhost:8000

## Deploy changes to server
After the changes have been tested and they work, push the changes to the master branch and Github will build the website under waterlinked.github.io/docs subfolder.

Once you're satisfied with the results, you can build the updated website on waterlinked.github.io itself. It is recommended to do this the following way:
* Have both the "docs" and "waterlinked.github.io" repositories in the same folder on your local machine.
```
/Local Folder
    /docs <-repo
	    /docs
	    mkdocs.yml
	/waterlinked.github.io <-repo
```
* Make the changes in the "docs" repo.
* Navigate to the "waterlinked.github.io" directory.
```
cd ../waterlinked.github.io/
```
* Use the mkdocs gh-deploy to build the webpage
```
mkdocs gh-deploy --config-file ../docs/mkdocs.yml --remote-branch master
```
    
The website should now be updated. You may then want to pull the updated "waterlinked.github.io" repo, although not necessary.


