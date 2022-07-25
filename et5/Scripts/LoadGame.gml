if file_exists("EvilToaster5_save")
execute_file("EvilToaster5_save");
    if !instance_exists(MainApple)
        instance_create(0, 0, MainApple);

f=file_text_open_write("temp");
file_text_write_string(f,"
instance_create(0, 0, MainApple);
execute_file('EvilToaster5_save');
");
file_text_close(f);
