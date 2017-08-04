@echo off
mklink %USERPROFILE%\_vimrc %USERPROFILE%\myconfig\vim\vimrc
if not exist %USERPROFILE%\vimfiles\autoload md %USERPROFILE%\vimfiles\autoload
mklink /D %USERPROFILE%\vimfiles\ftplugin %USERPROFILE%\myconfig\vim\ftplugin
mklink /D %USERPROFILE%\vimfiles\after %USERPROFILE%\myconfig\vim\after
mklink %USERPROFILE%\vimfiles\autoload\plug.vim %USERPROFILE%\myconfig\vim\plug.vim
