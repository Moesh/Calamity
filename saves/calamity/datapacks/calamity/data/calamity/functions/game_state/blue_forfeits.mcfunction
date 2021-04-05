# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has forfeited, let's have a prestige for the Red team!
#---------------------------------------------------------------------------------------------------

tellraw @a {"translate":"system.message","color": "blue","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.blue"},{"translate":"b","font": "calamity:icons"}]}]}
# Example: ">>> 250 to 75. Blue r won by 175 points in 03:43 T!"
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable
execute if score displaySecond gameVariable matches 0..9 run tellraw @a { "translate":"system.message", "with":[ { "translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:0%s", "with": [ {"score":{"name":"displayMinute", "objective":"gameVariable"} }, {"score":{"name":"displaySecond", "objective":"gameVariable"} } ] }, {"translate":"3","font":"calamity:icons"} ] } ] } ] }
execute if score displaySecond gameVariable matches 10.. run tellraw @a { "translate":"system.message", "with":[ {"translate":"calamity.match.stats","color": "green", "with":[ {"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"}, {"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"}, {"translate":"team.blue","color":"blue"}, {"translate":"b","font": "calamity:icons","color":"blue"}, {"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}, {"translate":"spacer.middle","color":"white","with":[{"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]},{"translate":"3","font":"calamity:icons"}]} ] } ] }
title @a times 20 200 20
title @a[team=red] subtitle {"translate":"calamity.prestige.blueForfeit.red","color": "green"}
title @a[team=red] title {"translate":"G","font":"calamity:icons"}
title @a[team=blue] subtitle {"translate":"calamity.prestige.blueForfeit.blue","color": "red"}
title @a[team=blue] title {"translate":"C","font":"calamity:icons"}