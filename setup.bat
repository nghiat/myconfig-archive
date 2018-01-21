@echo off
rem emacs
if exist %USERPROFILE%\AppData\Roaming\.emacs.d (
    rd /S /Q %USERPROFILE%\AppData\Roaming\.emacs.d
)
mklink /D %USERPROFILE%\AppData\Roaming\.emacs.d %~dp0\emacs\.emacs.d

if exist %USERPROFILE%\.emacs.d (
    rd /S /Q %USERPROFILE%\.emacs.d
)
mklink /D %USERPROFILE%\.emacs.d %~dp0\emacs\.emacs.d

mklink %USERPROFILE%\.globalrc %~dp0\emacs\.globalrc
setx GTAGSCONF "%~dp0\emacs\.globalrc"

rem vim
mklink %USERPROFILE%\_vimrc %~dp0\vim\vimrc
mklink /D %USERPROFILE%\vimfiles %~dp0\vim\vimfiles

rem cygwin
mklink %USERPROFILE%\.minttyrc %~dp0\windows\.minttyrc
mklink %USERPROFILE%\.vimrc %~dp0\vim\vimrc
mklink %USERPROFILE%\.tmux.conf %~dp0\dotfiles\config\home\.tmux.conf
mklink /D %USERPROFILE%\.vim %~dp0\vim\vimfiles
