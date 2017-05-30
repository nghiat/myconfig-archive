@echo off
mklink %USERPROFILE%\_vimrc %USERPROFILE%\myconfig\vim\vimrc
if not exist %USERPROFILE%\vimfiles\autoload md %USERPROFILE%\vimfiles\autoload
mklink %USERPROFILE%\vimfiles\autoload\plug.vim %USERPROFILE%\myconfig\vim\plug.vim