# Called from: #calamity:register_player

#>--------------------------------------------------------------------------------------------------
#> Purpose: Send a welcome message and additional information for this arena.
#>--------------------------------------------------------------------------------------------------

# Calamity: Definitive Edition
# Created by: Moesh
# Additional scripting by: Jeven, gibbsly, NateThePlate, Ts, and Vilder50
# Translation: [en_us] by Moesh
# Objective: Calamity is a resource management team race. The first team to get to the point limit wins. Gaining points isn't the only way to win. You can lower the point limit by removing iron ore from the mines.

tellraw @s {"text":"\n"}
tellraw @s {"translate":"system.message","color":"green","with":[{"translate":"spacer.middle","color":"light_purple","bold": true,"with":[{"translate":"map.name"},{"translate":"by.author","color":"light_purple","with":[{"translate":"map.author"}]}]}]}
tellraw @s {"translate":"system.message","color":"green","with":[{"translate":"calamity.welcome.scripting.by","with":[{"translate":"calamity.welcome.scripting.by.value","color":"white","italic": true}]}]}
tellraw @s {"translate":"system.message","color":"green","with":[{"translate":"calamity.welcome.translation.by","with":[{"translate":"calamity.welcome.translation.by.value","color":"white","italic": true,"with":[{"translate":"translator.name"}]}]}]}
tellraw @s {"translate":"system.message","color":"gray","with":[{"translate":"arena.shattering.welcome.objective", "italic": true,"with":[{"translate":"calamity.click.here","underlined": true,"color": "blue","hoverEvent": {"action": "show_text","value": {"translate":"calamity.hover.viewGitHub"}},"clickEvent": {"action": "open_url","value": "https://github.com/Moesh/Calamity#calamity-definitive-edition"}}]}]}
tellraw @s {"translate":"system.message","color":"green","with":[{"translate":"arena.calamity.welcome","with":[{"translate":"arena.shattering.name","color":"white"},{"translate":"arena.shattering.author","underlined": true,"color": "blue","hoverEvent": {"action": "show_text","value": {"translate":"calamity.hover.panguino.twitter"}},"clickEvent": {"action": "open_url","value": "https://twitter.com/Panguino"}}]}]}