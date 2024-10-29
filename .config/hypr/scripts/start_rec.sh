#!/bin/bash




time=$(date "+%d-%b_%H:%M:%S")
dir="$(xdg-user-dir)/Videos/rec"




# Function to start wf-recorder
start_recording() {

    #closing  wf-recorder before running   
    pkill wf-recorder

    wf-recorder --audio --file=${dir}/recording_${time}_audio.mp4 &
    # adding enviromental veriable 
    #export rec_start_sh=True

    #notify-send -e -u low -i "$notif" "rec ⏺"

    echo "Recording started."
    
}

#Funtion to start region recordind
start_Region() {

    #closing  wf-recorder before running   
    pkill wf-recorder


    wf-recorder -g "$(slurp)" --audio --file=${dir}/recordingRegion_${time}_audio.mp4  &
    #export rec_start_sh=True

    #notify-send -e -u low -i "$notif" "rec ⏺"

    echo "Recording started."
}

# Function to stop wf-recorder
stop_recording() {
    pkill wf-recorder
    #unseting the env 
    #unset rec_start_sh


    notify-send -e -u low -i "$notif" "rec stoped"

    echo "Recording stopped."
}

# Main script
if [ "$1" = "--start" ]; then

    start_recording
    export rec_start_sh=True

elif [ "$1" = "--reg" ]; then
    start_Region    

elif [ "$1" = "--stop" ]; then
    stop_recording
else
    echo "Usage: $0 [--start | --stop]"
    exit 1
fi
