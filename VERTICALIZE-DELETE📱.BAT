@echo off
setlocal

REM === Loop through all .mp4 videos in this folder ===
for %%F in (*.mp4) do (
    echo Processing: %%F

    ffmpeg -i "%%F" -vf "crop='ih*9/16:ih':(in_w-ih*9/16)/2:0,scale=1080:1920" -c:v libx264 -preset fast -crf 23 -c:a copy -y "vertical_crop_%%~nF.mp4"
)

echo Done cropping to vertical!
pause
