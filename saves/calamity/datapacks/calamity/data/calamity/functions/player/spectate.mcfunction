# Called from: calamity:tick

#---------------------------------------------------------------------------------------------------
# Purpose: Register the player on all the scoreboard they need. Enable triggers and set default
#---------------------------------------------------------------------------------------------------

# Heal players so they don't die when losing health.
effect clear @s
effect give @s minecraft:instant_health 5 30 false
clear @s
# Add them to spectator after healing them
gamemode spectator @s