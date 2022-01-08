# Called from: calamity:tick_match

#>--------------------------------------------------------------------------------------------------
#> Purpose: Add up points when a player gains them, send messages, and update displays
#>--------------------------------------------------------------------------------------------------

scoreboard players set @a prepScore 0

# Add up points
execute as @a[tag=Playing] run function calamity:points/check_if_crafted_items
execute as @a[tag=Playing] run scoreboard players operation @s prepScore += @s captureScore
scoreboard players set @a captureScore 0
execute as @a[tag=Playing] run scoreboard players operation @s prepScore += @s killScore
scoreboard players set @a killScore 0

# Add to team's pool of points
scoreboard players operation BluePoints gameVariable += @a[team=blue] prepScore
scoreboard players operation RedPoints gameVariable += @a[team=red] prepScore

# Add to the streak for the last 10 seconds
# Blue
scoreboard players set #tempVar gameVariable 0
scoreboard players operation #tempVar gameVariable += @a[team=blue] prepScore
execute if score #BlueStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 1.. run scoreboard players set #BlueStreakTimer gameVariable 200
execute if score #BlueStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 1.. run scoreboard players operation #BlueStreak gameVariable = #tempVar gameVariable
execute if score #BlueStreakTimer gameVariable matches 1.. if score #tempVar gameVariable matches 1.. run scoreboard players set #BlueStreakTimer gameVariable 200
execute if score #BlueStreakTimer gameVariable matches 1.. if score #tempVar gameVariable matches 1.. run scoreboard players operation #BlueStreak gameVariable += #tempVar gameVariable
execute if score #BlueStreakTimer gameVariable matches 1.. run scoreboard players remove #BlueStreakTimer gameVariable 1
execute if score #BlueStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 0 run scoreboard players set #BlueStreak gameVariable 0
# Red
scoreboard players set #tempVar gameVariable 0
scoreboard players operation #tempVar gameVariable += @a[team=red] prepScore
execute if score #RedStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 1.. run scoreboard players set #RedStreakTimer gameVariable 200
execute if score #RedStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 1.. run scoreboard players operation #RedStreak gameVariable = #tempVar gameVariable
execute if score #RedStreakTimer gameVariable matches 1.. if score #tempVar gameVariable matches 1.. run scoreboard players set #RedStreakTimer gameVariable 200
execute if score #RedStreakTimer gameVariable matches 1.. if score #tempVar gameVariable matches 1.. run scoreboard players operation #RedStreak gameVariable += #tempVar gameVariable
execute if score #RedStreakTimer gameVariable matches 1.. run scoreboard players remove #RedStreakTimer gameVariable 1
execute if score #RedStreakTimer gameVariable matches 0 if score #tempVar gameVariable matches 0 run scoreboard players set #RedStreak gameVariable 0

# Update streak
execute as @a[tag=Playing] run scoreboard players operation @s nextStreakLevel += @s prepScore
execute as @a[tag=Playing] run scoreboard players operation @s streakPoints += @s prepScore
execute as @a[scores={timeSinceDeath=0,streakPoints=1..}] at @s run function calamity:points/end_streak_on_death
execute as @a[scores={nextStreakLevel=15..}] run function calamity:points/award_new_streak_level
execute as @a[scores={prepScore=1..}] run function calamity:points/send_points_gained_message

function calamity:player/update_displays