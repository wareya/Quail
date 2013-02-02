/**
 * Drop the intel.
 * Argument 0 is the Player who is dropping it
 * Argument 1 is the type of drop - enum(fumble (eg from death), real drop, or throw); each has different physics
 */

if (!argument0.object.intel) // if we somehow don't have the intel, error out
{
    show_message("Dropped flag from character that doesn't have a flag (please report this error!)");
    return 0;
}

sound_play(IntelDropSnd);

with(argument0.object)
{
    if (global.myself == argument0)
    {
        if (!instance_exists(NoticeO))
            instance_create(0,0,NoticeO);
        with (NoticeO)
            notice = NOTICE_HAVEINTEL;
    }
    intel = false;
    canGrabIntel = false;
    alarm[1] = 30;
    animationOffset = CHARACTER_ANIMATION_NORMAL;
    
    recordEventInLog(5, player.team, player.name, global.myself == player);
    
    if(team == TEAM_RED)
        newIntel = instance_create(x,y,IntelligenceBlue);
    else if (team == TEAM_BLUE)
        newIntel = instance_create(x,y,IntelligenceRed);
    else
    {
        show_message("Dropped flag from character that isn't on a team (please report this error!)");
        return 0;
    }
    newIntel.speed = speed * 1.4;
    newIntel.direction = direction;
    
    newIntel.alarm[0] = 900;
}
