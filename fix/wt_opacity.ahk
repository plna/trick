#^Esc::
  WinGet, TransLevel, Transparent, A
  If (TransLevel = OFF) {
    WinSet, Transparent, 230, A
  } Else {
    WinSet, Transparent, OFF, A
  }
return