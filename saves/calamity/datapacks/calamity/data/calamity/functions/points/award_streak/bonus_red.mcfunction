# Called from: calamity:points/award_streak/award_level_[1-6]

#>--------------------------------------------------------------------------------------------------
#> Purpose: Announce and give bonus
#>--------------------------------------------------------------------------------------------------

scoreboard players add RedPoints gameVariable 10
tellraw @a {"translate":"system.message","with":[{"translate":"%s gains a %s point bonus!","color": "green","with":[{"translate":"spacer.middle","with":[{"translate":"team.red","color":"red"}, {"translate":"r","font": "calamity:icons","color":"red"}]}]}]}
