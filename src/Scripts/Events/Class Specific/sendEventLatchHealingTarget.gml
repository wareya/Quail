targetPlayer = argument0;
medicPlayer = argument1;

write_ubyte(global.eventBuffer, MEDIC_LATCH);
write_ubyte(global.eventBuffer, ds_list_find_index(global.players, targetPlayer));
write_ubyte(global.eventBuffer, ds_list_find_index(global.players, medicPlayer));
