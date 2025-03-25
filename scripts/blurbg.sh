#!/bin/sh

grim /home/partha/Pictures/wallbgs/shot.png &   
wait $!                                                     

magick /home/partha/Pictures/wallbgs/shot.png -blur 0x8 /home/partha/Pictures/wallbgs/shot_blur.png & 
wait $!                                                    

wlogout
