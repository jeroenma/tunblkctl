tell app "Tunnelblick"
  set cNames to (get name of configurations)
  set cStates to (get state of configurations)
  set cBytesIn to (get bytesIn of configurations)
  set cBytesOut to (get bytesOut of configurations)
  set cAutoconnect to (get autoconnect of configurations)
  
  repeat with i from 1 to count cNames
    log ¬
      (item i of cNames)
  end repeat
end tell
