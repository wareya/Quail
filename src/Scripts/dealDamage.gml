//argument0 = damage to deal
//argument1 = attacking player
//argument2 = harmed character
//argument3 = knockback direction
//argument4 = can damage cause knockback? (also causes cloak flicker)
//argument5 = is damage explosive? decides whether to change moveStatus

// Deals damage.
// Causes knockback, bleed, flicker.
// Knockback in px/s is based linearly on damage but the factor depends on player moveStatus state.
// /3.5 for normal
// /1.75 for abnormal (explosive jumping, knocking, etc)

var damage, source, victim, knock_dir, knock_mag, explosive;

damage = argument0;
source = argument1;
victim = argument2;

knock_dir = argument3;
knockback = argument4;
explosive = argument5;

if (victim.moveStatus == 0)
    knock_factor = 3.5;
else
    knock_factor = 1.75;

// knockback currently applies to all damage victims
// with(victim)
//    motion_add(other.knock_dir, other.knock_mag);
victim.hspeed +=  cos(degtorad(knock_dir))*damage/3;
victim.vspeed += -sin(degtorad(knock_dir))*damage/3;


if(explosive)
{
    if (source.object == victim)
        moveStatus = 1;
    else if (source.team == victim.team)
        moveStatus = 2;
    else
        moveStatus = 4;
}

// damage currently applies to living enemy mortals
if (!victim.ubered and victim.hp > 0 and victim.team != source.team) // is this instance actually harmable and will harm happen?
{
    victim.hp -= damage;
    
    if(global.gibLevel > 0 and knockback) // only cause blood particles if the damage source causes knockback
    {
        repeat(3)
        {
            var blood;
            blood = instance_create(victim.x, victim.y, Blood);
            blood.direction = knock_dir;
            blood.speed = damage/knock_factor;
        }
    }
    // so does flicker
    if(knockback)
        victim.cloakAlpha = min(victim.cloakAlpha + 0.2, 1);
}
