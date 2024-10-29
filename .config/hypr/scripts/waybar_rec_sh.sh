#!/bin/bash

# Check if wf-recorder process is running

if pgrep -x "wf-recorder" >/dev/null; then
    echo "((⏺))"
   
    
else
   
    echo ""
fi


