# Called from: #calamity:register_player

#---------------------------------------------------------------------------------------------------
# Purpose: Send a welcome message and additional information for this arena.
#---------------------------------------------------------------------------------------------------

tellraw @s {"translate":"%s Welcome to Calamity: Definitive Edition! Created by Moesh.","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tellraw @s {"translate":"%s Check your recipe book for new 2x2 and 3x3 recipes! Scaffolding can be used as planks! The lobby is a half-sized recreation of the map! Use /trigger to see a list of commands.","color": "gray", "italic": true,"with":[{"text":">>>","color":"white","italic": false}]}