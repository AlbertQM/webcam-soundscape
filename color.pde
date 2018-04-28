class Colour {//Each object of this class corresponds to a tracked colour.

  float r2, g2, b2, x, y, d, gainVal, panVal; //rbg values, xy values, distance (colour difference), gain and pan values.
  float reference = 500;


  AudioOutput out;
  Gain amp;
  Pan pan;
  FilePlayer track;


  Colour(int colour, String trackName) {
    r2 = red(colour);
    g2 = green(colour);
    b2 = blue(colour);

    out = minim.getLineOut();
    amp = new Gain(0);
    pan = new Pan(0);
    track = new FilePlayer(minim.loadFileStream(trackName));
    track.patch(amp).patch(pan).patch(out);
  }

  void playTrack() {//Toggles the playback/pause of the track (associated with webcam detecting/not detecting the colour)

    if (reference < 10 && (frameCount%20 == 0)) {
      if (!track.isPlaying()) {
        track.loop();
      }
    }
    if (reference > 10 && (frameCount%20 == 0)) {
      if (track.isPlaying()) {
        track.pause();
      }
    }
  }
  
  void stopTrack() {//Stops a track before removing it from the arrayList
   track.pause(); 
  }

  void controlTrack() {//Toggles control of the pan and gain of the track (associated with the tracked colour x and y values)
    if (reference < 10) {
      gainVal = map(y, height, 0, -6, 6);
      amp.setValue(gainVal);
    }

    if (reference < 10) {
      panVal = map(x, 0, width, -1, 1);
      pan.setPan(panVal);
    }
  }
}
