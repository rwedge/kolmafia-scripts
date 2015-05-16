import <diet.ash>;

/*
Eat to start the day
*/
if( my_inebriety() == 0){
    day_drinking();
}
if( my_fullness() == 0){
    morning_meal();
}
if( my_spleen_use() == 0){
    spleening();
}



// buff up
int turns = 70;
if( have_effect( $effect[Ode to Booze]) > 0){
    cli_execute( "shrug ode");
}
effect[5] buffs;
buffs[0] = $effect[Cringle's Curative Carol]; buffs[1] = $effect[Polka of PLenty];
buffs[2] = $effect[Fat Leon's Phat Loot Lyric]; buffs[3] = $effect[Jingle Jangle Jingle];
buffs[4] = $effect[Empathy];
for i from 0 to count(buffs) - 1 {
    if( have_effect( buffs[i]) < turns){
        chat_private('Buffy', to_string(buffs[i]));
    }
}
equip( $item[Travoltan Trousers]);
acquire( (turns/10) + 1, 'Knob Goblin nasal spray');
acquire( (turns/10) + 1, 'Knob Goblin pet-buffing spray');
if ( mall_price( $item[Uncle Greenspan's Bathroom Finance Guide]) < 25000){
    acquire( (turns/100) + 1, "Uncle Greenspan's Bathroom Finance Guide");
}

outfit( 'meat');
equip( $item[astral pet sweater]);
boolean buffed_up;
for i from 0 to 9999 {
    buffed_up = true;
    for j from 0 to count(buffs) - 1 {
        if( have_effect( buffs[j]) < turns){
            buffed_up = false;
        }
    }
    if( buffed_up){
        break;
    }
}
adventure(turns, $location[barf mountain]);