@echo off
if exist %USERPROFILE%\AppData\Roaming\.emacs.d (
    rd /S /Q %USERPROFILE%\AppData\Roaming\.emacs.d
)
mklink /D %USERPROFILE%\AppData\Roaming\.emacs.d %USERPROFILE%\myconfig\emacs\.emacs.d

if exist %USERPROFILE%\.emacs.d (
    rd /S /Q %USERPROFILE%\.emacs.d
)
mklink /D %USERPROFILE%\.emacs.d %USERPROFILE%\myconfig\emacs\.emacs.d

mklink %USERPROFILE%\.globalrc %USERPROFILE%\myconfig\emacs\.globalrc
setx GTAGSCONF "%USERPROFILE%\myconfig\emacs\.globalrc"
