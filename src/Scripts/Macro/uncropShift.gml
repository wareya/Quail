// Returns the data contained in a bitmask within certain specifications
// argument 0 - bitmask
// argument 1 - bit width of the data ("cropped")
// argument 2 - least significant bit position  (shift)

return (argument0 >> argument2) & (power(2, argument1)-1);
