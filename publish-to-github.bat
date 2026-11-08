@echo off
echo ========================================================
echo   Peel & Co. EcoDye - 1-Click GitHub Publisher
echo ========================================================
echo.
echo Make sure you have created the repository 'peelcoecodye' on GitHub:
echo https://github.com/new
echo.
set /p GHUSER="Enter your GitHub Username (e.g. axcel): "
if "%GHUSER%"=="" (
    echo Error: GitHub username cannot be empty.
    pause
    exit /b
)

echo.
echo Setting remote to: https://github.com/%GHUSER%/peelcoecodye.git ...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/%GHUSER%/peelcoecodye.git
git branch -M main

echo.
echo Pushing website files to GitHub...
git push -u origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================================
    echo   SUCCESS! Project published to GitHub!
    echo ========================================================
    echo Repository: https://github.com/%GHUSER%/peelcoecodye
    echo.
    echo GitHub Actions will now automatically deploy your website.
    echo In 1-2 minutes, view your live site at:
    echo https://%GHUSER%.github.io/peelcoecodye/
    echo ========================================================
) else (
    echo.
    echo Push failed. Please check your GitHub username, repository name, or credentials.
)
echo.
pause

