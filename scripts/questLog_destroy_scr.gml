{
    ds_list_destroy(id.margin);
    var size = ds_list_size(id.text);
    for (var i=size - 1; i>=0; i--) {
        with (id.text[| i]) {
            instance_destroy();
        }
        ds_list_delete(id.text, i);
    }
    ds_list_destroy(id.text);
}

