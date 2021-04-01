# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has forfeited, let's have a prestige for the Red team!
#---------------------------------------------------------------------------------------------------

tellraw @a {"translate":"system.message","color": "blue","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.blue"},{"translate":"calamity.icon.blue_team","font": "calamity:icons"}]}]}
title @a times 20 200 20
title @a[team=red] subtitle {"translate":"calamity.prestige.blueForfeit.red","color": "green"}
title @a[team=red] title {"translate":"calamity.icon.glory","font":"calamity:icons"}
title @a[team=blue] subtitle {"translate":"calamity.prestige.blueForfeit.blue","color": "red"}
title @a[team=blue] title {"translate":"calamity.icon.calamity","font":"calamity:icons"}