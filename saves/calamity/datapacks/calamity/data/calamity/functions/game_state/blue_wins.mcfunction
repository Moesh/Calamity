# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has won the game, let's announce it
#---------------------------------------------------------------------------------------------------

function calamity:points/update_displays

# Example: ">>> 250 to 42. Blue wins!"
tellraw @a {"translate":"%s %s to %s. %s wins!","color":"white","with":[{"text":">>>","color":"white"},{"score":{"name": "BluePoints","objective": "gameVariable"},"color": "blue"},{"score":{"name": "RedPoints","objective": "gameVariable"},"color": "red"},{"translate":"team.name.blue","color":"blue"}]}
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable

title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"Won by %s points","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"text":"G","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"Lost by %s points","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"text":"C","font":"calamity:icons"}

function calamity:game_state/end_match