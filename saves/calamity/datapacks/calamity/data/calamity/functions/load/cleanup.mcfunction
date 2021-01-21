# Called from: #calamity:load

#---------------------------------------------------------------------------------------------------
# Purpose: Handles clean-up from loading between sessions. This is a pretty nebulous function.
#---------------------------------------------------------------------------------------------------

# Remove iron ore bossbar if game was force reloaded or left early.
bossbar remove calamity:iron_ore