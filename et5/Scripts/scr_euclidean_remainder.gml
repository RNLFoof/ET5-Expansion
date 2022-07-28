ret = argument0 mod argument1
if ret < 0 {
    return ret + argument1
}
return ret
