# Called from: calamity:points/award_new_streak_level

#>--------------------------------------------------------------------------------------------------
#> Purpose: Make announcement and award team bonus
#>--------------------------------------------------------------------------------------------------

tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level2", "color":"dark_aqua", "with":[ {"selector": "@s"} ] } ] }
execute if entity @s[team=blue] run function calamity:points/award_streak/bonus_blue
execute if entity @s[team=red] run function calamity:points/award_streak/bonus_red