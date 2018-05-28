+Capslock::Capslock
Capslock::Control
#b::
  Run "chrome.exe"
  Return
#c::
  Run "code.exe"
  Return
#f::
  Run "Everything.exe"
  Return
#m::
  Run "runemacs.exe"
  Return
#t::
  Run "ConEmu.exe"
  Return
#v::
  Run "gvim.exe"
  Return

^!h:: sendevent {LWin down}{LCtrl down}{Left down}{LWin up}{LCtrl up}{Left up}    ; switch to previous virtual desktop
^!l:: sendevent {LWin down}{LCtrl down}{Right down}{Lwin up}{LCtrl up}{Right up}      ; switch to next virtual desktop