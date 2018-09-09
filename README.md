# webcam-soundscape

Author: Alberto Morabito
Language: Processing

## Main idea:

Control your music volume and pan with your webcam. 

1. Draw a scenario on a piece of paper and point the webcam onto it; to each single drawing (based on the colour, e.g. a black drum kit) will be associated a track. You can decide where to draw to change that track's volume and pan.

1a. Use plasticine to make models of your instruments (or anything really; why not make a fish and assign it some bubble sounds?), so it's easier to move the pieces around.

2. Point the webcam at you and move around the objects being tracked for a nice stereo effect.



## How to:

This processing sketch reads your webcam live feed. You can right click anywhere on the live feed/video to add the colour you clicked to
the list of "Tracked colours". Each one of these is associated with a track (which should be placed in /data/ folder, and named 1.wav,
2.wav [..] n.wav). You can now move the colour around to control the track's pan (left and right) and the track's volume (up and down).

For instance, if you click on something that's red, you'll see "#1 tracked colour" in red on the right side. The #1 track will start
playing and you can play around with the red object to control the track. You can also have multiple colours playing at the same time.
This way, you can build your own soundscape!

Maybe have a drumkit playing quietly on the left, a guitar riff on the right, a bass line on the left and some loud vocals right
at the center.. Or have the sound of the rain on the background while moving the footsteps left to right.
You can also point a webcam to a white wall/sheet of paper and draw your music!
