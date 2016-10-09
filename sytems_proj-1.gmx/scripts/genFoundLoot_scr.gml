{
    var equipChance = floor(random(100));
    while (equipChance > 80) {
        show_debug_message("found equipment");
        equipChance = floor(random(100));
    }
    var goldChance = floor(random(100));
    var gold = floor(random_range(1,4));
    while (goldChance > 30) {
        gold += floor(random_range(20,51));
        goldChance = floor(random(100));
    }
    show_debug_message("found "+string(gold)+" gold");
}
