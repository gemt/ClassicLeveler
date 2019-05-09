-- Author      : G3m7
-- Create Date : 5/5/2019 5:18:43 PM

CLGuide_Duskwood1 = {
    Title="24-26 Duskwood",
    Pinboard = {},
    Steps = {
        -- Antonio Perelli, salesman on road to Darkshire sells Wolf Bracers (35s) and 3 lesser healing potion
        -- Kzixx, goblin on road, sells 3 healing potion and 3 lesser mana potion


        {Text="Accept The Legend of Stalvan (Madame Eva in town)", At="The Legend of Stalvan", point={x=7581,y=4531}},
        {Text="Accept The Totem of Infliction", At="The Totem of Infliction", point={x=7581,y=4531}},

        {Text="If you dont have Bronze tube yet check Herble Baubbletump", 
            BuyItem={Npc="Herble Baubbletump", Item="Bronze Tube", Count=1}, point={x=7801,y=4835}},

        {Text="If you have Bronze Tube: Accept Look to The Stars", At="Look to The Stars", point={x=7980,y=4800}},
        {Text="If you have Bronze Tube: Deliver Look to The Stars", Dt={q="Look to The Stars"}, point={x=7980,y=4800}},
        {Text="If you have Bronze Tube: Accept Look to The Stars pt2", At="Look to The Stars", point={x=7980,y=4800}},

        {Text="Accept Worgen in the Woods", At="Worgen in the Woods", point={x=7556,y=4804}},

        {Text="Accept Raven Hill", At="Raven Hill", point={x=7532,y=4869}},
        {Text="Accept The Hermit", At="The Hermit", point={x=7532,y=4869}},
        {Text="Accept Deliveries to Sven", At="Deliveries to Sven", point={x=7532,y=4869}},
        {Text="Accept The Night Watch", At="The Night Watch", point={x=7360,y=4686}},

        {Text="Deliver The Legend of Stalvan", Dt={q="The Legend of Stalvan"}, point={x=7253,y=4685}},
        {Text="Accept The Legend of Stalvan (Maybe RP?)", At="The Legend of Stalvan", point={x=7253,y=4685}},

        {Text="Put HS in Darkshire", SetHs="Innkeeper Trelayne", point={x=7387,y=4441}},

        {Text="Accept Seasoned Wolf Kabobs", At="Seasoned Wolf Kabobs", point={x=7379,y=4332}},

        {Text="If Bronze Tube: Deliver at Blind Mary", Dt={q="Look to The Stars"}, point={x=8197,y=5910}},
        {Text="If Bronze Tube: Accept followup", At="Look to The Stars", point={x=8197,y=5910}},


        {Text="Kill Insane Ghoul (if look to the stars) and complete The Night Watch. Dont need to finish Skeletal Fingers",
            Mct={"Look To The Stars", "The Night Watch"}, point={x=8022,y=7095}},

        -- worgen in the woods now or later?

        {Text="Accept Eight-Legged Menaces at xroads (can kill wolves on way, not required)", At="Eight-Legged Menaces", point={x=4513,y=6702}},

        {Text="Deliver Raven Hill", Dt={q="Raven Hill"}, point={x=1834,y=5626}},
        {Text="Accept Jitters' Growling Gut", At="Jitters' Growling Gut", point={x=1834,y=5626}},

        {Text="Deliver Deliveries to Sven. Kill Pygmy Venom Spiders on the way (dont need complete)", 
            Dt={q="Deliveries to Sven"}, point={x=778,y=3406}, PinAdd="Make sure to get 6 Gooey Spider Legs from spiders"},

        {Text="Accept Sven's Revenge", At="Sven's Revenge", point={x=778,y=3406}},

        {Text="Accept Wolves at Our Heels", At="Wolves at Our Heels", point={x=771,y=3321}},

        {Text="Deliver The Hermit. Kill wolves/Pygmy Venom Spiders on the way", Dt={q="The Hermit"}, point={x=2811,y=3147}},
        {Text="Accept Supplies from Darkshire", At="Supplies from Darkshire", point={x=2811,y=3147}},

        {Text="Kill wolves back again toward Sentinel Hill.", Zone="Westfall", point={x=614,y=4060}},

        {Text="Get FP in Sentinel Hill.", Proximity=20, point={x=5656,y=5264}},
        {Text="Accept The Defias Brotherhood at tower.", At="The Defias Brotherhood", point={x=5630,y=4759}},
        
        -- TODO: How many arrows do i need to get to 25 at this point? Maybe already and dont buy any?
        {Text="Restock on lvl 10 arrows if not 25. Vendor. Dont accept quest",
            BuyItem={Npc="Quartermaster Lewis", Item="Sharp Arrow", Count=1}, point={x=5693,y=4720}},

        {Text="Deliver The Legend of Stalvan. If need bronze tube, look in NW corner in house for Box", 
            Dt={q="The Legend of Stalvan"}, point={x=4152,y=6673}},
        {Text="Accept The Legend of Stalvan. If need bronze tube, look in NW corner in house for Box", 
            At="The Legend of Stalvan", point={x=4152,y=6673}},

        {Text="Heartstone to Darkshire", Zone="Duskwood", UseItem="Hearthstone"},
        {Text="Turn Jitters' Growling Gut (inn) ", Dt={q="Jitters' Growling Gut"}, point={x=7381,y=4325}},
        {Text="Accept Dusky Crab Cakes", At="Dusky Crab Cakes", point={x=7381,y=4325}},
        {Text="Deliver Dusky Crab Cakes (if you had legs from earlier)", Dt={q="Dusky Crab Cakes"}, point={x=7381,y=4325}},
        {Text="Accept Return to Jitters", At="Return to Jitters", point={x=7381,y=4325}},
        
        {Text="Turn The Legend of Stalvan", Dt={q="The Legend of Stalvan"}, point={x=7255,y=4685}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=7255,y=4685}},

        {Text="Turn inn The Night Watch", Dt={q="The Night Watch"}, point={x=7360,y=4692}},
        {Text="Accept The Night Watch", At="The Night Watch", point={x=7360,y=4692}},

        -- don't accept yet. Will have full questlog
        --{Text="Accept Worgen in the Woods", At="Worgen in the Woods", point={x=7558,y=4791}},
        
        {Text="If had Bronze Tube: Turn inn Look To The Stars. Else check vendor Skip followup for now.", Dt={q="Look To The Stars"}, point={x=7980,y=4798}},
        
        -- don't accept yet. Will have full questlog
        --{Text="If had Bronze Tube: Accept Look To The Stars", At="Look To The Stars", point={x=7980,y=4798}},

        {Text="Discover the FP in Darkshire", Proximity=20, point={x=7749,y=4428}},

        {Text="Turn Supplies from Darkshire", Dt={q="Supplies from Darkshire"}, point={x=7586,y=4528}},
        {Text="Accept Ghost Hair Thread", At="Ghost Hair Thread", point={x=7586,y=4528}},
        
        z{Text="Deliver Ghost Hair Thread (blind mary to the south)", Dt={q="Ghost Hair Thread"}, point={x=8198,y=5908}},
        {Text="Accept Return the Comb", At="Return the Comb", point={x=8198,y=5908}},
        {Text="Deliver Return the Comb", Dt={q="Return the Comb"}, point={x=7581,y=4531}},
        {Text="Accept Deliver the Thread", At="Deliver the Thread", point={x=7581,y=4531}},

        -- Don't require 25 here actually. We're not taking the 25 quest in SW yet, and 
        -- being 25 will make more mobs in Redridge grey, so might as well avoid it.
        --{Text="Grind Spiders/wolves along northern bank until 25, then run Goldshire",
        --    Lvl={lvl=25}, point={x=6380,y=1650}},
        {Text="Run to Goldshire. Kill wolves/spiders on the way", Zone="Elwynn Forest"},

        {Text="Run to Goldshire, Turn inn The Price of Shoes", Dt={q="The Price of Shoes"}, point={x=4172,y=6555}},
        {Text="Accept Return to Verner", At="Return to Verner", point={x=4172,y=6555}},
        {Text="Turn inn The Legend of Stalvan (innkeeper)", Dt={q="The Legend of Stalvan"}, point={x=4377,y=6580}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=4377,y=6580}},
        {Text="Complete The Legend of Stalvan (chest second floor master bedroom)", Ct="The Legend of Stalvan", point={x=4432,y=6583}},

        {Text="Run to Stormwind", Zone="Stormwind City", point={x=3249,y=4971}, PinAdd="If lvl 25, also accept Accept A Noble Brew at lock trainer while in SW"},

        {Text="Turn inn The Legend of Stalvan (South of Park)", Dt={q="The Legend of Stalvan"}, point={x=2957,y=6193}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=2957,y=6193}},
        {Text="Deliver The Legend of Stalvan (chest next to you)", Dt={q="The Legend of Stalvan"}, point={x=2943,y=6150}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=2943,y=6150}},

        {Text="Go through trade district, outer ring toward old down, buy Stormwind Seasoning Herbs", 
            BuyItem={Npc="Felicia Gump", Item="Stormwind Seasoning Herbs", Count=1}, point={x=6425,y=6063}},

        {Text="Fly to Lakeshire", Taxi="Lakeshire, Redridge", point={x=6631,y=6228}},

        {Text="Accept Blackrock Bounty", At="Blackrock Bounty", point={x=3154,y=5787}},
        {Text="Accept Blackrock Menace", At="Blackrock Menace", point={x=3351,y=4896}},
        {Text="Accept The Everstill Bridge", At="The Everstill Bridge", point={x=3216,y=4866}},
        {Text="Deliver Return to Verner", Dt={q="Return to Verner"}, point={x=3098,y=4727}},
        {Text="Accept A Baying of Gnolls (skip underbelly scales)", At="A Baying of Gnolls", point={x=3098,y=4727}},

        {Text="Accept Solomon's Law (town hall)", At="Solomon's Law", point={x=2967,y=4433}},
        
        -- DONT put hs here, we want it in duskwood later
                
        {Text="Deliver The Defias Brotherhood (second floor inn) Skip followup", Dt={q="The Defias Brotherhood"},
            point={x=2647,y=4534}, PinAdd="If not completed Bellygrub quest, be on the lookout for it"},


        {Text="Complete A Baying of Gnolls and The Everstill Bridge (Take the west path). Can finish everstil later", 
            Mct={"A Baying of Gnolls", "The Everstill Bridge"}, point={x=1731,y=4424}},
        
        {Text="Turn inn A Baying of Gnolls", Dt={q="A Baying of Gnolls"}, point={x=3098,y=4728}},
        {Text="Accept Howling in the Hills (can turn in Everstil Bridge if done)", At="Howling in the Hills", point={x=3098,y=4728}},
        
        {Text="Turn inn The Everstill Bridge (if completed)", Dt={q="The Everstill Bridge", Item="Smith's Trousers", Vendor=1}, point={x=3216,y=4864}},

        {Text="Accept Wanted: Lieutenant Fangore (posted outside inn)", At="Wanted: Lieutenant Fangore", point={x=2674,y=4646}},
        {Text="Kill Yowler for Howling in the Hills, take same western path", Ct="Howling in the Hills", point={x=1731,y=4424}},

        {Text="Follow road north, complete Blackrock Quests (need to go in cave)",
            Mct={"Blackrock Bounty", "Blackrock Menace"}},

        -- Glowing Shadowhide Pendant? 1400xp, tower mid of elwyn, would be when going to logging camp, not sure worth?
        {Text="Run fast east, complete Solomon's Law and kill/loot Fangore",
            Mct={"Wanted: Lieutenant Fangore", "Solomon's Law"}, point={x=8018,y=3706},
            PinAdd="Can drop Glowing Shadowhide Pendant, if so keep in bags"},

        {Text="Deliver A Watchful Eye to the SE on statue. Skip followup", Dt={q="A Watchful Eye"}, point={x=8430,y=4690}},

        {Text="HS/Run back to Lakeshire, Turn in"},

        {Text="Run back to lakeshire, Deliver Solomon's Law (town hall)", Dt={q="Solomon's Law"}, point={x=2963,y=4427}},
        {Text="Deliver Wanted: Lieutenant Fangore (town hall) (dont take messenger q)", Dt={q="Wanted: Lieutenant Fangore"}, point={x=3002,y=4447}},

        {Text="Deliver Howling in the Hills", Dt={q="Howling in the Hills", Item="Ring of Iron Will", Use=1}, point={x=3098,y=4727}},
        {Text="Deliver Blackrock Menace", Dt={q="Blackrock Menace"}, point={x=3351,y=4896}},
        {Text="Deliver Blackrock Bounty", Dt={q="Blackrock Bounty"}, point={x=3153,y=5785}},

        -- deliver Glowing Shadowhide Pendant when going logging camp
        {Text="Run to Logging Camp east in Elwynn", Zone="Elwynn Forest", point={x=972,y=7145}},
        {Text="Deliver The Legend of Stalvan", Dt={q="The Legend of Stalvan"}, point={x=8460,y=6935}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=8460,y=6935}},
        {Text="Loot Faded Journal from chest (second floor in house)", Ct="The Legend of Stalvan", point={x=8568,y=6956}},
        {Text="Deliver The Legend of Stalvan", Dt={q="The Legend of Stalvan"}, point={x=8460,y=6935}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=8460,y=6935}},

        {Text="If you found Glowing Shadowhide Pendant, accept the Q and turnin in tower to the west", 
            Dt={q="Theocritus Retrieval"}, point={x=6460,y=6942}},




        -- make sure we already have night watch at this point
        --{Text="Accept The Night Watch", At="The Night Watch", point={x=7359,y=4690}},

        {Text="Grind northern shore to Abercrombie and turn inn Deliver the Thread", 
            Dt={q="Deliver the Thread"}, point={x=2809,y=3145}, PinAdd="Complete 8legged Menaces, wolf kabobs and Wolves at our heels on the way"},
        
        {Text="Accept Zombie Juice", At="Zombie Juice", point={x=2809,y=3145}},
        
        {Text="Make sure Eight-Legged Menaces and Wolf kabobs/at our heels are done", 
            Mct={"Eight-Legged Menaces", "Seasoned Wolf Kabobs", "Wolves at Our Heels"}, point={x=771,y=3319}},
        {Text="Turn inn Wolves at Our Heels", Dt={q="Wolves at Our Heels"}, point={x=771,y=3319}},

        {Text="Complete The Night Watch at cemetary", Ct="The Night Watch", point={x=1664,y=4668}},
        {Text="Turn inn Return to Jitters", Dt={q="Return to Jitters"}, point={x=1828,y=5652}},
        {Text="Turn inn Eight-Legged Menaces", Dt={q="Eight-Legged Menaces"}, point={x=4509,y=6702}},
        {Text="Turn Sven's Revenge (mound of dirt between houses at farm)", Dt={q="Sven's Revenge"}, point={x=4985,y=7771}},
        {Text="Accept Sven's Camp", At="Sven's Camp", point={x=4985,y=7771}},
        
        {Text="Heartstone to Darkshire", Zone="Duskwood", UseItem="Hearthstone"},
        
        {Text="Turn inn Seasoned Wolf Kabobs (chef)", Dt={q="Seasoned Wolf Kabobs"}, point={x=7387,y=4348}},
        {Text="Turn inn Zombie Juice (tavernkeep smits)", Dt={q="Zombie Juice"}, point={x=7380,y=4445}},
        {Text="Accept Gather Rot Blossoms", At="Gather Rot Blossoms", point={x=7380,y=4445}},
        

        {Text="Deliver The Legend of Stalvan (Darkshire, innkeeper)", Dt={q="The Legend of Stalvan"}, point={x=7378,y=4449}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=7378,y=4449}},

        {Text="Deliver The Legend of Stalvan (outside inn)", Dt={q="The Legend of Stalvan"}, point={x=7359,y=4690}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=7359,y=4690}},

        {Text="Deliver The Legend of Stalvan (Townhall)", Dt={q="The Legend of Stalvan"}, point={x=7260,y=4685}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=7260,y=4685}},

        {Text="Deliver The Legend of Stalvan (outside inn)", Dt={q="The Legend of Stalvan"}, point={x=7359,y=4690}},
        {Text="Accept The Legend of Stalvan", At="The Legend of Stalvan", point={x=7359,y=4690}},


        {Text="If have A Noble Brew, fly wetlands. If not, consider picking it in SW; then wetlands?",  point={x=7749,y=4429},
            PinAdd="Delete remaining Sharp Arrows while flying, restocking in Menethil"},
    }
}

--[[
25 ARROWS WHERE????

===== FLY TO STORMWIND =====
buy level 25 arrows

Run to warlock trainer
Accept A Noble Brew

train hunter skills? Only if lvl 26

===== FLY TO MENETHIL ======
]]