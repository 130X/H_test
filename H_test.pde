//test 
//Library: use Sketch / Import Library / Minim
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
//Minim minim; 
  AudioPlayer song1; 
//AudioMetaData songMetaData1; 
//
void setup() {
  //size() or fullScreen()
  //Display Algorithm
  minim = new Minim(this); 
  String groove = "groove.mp3";
  String extension = ".mp3";
  String pathway = "Music_SoundEffects/"; 
  String path = sketchPath( pathway + groove ); 
  //
  println(path);
  song1 = minim.loadFile( path );
  songMetaData1 = song1.getMetaData();
  //song1.loop(0);
  //
  //Meta Data Println Testing
  //For Prototyping, print all information to the console first
  //Verifying Meta Data, 18 println's 
  //Repeat: println("?", songMetaData1.?() );
  println("File Name", songMetaData1.fileName() ); //Data Correct, Verified in Console
  //Must use pure Java at OS Level to list fileName before loading Playlist
  println("Song Length (in milliseconds)", songMetaData1.length() );
  println("Song Length (in seconds)", songMetaData1.length()/1000 ); 
  println("Song Length (in minutes & seconds)", songMetaData1.length()/1000/60, "minutes", ( songMetaData1.length()/1000 - ( songMetaData1.length()/1000/60)*60 ), "seconds" ); //Gets Formula
  println("Song Title", songMetaData1.title() );
  println("Author", songMetaData1.author() );
  println("Composer", songMetaData1.composer() );
  println("Orchestra", songMetaData1.orchestra() );
  println("Album", songMetaData1.album() );
  println("Disk", songMetaData1.disc() );
  println("Publisher", songMetaData1.publisher() );
  println("Date Released", songMetaData1.date() );
  println("Copyright", songMetaData1.copyright() );
  println("Comments", songMetaData1.comment() );
  println("Lyrics", songMetaData1.lyrics() ); //OPTIONAL: Music App Sing Along
  println("Track", songMetaData1.track() );
  println("Genre", songMetaData1.genre() );
  println("Encoded", songMetaData1.encoded() );
} //End setup
//
void draw() {
  //NOte: Looping Function
  //Note: logical operators could be nested IFs
  if ( song1.isLooping() && song1.loopCount()!=-1 ) println("There are", song1.loopCount(), "loops left.");
  if ( song1.isLooping() && song1.loopCount()==-1 ) println("Looping Infinitely");
  if ( song1.isPlaying() && !song1.isLooping() ) println("Play Once");
  //
  //Debugging Fast Forward and Fast Rewind
  //println( "Song Position", song1.position(), "Song Length", song1.length() );
  //
} //End draw
//
void keyPressed() {
  if ( key=='P' || key=='p' ) song1.play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
  //.play() includes .rewind()
  //
  if ( key>='1' || key<='9' ) { //Loop Button, previous (key=='1' || key=='9')
    //Note: "9" is assumed to be massive! "Simulate Infinite"
    String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song1.loop(loopNum); //Parameter is number of repeats
    //
  }
  if ( key=='L' || key=='l' ) song1.loop(); //Infinite Loop, no parameter OR -1
  //
  if ( key=='M' || key=='m' ) { //MUTE Button
    //MUTE Behaviour: stops electricty to speakers, does not stop file
    //NOTE: MUTE has NO built-in PUASE button, NO built-in rewind button
    //ERROR: if song near end of file, user will not know song is at the end
    //Known ERROR: once song plays, MUTE acts like it doesn't work
    if ( song1.isMuted() ) {
      //ERROR: song might not be playing
      //CATCH: ask .isPlaying() or !.isPlaying()
      song1.unmute();
    } else {
      //Possible ERROR: Might rewind the song
      song1.mute();
    }
  } //End MUTE
  //
  //Possible ERROR: FF rewinds to parameter milliseconds from SONG Start
  //Possible ERROR: FR rewinds to parameter milliseconds from SONG Start
  //How does this get to be a true ff and fr button
  //Actual .skip() allows for varaible ff & fr using .position()+-
  if ( key=='F' || key=='f' ) song1.skip( 0 ); //SKIP forward 1 second (1000 milliseconds)
  if ( key=='R' || key=='r' ) song1.skip( 1000 ); //SKIP  backawrds 1 second, notice negative, (-1000 milliseconds)
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
  if ( key=='S' | key=='s' ) {
    if ( song1.isPlaying() ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.rewind(); //Not Necessary
    }
  }
  //
  //Simple Pause Behaviour: .pause() & hold .position(), then PLAY
  if ( key=='Y' | key=='y' ) {
    if ( song1.isPlaying()==true ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.play(); //ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
