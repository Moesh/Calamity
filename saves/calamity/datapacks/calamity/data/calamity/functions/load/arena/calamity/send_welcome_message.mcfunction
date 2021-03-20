# Called from: #calamity:register_player

#---------------------------------------------------------------------------------------------------
# Purpose: Send a welcome message and additional information for this arena.
#---------------------------------------------------------------------------------------------------

tellraw @s {"translate":"%s Welcome to Calamity: Definitive Edition! Created by Moesh.","color":"light_purple","with":[{"text":">>>","color":"white"}]}
tellraw @s {"translate":"%s Objective: Collect enough points to reach the score goal. Click %s to view the online readme!","color": "gray", "italic": true,"with":[{"text":">>>","color":"white","italic": false},{"translate":"here","underlined": true,"color": "blue","hoverEvent": {"action": "show_text","value": {"translate":"View the GitHub repo."}},"clickEvent": {"action": "open_url","value": "https://github.com/Moesh/Calamity/tree/develop#calamity-definitive-edition"}}]}