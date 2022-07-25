// Loads a file (mp3, wav, mid, avi) into memory
// Arg 0 = Path to the file (full path, use working_directory function
// if loading a file in same folder as the game)
// Arg 1 = The id to assign to the loaded file. Must be used to play, pause,
// ect. the file. (Ex: sound1, sound2, reload_sound, shoot_sound, ect.)

//return external_call(global.Load,argument0,argument1);



// saud_load(path,id)
// Load a file from path and assign it an id
var dev, dev2, file, check, buffer, c, get_dev;
//Device
dev[1] = "WaveAudio";//*.wav
dev[2] = "MPEGVideo";//*(vista/seven)codec
dev[3] = "Sequencer";//*.mid
dev[4] = "AVIVideo";//*.avi
dev[5] = "DigitalVideo";//*video?
dev[6] = "Overlay";//*video?
dev[7] = "MMMovie";//*video?
dev[8] = "DAT";//*audio?
dev[9] = "Other";//*???

//file
file = argument0;

//c (counter)
c = 1;
get_dev = "ERROR";
check = 0;

do
{
buffer = MCI_command('open "'+file+'" type '+dev[c]+" alias SPLN");
MCI_command("close SPLN");
if real(buffer) >= 1
{
show_debug_message(dev[c])
get_dev = dev[c];
check = 1;
}
c+=1;
}until (check = 1) or (c > 9)

//RETURN
dev2 = get_dev;
/*****/
if ( dev2 == "WaveAudio" ) { return MCI_command('open "'+file+'" type '+dev2+" alias "+string(argument1)); }
if dev2!= "ERROR"
{return MCI_command('open "'+argument0+'" type '+dev2+" style overlapped alias "+string(argument1))}
else {return -1;}
