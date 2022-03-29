kill -9 $(sudo lsof -t -i:8000)

. .venv/bin/activate

VideoTool(){
    cd video-tool-new/api/
    python api.py
}

VideoTool

