# Called from: calamity:game_state/timer, calamity:game_state/toast/blue_wins,
#   calamity:game_state/toast/red_wins, calamity:load/setup_scoreboards, calamity:points/sequencer,
#   #calamity:load_arena_<all>

#>--------------------------------------------------------------------------------------------------
#> Purpose: Check the iron mines in the crosslane and update the objective score
#>--------------------------------------------------------------------------------------------------

# Update the bossbar max value to corrolate with how much ore is left in the mines
# Check out how many iron_ore blocks are in this area and store it
scoreboard players set #arenaAction gameVariable 3
function calamity:arena/handler
execute store result bossbar calamity:iron_ore max run scoreboard players get OreLeft gameVariable

# Update the bossbar current value and color with the score of whoever is currently winning
# Check the scores
scoreboard players operation #tempVar gameVariable = BluePoints gameVariable
scoreboard players operation #tempVar gameVariable -= RedPoints gameVariable
# Update bossbar color based on who is in the lead
    # Blue is in the lead!
    execute if score #tempVar gameVariable matches 1.. run bossbar set calamity:iron_ore color blue
    execute if score #tempVar gameVariable matches 1.. run execute store result bossbar calamity:iron_ore value run scoreboard players get BluePoints gameVariable
    execute if score #tempVar gameVariable matches 1.. unless score #TeamInLead gameVariable matches 1 run stopsound @a * calamity:calamity.announcer.lead.friendly
    execute if score #tempVar gameVariable matches 1.. unless score #TeamInLead gameVariable matches 1 run stopsound @a * calamity:calamity.announcer.lead.enemy
    execute if score #tempVar gameVariable matches 1.. unless score #TeamInLead gameVariable matches 1 run playsound calamity:calamity.announcer.lead.friendly master @a[team=blue] 136 150 89 500
    execute if score #tempVar gameVariable matches 1.. unless score #TeamInLead gameVariable matches 1 run playsound calamity:calamity.announcer.lead.enemy master @a[team=red] 136 150 89 500
    execute if score #tempVar gameVariable matches 1.. run scoreboard players set #TeamInLead gameVariable 1
    # The game is tied!
    execute if score #tempVar gameVariable matches 0 run execute store result bossbar calamity:iron_ore value run scoreboard players get OreLeft gameVariable
    execute if score #tempVar gameVariable matches 0 run bossbar set calamity:iron_ore color purple
    # Red is in the lead!
    execute if score #tempVar gameVariable matches ..-1 run execute store result bossbar calamity:iron_ore value run scoreboard players get RedPoints gameVariable
    execute if score #tempVar gameVariable matches ..-1 run bossbar set calamity:iron_ore color red
    execute if score #tempVar gameVariable matches ..-1 unless score #TeamInLead gameVariable matches 2 run stopsound @a * calamity:calamity.announcer.lead.friendly
    execute if score #tempVar gameVariable matches ..-1 unless score #TeamInLead gameVariable matches 2 run stopsound @a * calamity:calamity.announcer.lead.enemy
    execute if score #tempVar gameVariable matches ..-1 unless score #TeamInLead gameVariable matches 2 run playsound calamity:calamity.announcer.lead.friendly master @a[team=red] 136 150 89 500
    execute if score #tempVar gameVariable matches ..-1 unless score #TeamInLead gameVariable matches 2 run playsound calamity:calamity.announcer.lead.enemy master @a[team=blue] 136 150 89 500
    execute if score #tempVar gameVariable matches ..-1 run scoreboard players set #TeamInLead gameVariable 2
# Always reset the #tempVar
scoreboard players reset #tempVar gameVariable

# REGULAR TIMER
# Always update the bossbar name with new information
# Display this actionbar when the seconds are in the single-digits (0 to 9 seconds)
execute if score displaySecond gameVariable matches 0..9 run bossbar set calamity:iron_ore name {"translate":"%s %s  %s %s","with":[{"translate":"3","font":"calamity:icons"},{"translate":"%s:0%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} }]},{"translate":"i","font":"calamity:icons","color":"white"},{"score":{"name": "OreLeft","objective": "gameVariable"}}]}
# Display this actionbar when the seconds are in the double-digits (10 to 59 seconds)
execute if score displaySecond gameVariable matches 10.. run bossbar set calamity:iron_ore name {"translate":"%s %s  %s %s","with":[{"translate":"3","font":"calamity:icons"},{"translate":"%s:%s","with":[{"score":{"name":"displayMinute", "objective":"gameVariable"} },{"score":{"name":"displaySecond", "objective":"gameVariable"} } ]},{"translate":"i","font":"calamity:icons","color":"white"},{"score":{"name": "OreLeft","objective": "gameVariable"}}]}

# Update the sidebar
scoreboard players operation ░░░░░ displayPoints = OreLeft gameVariable
scoreboard players operation Blue displayPoints = BluePoints gameVariable
scoreboard players operation Red displayPoints = RedPoints gameVariable

# Update team-wide streak in sidebar
# Blue
execute if score #BlueStreakTimer gameVariable matches ..0 if score #BlueStreak gameVariable matches ..0 run team modify fakeBlue suffix {"translate":"spacer.left","color":"blue","with": [{"translate":"b","font":"calamity:icons"}]}
execute if score #BlueStreakTimer gameVariable matches ..0 if score #BlueStreak gameVariable matches 1.. run scoreboard players set #BlueStreak gameVariable 0
execute if score #BlueStreakTimer gameVariable matches 120 if score #BlueStreak gameVariable matches 1..100 run function calamity:player/update_displays/blue_sidebar_streak/start/1_100_points
execute if score #BlueStreakTimer gameVariable matches 120 if score #BlueStreak gameVariable matches 101..200 run function calamity:player/update_displays/blue_sidebar_streak/start/101_200_points
execute if score #BlueStreakTimer gameVariable matches 120 if score #BlueStreak gameVariable matches 201..300 run function calamity:player/update_displays/blue_sidebar_streak/start/201_300_points
execute if score #BlueStreakTimer gameVariable matches 115 if score #BlueStreak gameVariable matches 1..100 run function calamity:player/update_displays/blue_sidebar_streak/decay1/1_100_points
execute if score #BlueStreakTimer gameVariable matches 115 if score #BlueStreak gameVariable matches 101..200 run function calamity:player/update_displays/blue_sidebar_streak/decay1/101_200_points
execute if score #BlueStreakTimer gameVariable matches 115 if score #BlueStreak gameVariable matches 201..300 run function calamity:player/update_displays/blue_sidebar_streak/decay1/201_300_points
execute if score #BlueStreakTimer gameVariable matches 80 if score #BlueStreak gameVariable matches 1..100 run function calamity:player/update_displays/blue_sidebar_streak/decay2/1_100_points
execute if score #BlueStreakTimer gameVariable matches 80 if score #BlueStreak gameVariable matches 101..200 run function calamity:player/update_displays/blue_sidebar_streak/decay2/101_200_points
execute if score #BlueStreakTimer gameVariable matches 80 if score #BlueStreak gameVariable matches 201..300 run function calamity:player/update_displays/blue_sidebar_streak/decay2/201_300_points
execute if score #BlueStreakTimer gameVariable matches 40 if score #BlueStreak gameVariable matches 1..100 run function calamity:player/update_displays/blue_sidebar_streak/decay3/1_100_points
execute if score #BlueStreakTimer gameVariable matches 40 if score #BlueStreak gameVariable matches 101..200 run function calamity:player/update_displays/blue_sidebar_streak/decay3/101_200_points
execute if score #BlueStreakTimer gameVariable matches 40 if score #BlueStreak gameVariable matches 201..300 run function calamity:player/update_displays/blue_sidebar_streak/decay3/201_300_points
execute if score #BlueStreakTimer gameVariable matches 1.. if score #BlueStreak gameVariable matches 301.. run team modify fakeBlue suffix {"translate":" %s %s","color":"blue","with": [{"translate":"b","font":"calamity:icons"},{"text":"∞","color":"gray","italic":true}]}
# Red
execute if score #RedStreakTimer gameVariable matches ..0 if score #RedStreak gameVariable matches ..0 run team modify fakeRed suffix {"translate":"spacer.left","color":"red","with": [{"translate":"r","font":"calamity:icons"}]}
execute if score #RedStreakTimer gameVariable matches ..0 if score #RedStreak gameVariable matches 1.. run scoreboard players set #RedStreak gameVariable 0
execute if score #RedStreakTimer gameVariable matches 120 if score #RedStreak gameVariable matches 1..100 run function calamity:player/update_displays/red_sidebar_streak/start/1_100_points
execute if score #RedStreakTimer gameVariable matches 120 if score #RedStreak gameVariable matches 101..200 run function calamity:player/update_displays/red_sidebar_streak/start/101_200_points
execute if score #RedStreakTimer gameVariable matches 120 if score #RedStreak gameVariable matches 201..300 run function calamity:player/update_displays/red_sidebar_streak/start/201_300_points
execute if score #RedStreakTimer gameVariable matches 115 if score #RedStreak gameVariable matches 1..100 run function calamity:player/update_displays/red_sidebar_streak/decay1/1_100_points
execute if score #RedStreakTimer gameVariable matches 115 if score #RedStreak gameVariable matches 101..200 run function calamity:player/update_displays/red_sidebar_streak/decay1/101_200_points
execute if score #RedStreakTimer gameVariable matches 115 if score #RedStreak gameVariable matches 201..300 run function calamity:player/update_displays/red_sidebar_streak/decay1/201_300_points
execute if score #RedStreakTimer gameVariable matches 80 if score #RedStreak gameVariable matches 1..100 run function calamity:player/update_displays/red_sidebar_streak/decay2/1_100_points
execute if score #RedStreakTimer gameVariable matches 80 if score #RedStreak gameVariable matches 101..200 run function calamity:player/update_displays/red_sidebar_streak/decay2/101_200_points
execute if score #RedStreakTimer gameVariable matches 80 if score #RedStreak gameVariable matches 201..300 run function calamity:player/update_displays/red_sidebar_streak/decay2/201_300_points
execute if score #RedStreakTimer gameVariable matches 40 if score #RedStreak gameVariable matches 1..100 run function calamity:player/update_displays/red_sidebar_streak/decay3/1_100_points
execute if score #RedStreakTimer gameVariable matches 40 if score #RedStreak gameVariable matches 101..200 run function calamity:player/update_displays/red_sidebar_streak/decay3/101_200_points
execute if score #RedStreakTimer gameVariable matches 40 if score #RedStreak gameVariable matches 201..300 run function calamity:player/update_displays/red_sidebar_streak/decay3/201_300_points
execute if score #RedStreakTimer gameVariable matches 1.. if score #RedStreak gameVariable matches 301.. run team modify fakeRed suffix {"translate":" %s %s","color":"red","with": [{"translate":"r","font":"calamity:icons"},{"text":"∞","color":"gray","italic":true}]}

# 0.5 white
# 2.5 green
# 3 gray
# 3 dark gray