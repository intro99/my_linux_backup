#!/usr/bin/env python3

import time
import subprocess
from threading import Thread

class IncrementalTimer:
    def __init__(self):
        self.seconds = 0
        self.running = False
        self.thread = Thread(target=self._update_timer)
    
    def start(self):
        self.running = True
        if not self.thread.is_alive():
            self.thread = Thread(target=self._update_timer)
            self.thread.start()
    
    def stop(self):
        self.running = False
    
    def reset(self):
        self.seconds = 0
    
    def _update_timer(self):
        while self.running:
            self.seconds += 1
            time.sleep(1)
    
    def get_time(self):
        return self.seconds

def main():
    timer = IncrementalTimer()
    timer.start()

    while True:
        time.sleep(1)
        current_time = timer.get_time()
        formatted_time = time.strftime("%H:%M:%S", time.gmtime(current_time))
        subprocess.run(['waybar', '-c', f'{{ "text": "{formatted_time}", "class": "custom-timer" }}'])

if __name__ == "__main__":
    main()
