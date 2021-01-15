@ECHO OFF

del /f /q C:\Users\%USERNAME%\.gitconfig
del /f /q C:\Users\%USERNAME%\_vimrc

copy C:\Users\%USERNAME%\etc\gitconfig C:\Users\%USERNAME%\.gitconfig
copy C:\Users\%USERNAME%\etc\vimrc C:\Users\%USERNAME%\_vimrc
echo Copy Success!
pause
