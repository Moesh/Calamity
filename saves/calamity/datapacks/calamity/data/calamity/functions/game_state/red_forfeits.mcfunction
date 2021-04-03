# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Red has forfeited, let's have a prestige for the Blue team!
#---------------------------------------------------------------------------------------------------
tellraw @a {"translate":"system.message","color": "red","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.red"},{"translate":"r","font": "calamity:icons"}]}]}
# Example: ">>> 250 to 75. Blue r won by 175 points in 03:43 T!"
scoreboard players operation #tempVar gameVariable = RedPoints gameVariable
scoreboard players operation #tempVar gameVariable -= BluePoints gameVariable
execute if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.message", "with":[ { "translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "red"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:0%s", "with": [ {"score":{"name":"displayMinute", "objective":"gameVariable"} }, {"score":{"name":"displaySecond", "objective":"gameVariable"} } ] }, {"translate":"3","font":"calamity:icons"} ] } ] } ] }
execute if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.message", "with":[ {"translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "red"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]},{"translate":"3","font":"calamity:icons"}]} ] } ] }
title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"calamity.prestige.redForfeit.blue","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"translate":"G","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"calamity.prestige.redForfeit.red","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"translate":"C","font":"calamity:icons"}