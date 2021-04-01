# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Red has forfeited, let's have a prestige for the Blue team!
#---------------------------------------------------------------------------------------------------
tellraw @a {"translate":"system.message","color": "red","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.name.red"},{"translate":"calamity.icon.red_team","font": "calamity:icons"}]}]}
title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"calamity.prestige.redForfeit.blue","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"translate":"calamity.icon.glory","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"calamity.prestige.redForfeit.red","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"translate":"calamity.icon.calamity","font":"calamity:icons"}