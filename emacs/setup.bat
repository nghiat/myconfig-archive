@echo off
if exist %USERPROFILE%\AppData\Roaming\.emacs.d (
    rd /S /Q %USERPROFILE%\AppData\Roaming\.emacs.d
) else (
    echo a
)

mklink /D %USERPROFILE%\AppData\Roaming\.emacs.d %USERPROFILE%\myconfig\emacs\.emacs.d
