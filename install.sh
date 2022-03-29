#!/bin/sh

VideoToolSetup() {
    Videotoolfolder=./video-tool-new
    if [ ! -d "$Videotoolfolder" ]; then
        echo "video-tool-new folder not found"
        echo "cloning from github"
        git clone https://github.com/matchday-ai/video-tool-new.git -b master
    else
        echo "video-tool-new folder already exist"
        echo "checking for changes"
        cd video-tool-new
        changed=0
        git remote update && git status -uno | grep -q 'Your branch is behind' && changed=1
        if [ $changed = 1 ]; then
            git checkout master
            git pull origin master
            echo "Updated successfully";
        else
            echo "Up-to-date"
        fi
        cd ..
        echo "\n"
    fi
}

VideoToolSetup

echo required folders are created/updated

echo setting up and building

python3 -m venv .venv
. .venv/bin/activate
which python
pip install scikit-build
pip3 install --upgrade setuptools pip
pip install -r requirements.txt
mkdir screen_recording
mkdir ../harddisk
mkdir ../harddisk/badminton
mkdir video-tool-new/api/static
mkdir video-tool-new/api/static/markpoints_useful_files
mv data.json video-tool-new/api/static/markpoints_useful_files/data.json


cd video-tool-new/
npm i
npm run build
