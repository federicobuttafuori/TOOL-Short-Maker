@echo off
setlocal

REM === Loop through all .mp4 videos in this folder ===
for %%F in (*.mp4) do (
    echo Processing: %%F

    ffmpeg -i "%%F" -vf "scale=iw*min(1080/iw\,1920/ih):ih*min(1080/iw\,1920/ih),pad=1080:1920:(1080-iw*min(1080/iw\,1920/ih))/2:(1920-ih*min(1080/iw\,1920/ih))/2" -c:v libx264 -preset fast -crf 23 -c:a copy -y "vertical_%%~nF.mp4"
)

echo Done!
pause
