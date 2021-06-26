tellraw @a { "translate":"system.message", "color":"white", "with":[ { "translate":"calamity.streak.level4", "color":"yellow", "with":[ {"selector": "@s"} ] } ] }
execute if entity @s[team=blue] run function calamity:points/award_streak/bonus_blue
execute if entity @s[team=red] run function calamity:points/award_streak/bonus_red