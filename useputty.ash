void main(int round, monster mob, string combat){
    if ( get_property('spookyPuttyCopiesMade') < 5){
        throw_item($item[Spooky Putty sheet]);
    }else{
        attack();
    }
}