// Returns a bitmask ready copy of the input
// argument 0 - data
// argument 1 - bit width of the data ("cropped")
// argument 2 - least significant bit position (shift cropped data left arg2)

return (argument0 & ( power(2, argument1)-1) ) << argument2;
