# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Red has forfeited, let's have a prestige for the Blue team!
#---------------------------------------------------------------------------------------------------

tellraw @a {"translate":">>> Red has forfeited!"}
title @a times 20 200 20
title @a[team=blue] subtitle {"translate":"Red gracefully gave up","color": "green","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=blue] title {"text":"G","font":"calamity:icons"}
title @a[team=red] subtitle {"translate":"You'll fight again another day","color": "red","with": [ { "score": { "name":"#tempVar", "objective":"gameVariable"},"color": "white" } ]}
title @a[team=red] title {"text":"C","font":"calamity:icons"}