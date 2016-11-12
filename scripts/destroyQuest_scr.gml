{
    var index = argument0;
    var record = global.activeQuests[| index];
    
    
    //destroying data structures
    var party = record[? "party"];
    var size = ds_list_size(party);
    for (var i=size-1; i>=0; i--) {
        ds_list_delete(party, i);
    }
    ds_list_destroy(record[? "party"]);
    
    var pastEnc = record[? "pastEnc"];
    size = ds_list_size(pastEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = pastEnc[| i];
        ds_map_destroy(enc);
        ds_list_delete(pastEnc, i);
    }
    ds_list_destroy(record[? "pastEnc"]);
    
    var futureEnc = record[? "futureEnc"];
    size = ds_list_size(futureEnc);
    for (var i=size-1; i>=0; i--) {
        var enc = futureEnc[| i];
        ds_map_destroy(enc);
        ds_list_delete(futureEnc, i);
    }
    ds_list_destroy(record[? "futureEnc"]);
    
    ds_list_destroy(record[? "log"]);
    
    
    //removing index from global.activeQuests
    ds_map_destroy(record);
    ds_list_delete(global.activeQuests, index);
    

    /*//recycle indices above
    size = ds_list_size(global.activeQuests);
    for (var i=index; i<*/
}

