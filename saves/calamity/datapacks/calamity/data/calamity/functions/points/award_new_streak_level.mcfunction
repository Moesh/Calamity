# Called from: calamity:points/sequencer

#>--------------------------------------------------------------------------------------------------
#> Purpose: Announce and give the award for new streak levels
#>--------------------------------------------------------------------------------------------------

execute if score @s streakLevel matches 0 run function calamity:points/award_streak/award_level_1
execute if score @s streakLevel matches 1 run function calamity:points/award_streak/award_level_2
execute if score @s streakLevel matches 2 run function calamity:points/award_streak/award_level_3
execute if score @s streakLevel matches 3 run function calamity:points/award_streak/award_level_4
execute if score @s streakLevel matches 4 run function calamity:points/award_streak/award_level_5
execute if score @s streakLevel matches 5.. run function calamity:points/award_streak/award_level_6

scoreboard players add @s streakLevel 1

scoreboard players remove @s nextStreakLevel 15

execute if score @s nextStreakLevel matches 15.. run function calamity:points/award_new_streak_level