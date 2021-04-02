# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Red has forfeited, let's have a prestige for the Blue team!
#---------------------------------------------------------------------------------------------------
tellraw @a {"translate":"system.message","color": "red","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.red"},{"translate":"r","font": "calamity:icons"}]}]}
title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"calamity.prestige.redForfeit.blue","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"translate":"G","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"calamity.prestige.redForfeit.red","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"translate":"C","font":"calamity:icons"}