@ECHO OFF

del /f /q C:\Users\%USERNAME%\.gitconfig
del /f /q C:\Users\%USERNAME%\_vimrc
del /f /q C:\Users\%USERNAME%\.gitignore

rmdir /s /q C:\Users\%USERNAME%\.vim\templates

mkdir C:\Users\%USERNAME%\.vim\templates

xcopy C:\Users\%USERNAME%\etc\vim\templates C:\Users\%USERNAME%\.vim\templates

copy C:\Users\%USERNAME%\etc\gitconfig C:\Users\%USERNAME%\.gitconfig
copy C:\Users\%USERNAME%\etc\vimrc C:\Users\%USERNAME%\_vimrc
copy C:\Users\%USERNAME%\etc\gitignore C:\Users\%USERNAME%\.gitignore

echo Copy Success!
echo Checking for vimfiles.

if not exist C:\Users\%USERNAME%\.vim mkdir C:\Users\%USERNAME%\.vim

if exist C:\Users\%USERNAME%\vimfiles move /y C:\Users\%USERNAME%\.vim C:\Users\%USERNAME%\vimfiles\* 

echo Script Complete. Exiting.
pause
