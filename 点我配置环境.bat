@echo off
echo Installing requirements from online sources...
pip install -r requirements.txt

if %errorlevel% neq 0 (
    echo Online installation failed, trying offline installation...
    pip install --no-index --find-links=./packs -r requirements.txt
    if %errorlevel% neq 0 (
        echo Both installation methods failed!
        exit /b 1
    )
) else (
    echo Requirements installed successfully from online sources!
    python main.py
    pause
)