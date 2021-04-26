# Called from: #calamity:register_player

#>--------------------------------------------------------------------------------------------------
#> Purpose: Send a welcome message and additional information for this arena.
#>--------------------------------------------------------------------------------------------------

# Calamity: Definitive Edition
# Created by: Moesh
# Additional scripting by: Jeven, gibbsly, NateThePlate, Ts, and Vilder50
# Translation: [en_us] by Moesh
# Objective: Calamity is a resource management team race. The first team to get to the point limit wins. Gaining points isn't the only way to win. You can lower the point limit by removing iron ore from the mines.


tellraw @a {"translate":"system.message","color":"green","with":[{"translate":"calamity.welcome"}]}
tellraw @a {"translate":"system.message","color":"gray","with":[{"translate":"calamity.welcome.objective", "italic": true,"with":[{"translate":"calamity.click.here","underlined": true,"color": "blue","hoverEvent": {"action": "show_text","value": {"translate":"calamity.hover.viewGitHub"}},"clickEvent": {"action": "open_url","value": "https://github.com/Moesh/Calamity#calamity-definitive-edition"}}]}]}