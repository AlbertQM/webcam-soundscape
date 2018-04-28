/*/-----------------------------------------------/ 
 - Webcam Soundscape:
   Click on the screen to start tracking a colour.
   To each of them, a track is associated.
   Move the colour UP/DOWN to change the volume and LEFT/RIGHT to change the pan.
   Make sure you have a /data/ folder containing 1.wav, 2.wav ... n.wav
    
   Copyright (C) <2018>  <Alberto Morabito>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
------------------------------------------------/*/

void setup() {
  size(900, 480);
  video = new Capture(this, 640, 480, 30);
  video.start();
  core = new Core();
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  core.drawTracked();
  if (core.colours.length > 0) {
    for (Colour col : core.trackedCols) {
      core.track();
      core.drawTarget();
      col.playTrack();
      col.controlTrack();
    }
  }
}

void mousePressed() {

  if (mouseButton == RIGHT && core.colours.length > 0) {//Deletes last tracked colour, pauses the track and removes object from arrayList
    core.colours = shorten(core.colours);
    core.trackedCols.get(core.trackedCols.size()-1).stopTrack();
    core.trackedCols.remove(core.trackedCols.size()-1);
  } else if (mouseButton == LEFT) {//Add colour clicked by user to the tracked colours, creates and insert a new tracked colour into the arrayList with the respective track.
    int loc = mouseX + mouseY*video.width;
    if (core.colours.length < 5) {
      core.colours = append(core.colours, video.pixels[loc]);
      int val = core.colours.length;
      core.trackedCols.add(new Colour(video.pixels[loc], "./data/" + val + ".wav"));
    }
  }
}
