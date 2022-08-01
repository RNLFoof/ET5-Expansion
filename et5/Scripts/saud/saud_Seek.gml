// Seeks to a position in a file
// Arg 0 = The position to seek to. (in ms, I think?)
// Arg 1 = The id of the file.

return external_call(global.Seek,""+string(argument0),argument1);
