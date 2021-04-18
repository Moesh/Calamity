# Called from: #calamity:register_player

#---------------------------------------------------------------------------------------------------
# Purpose: Send a welcome message and additional information for this arena.
#---------------------------------------------------------------------------------------------------

tellraw @s {"translate":"system.message","color":"green","with":[{"translate":"calamity.welcome"}]}
tellraw @s {"translate":"system.message","color":"gray","with":[{"translate":"calamity.welcome.objective", "italic": true,"with":[{"translate":"calamity.click.here","underlined": true,"color": "blue","hoverEvent": {"action": "show_text","value": {"translate":"calamity.hover.viewGitHub"}},"clickEvent": {"action": "open_url","value": "https://github.com/Moesh/Calamity/tree/develop#calamity-definitive-edition"}}]}]}