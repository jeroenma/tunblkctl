#!/usr/bin/osascript -s so
tell app "Tunnelblick"
  set cNames to (get name of configurations)
  
  repeat with i from 1 to count cNames
    log (item i of cNames)
  end repeat
end tell
