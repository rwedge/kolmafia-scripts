import <diet.ash>;
void get_temporary_meat_buffs(){
    // Daily meat from hippy store
    visit_url('shop.php?whichshop=hippy');
    // Winklered from concert arena
    cli_execute('concert Winklered');
}
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

/*
Buffs up via Buffy and the mall, then equips farming gear and farms Barf Mountain
*/
void get_regular_meat_buffs(int turns){
    if( have_effect( $effect[Ode to Booze]) > 0){
        cli_execute( "shrug ode");
    }
    effect[5] buffs;
    buffs[0] = $effect[Cringle's Curative Carol]; buffs[1] = $effect[Polka of PLenty];
    buffs[2] = $effect[Fat Leon's Phat Loot Lyric]; buffs[3] = $effect[Jingle Jangle Jingle];
    buffs[4] = $effect[Empathy];
    for i from 0 to count(buffs) - 1 {
        if (have_effect( buffs[i]) < turns){
            for j from have_effect( buffs[i]) to turns by 450{
                chat_private('Buffy', to_string(buffs[i]));
            }
        }
    }
    equip( $item[Travoltan Trousers]);
    acquire( (turns - have_effect( $effect[Wasabi Sinuses]))/10 + 1, 'Knob Goblin nasal spray');
    acquire( (turns - have_effect( $effect[Heavy Petting]))/10 + 1, 'Knob Goblin pet-buffing spray');
    if ( mall_price( $item[Uncle Greenspan's Bathroom Finance Guide]) < 25000){
        acquire( (turns - have_effect( $effect[Buy! Sell! Buy! Sell!]))/100 + 1, "Uncle Greenspan's Bathroom Finance Guide");
    }

    boolean buffed_up;
    // wait for buffy for 3 minutes, then give up
    for i from 0 to 12 {
        wait(15);
        buffed_up = true;
        for j from 0 to count(buffs) - 1 {
            if( have_effect( buffs[j]) < turns){
                buffed_up = false;
            }
        }
        if( buffed_up){
            break;
        }else if( i == 12){
            print( 'No response from Buffy');
            abort();
        }
    }
}

void farm_barf_mountain(int turns){
    get_regular_meat_buffs(turns);
    outfit( 'meat');
    equip( $item[astral pet sweater]);
    int starting_adv = my_adventures();
    while( my_adventures() > starting_adv - turns ){
        if( adventure(turns - (starting_adv - my_adventures()), $location[barf mountain]) == false){
            if( my_mp() <= my_maxmp() * 0.11){
                cli_execute('nuns');
            }else{
                print('Mafia abort, unknown cause');
                abort();
            }
        }

    }
}

void farm_embezzlers(){
    get_temporary_meat_buffs();
    get_regular_meat_buffs(10);
    outfit( 'embezzle');
    if( get_property( '_photocopyUsed') == false){
        if( faxbot( $monster[Knob Goblin Embezzler]) == false){
            print( 'Failed to receive fax');
            abort();
        }
        use(1, $item[photocopied monster]);
    }

    while( item_amount($item[Spooky Putty monster]) > 0){
        use(1, $item[Spooky Putty monster]);
    }
    //visit_url('place.php?whichplace=chateau&action=chateau_painting');
}
farm_embezzlers();
farm_barf_mountain(my_adventures());