script utils.ash;

/*
Custom methods
*/
void acquire(int amount, string name){
    item item_to_get = to_item(name);
    buy(amount - item_amount(item_to_get), item_to_get);
}

void acquire(int amount, string name, string shop_name){
    item item_to_get = to_item(name);
    coinmaster shop = to_coinmaster(shop_name);
    buy(shop, amount - item_amount(item_to_get), item_to_get);
}