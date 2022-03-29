#!/bin/sh

kill -9 $(sudo lsof -t -i:8000)
kill -9 $(sudo lsof -t -i:3001)

. .venv/bin/activate

VideoTool(){
    Frontend(){
        cd video-tool-new
        npm start
    }
    Backend (){
        cd video-tool-new/api
        python api.py
    }
    Backend & Frontend
}

VideoTool
