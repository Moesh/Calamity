# Called from: calamity:game_state/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Blue has forfeited, let's have a prestige for the Red team!
#---------------------------------------------------------------------------------------------------

tellraw @a {"translate":">>> Blue has forfeited!"}
title @a times 20 200 20
title @a[team=red] subtitle {"translate":"Blue knew not to mess with you!","color": "green"}
title @a[team=red] title {"text":"G","font":"calamity:icons"}
title @a[team=blue] subtitle {"translate":"You've kept your dignity","color": "red"}
title @a[team=blue] title {"text":"C","font":"calamity:icons"}