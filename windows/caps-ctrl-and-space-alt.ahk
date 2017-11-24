; Recommended, but not required:
SendMode Input
#NoEnv
#SingleInstance force

#Include dual/dual.ahk
dual := new Dual

#Include dual/defaults.ahk

#If true ; Override defaults.ahk. There will be "duplicate hotkey" errors otherwise.
; BigCtrl-like.
*Space::
*Space UP::dual.combine("RAlt", A_ThisHotkey)

#If

+Capslock::Capslock
Capslock::Control 
