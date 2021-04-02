# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has won the game, let's announce it
#---------------------------------------------------------------------------------------------------

function calamity:points/update_displays

scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable
# Example: ">>> 250 to 75. Blue r won by 175 points!"
tellraw @a {"translate":"system.message","with":[{"translate":"calamity.match.stats","color": "green","with":[{"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"},{"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"},{"translate":"team.blue","color":"blue"},{"translate":"b","font": "calamity:icons","color":"blue"},{"score":{"name": "#tempVar","objective": "gameVariable"},"color": "blue"}]}]}

title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"calamity.prestige.won","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"translate":"G","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"calamity.prestige.lost","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"translate":"C","font":"calamity:icons"}

function calamity:game_state/end_match