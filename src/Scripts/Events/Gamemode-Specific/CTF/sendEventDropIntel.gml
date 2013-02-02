/**
 * Argument 0 is the player who is dropping it
 * Argument 1 is the type of drop - enum(fumble (eg from death), real drop, or throw); each has different physics
 */
 
write_ubyte(global.eventBuffer, DROP_INTEL);
write_ubyte(global.eventBuffer, ds_list_find_index(global.players, argument0));
write_ubyte(global.eventBuffer, argument1);
