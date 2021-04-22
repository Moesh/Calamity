# Called from: calamity:game_state/timer_start_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Checks if the game can be started
#>--------------------------------------------------------------------------------------------------

# At least one player must be active in order for the game to start. This is a hidden variable as it
#   is only checked here and no where else. We'll reset at the end of the file. This could be
#   considered one way to work with private variables...
scoreboard players set #PlayersPlaying gameVariable 2
execute unless entity @a[team=blue] run scoreboard players remove #PlayersPlaying gameVariable 1
execute unless entity @a[team=red] run scoreboard players remove #PlayersPlaying gameVariable 1