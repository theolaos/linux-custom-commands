#/bin/bash

# compiling the custom commands
g++ -o cllear cllear_cpp/cllear.cpp

g++ -o peak peak_cpp/peak.cpp

# moving the custom commands to the bin folders
# mv cllear 
# mv peak