script "diet.ash";
import <utils.ash>;

/* Food */
void morning_meal(){
    /* Purchases */
    if ( item_amount( $item[FunFunds&trade;]) > 3){
        buy($coinmaster[The Dinsey Company Store], 2, $item[Dinsey food-cone]); 
        acquire(1, 'deviled');
    }
    int mein_needed = 3;
    if ( item_amount( $item[Dinsey food-cone]) > 1){
        mein_needed -= 1;
    }
    acquire(mein_needed, 'sleazy hi mein');
    acquire(1, 'milk of magnesium');

    /* Consumption */
    use(1, $item[milk of magnesium]);
    eat(mein_needed, $item[sleazy hi mein]);
    if (my_fullness() != fullness_limit()){
        eat(2, $item[Dinsey food-cone]);
        eat(1, $item[deviled egg]);
    }
}

void pantsgiving_fullness(){
    if( have_effect( $effect[Got Milk]) < 1){
        acquire(1, 'milk of magnesium');
        use(1, $item[milk of magnesium]);
    }
    item[3] pants_food; pants_food[0] = $item[whole turkey leg]; pants_food[1] = $item[cold mashed potatoes]; pants_food[2] = $item[dinner roll];
    for i from 0 to count(pants_food) - 1 {
        if(  item_amount( pants_food[i]) > 0){
            eat(1, pants_food[i]);
            break;
        }
    }
}

/* Spleen */
void spleening(){
    acquire(41, 'game grid ticket');
    acquire(4, 'coffee pixie stick', 'Arcade Ticket Counter');
    chew(4, $item[coffee pixie stick]);
}

/* Chocolate */
void eat_choco_disco_ball(){
    acquire(2, 'chocolate disco ball');
    use(2, $item[chocolate disco ball]);
}

/* Booze */
void day_drinking(){
    if( have_effect( $effect[Cringle's Curative Carol]) > 0){
        cli_execute("shrug cringle");
    }
    chat_private('Buffy', 'ode');
    equip($item[Travoltan Trousers]);
    use_skill(1, $skill[Grab a Cold One]);
    use_skill(3, $skill[Summon Smithsness]);

    cli_execute("garden pick");
    while( item_amount( $item[peppermint sprout]) > 0){
        use(1, $item[peppermint sprout]);
    }
    boolean buy_booze = false;
    int sangria_needed = 4;
    if( item_amount( $item[Cold One]) + item_amount( $item[pumpkin beer]) + item_amount( $item[distilled fortified wine]) + item_amount( $item[thermos full of Knob coffee]) >= 2){
        sangria_needed = 3;
    }
    while( item_amount( $item[Sangria de Menthe]) < sangria_needed){
        if( item_amount( $item[peppermint twist]) == 0){
            sangria_needed = 3;
            buy_booze = true;
        }else if( item_amount( $item[boxed wine]) > 0){
            create(1, $item[Sangria de Menthe]);
        }else{
            acquire(1, 'fermenting powder');
            acquire(1, 'bunch of square grapes');
            create(3, $item[boxed wine]);        
        }
    }
    while( item_amount( $item[Paint A Vulgar Pitcher]) < 6){
        if( item_amount( $item[handful of Smithereens]) > 0){
            acquire(1, 'plain old beer');
            create(1, $item[Paint A Vulgar Pitcher]);
        }else{
            while( item_amount( $item[Frankly Mr. Shank]) < 1){
                while( item_amount( $item[Disco ball]) < 1){
                    acquire(1, 'chewing gum on a string');
                    use(1, $item[chewing gum on a string]);
                }
                create(1, $item[Frankly Mr. Shank]);
            }
            cli_execute("pulverize mr. shank");
        }
    }

    if( buy_booze == True){
        item bought_booze;
        int best_price = -1;
        int mall_query;
        item[3] choices;
        choices[0] = $item[pumpkin beer]; choices[1] = $item[distilled fortified wine];
        choices[2] = $item[thermos full of Knob coffee];
        for i from 0 to count(choices) - 1 {
            int mall_query = mall_price(choices[i]);
            if( best_price == -1){
                best_price = mall_query;
                bought_booze = choices[i];
            }else if( mall_query < best_price){
                best_price = mall_price(choices[i]);
                bought_booze = choices[i]; 
            }
        }
        buy(1, bought_booze);
    }

    for i from 0 to 12 {
        wait(15);
        if( have_effect( $effect[Ode to Booze]) > 20){
            break;
        }else if( i == 12){
                print("No response from Buffy");
                abort();
        } 
    }
    drink(6, $item[Paint A Vulgar Pitcher]);
    drink(3, $item[Sangria de Menthe]);
    if( sangria_needed == 4){
        drink(1, $item[Sangria de Menthe]);
    }else{
        drink(1, $item[Cold One]);  
        if( item_amount( $item[Cold One]) > 0){
            drink(1, $item[Cold One]);
        }else if( item_amount( $item[pumpkin beer]) > 0){
            drink(1, $item[pumpkin beer]);
        }else if( item_amount( $item[distilled fortified wine]) > 0){
            drink(1, $item[distilled fortified wine]);
        }else{
            drink(1, $item[thermos full of Knob coffee]);
        }
    }
}

void nightcap(){
    if( have_effect( $effect[Cringle's Curative Carol]) > 0){
        cli_execute("shrug cringle");
    }
    chat_private('Buffy', 'ode');
    acquire(1, 'bucket of wine');
    outfit( 'nightcap');
    for i from 0 to 12 {
        wait(15);
        if( have_effect( $effect[Ode to Booze]) > 9){
            break;
        }else if( i == 12){
                print("No response from Buffy");
                abort();
        } 
    }
    drink(1, $item[bucket of wine]);
}