echo %date% %time% - SYNC GIT > con

echo %date% %time% - git pull ... > con
git pull

echo %date% %time% - git add ... > con
git add .

echo %date% %time% - git commit ... > con
git commit -m "auto-commit"

echo %date% %time% - git push ... > con
git push

echo %date% %time% - END > con
pause < con > con