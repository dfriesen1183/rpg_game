{
    //clearing any helper objects
    position_destroy(0,0);
    //creating quest record object
    global.record = instance_create(0,0,questRecord_obj);
    global.record.questDuration = 0;
    //creating active party
    global.party = ds_list_create();
}

