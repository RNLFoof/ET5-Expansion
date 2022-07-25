if argument1 > 0.5
{
    x1 = path_get_x(argument0, argument1 - 0.001);
    y1 = path_get_y(argument0, argument1 - 0.001);
    x2 = path_get_x(argument0, argument1);
    y2 = path_get_y(argument0, argument1);
    return point_direction(x1, y1, x2, y2);
}
else
{
    x1 = path_get_x(argument0, argument1);
    y1 = path_get_y(argument0, argument1);
    x2 = path_get_x(argument0, argument1 + 0.001);
    y2 = path_get_y(argument0, argument1 + 0.001);
    return point_direction(x1, y1, x2, y2);
}
