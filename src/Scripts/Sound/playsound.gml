{
    var vol, index;
    vol = calculateVolume(argument0, argument1);
    if(vol==0) exit;
    
    sound_volume(argument2, vol);
    sound_pan(argument2, calculatePan(argument0));
    index = sound_play(argument2);
}
