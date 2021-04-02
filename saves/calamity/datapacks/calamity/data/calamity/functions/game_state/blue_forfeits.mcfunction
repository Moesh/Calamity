# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has forfeited, let's have a prestige for the Red team!
#---------------------------------------------------------------------------------------------------

tellraw @a {"translate":"system.message","color": "blue","with":[{"translate":"calamity.forfeit","with":[{"translate":"team.blue"},{"translate":"b","font": "calamity:icons"}]}]}
title @a times 20 200 20
title @a[team=red] subtitle {"translate":"calamity.prestige.blueForfeit.red","color": "green"}
title @a[team=red] title {"translate":"G","font":"calamity:icons"}
title @a[team=blue] subtitle {"translate":"calamity.prestige.blueForfeit.blue","color": "red"}
title @a[team=blue] title {"translate":"C","font":"calamity:icons"}