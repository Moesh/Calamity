# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Red has won the game, let's announce it
#---------------------------------------------------------------------------------------------------

function calamity:points/update_displays

scoreboard players operation #tempVar gameVariable = RedPoints gameVariable
scoreboard players operation #tempVar gameVariable -= BluePoints gameVariable
# Example: ">>> 100 to 42. Red r won by 58 points!"
tellraw @a {"translate":"system.message","with":[{"translate":"calamity.match.stats","color": "green","with":[{"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"},{"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"},{"translate":"team.red","color":"red"},{"translate":"calamity.icon.red_team","font": "calamity:icons","color":"red"},{"score":{"name": "#tempVar","objective": "gameVariable"},"color": "red"}]}]}

title @a times 20 200 20
title @a[team=red] subtitle {"translate":"calamity.prestige.won","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"translate":"calamity.icon.glory","font":"calamity:icons"}
title @a[team=blue] subtitle {"translate":"calamity.prestige.lost","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"translate":"calamity.icon.calamity","font":"calamity:icons"}

function calamity:game_state/end_match