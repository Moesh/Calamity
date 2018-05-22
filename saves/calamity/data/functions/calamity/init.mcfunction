# Remove Scoreboard Objectives
scoreboard objectives remove CONST

scoreboard objectives remove AffectedItems
scoreboard objectives remove gameRules
scoreboard objectives remove health
scoreboard objectives remove QueryResult
scoreboard objectives remove SuccessCount
scoreboard objectives remove loggedOff

scoreboard objectives remove teamSelected
scoreboard objectives remove classSelected
scoreboard objectives remove startRound
scoreboard objectives remove spectate

scoreboard objectives remove counter
scoreboard objectives remove progressLights
scoreboard objectives remove progressSecond
scoreboard objectives remove progressSound
scoreboard objectives remove displayPercent
scoreboard objectives remove displaySecond

scoreboard objectives remove outputMajor

# Add Scoreboard Objectives
scoreboard objectives add CONST dummy
scoreboard players set 6 CONST 6
scoreboard players set 12 CONST 12
scoreboard players set 20 CONST 20
scoreboard players set 80 CONST 80
scoreboard players set 100 CONST 100
scoreboard players set -100 CONST -100

scoreboard objectives add AffectedItems dummy
scoreboard objectives add gameRules dummy
	scoreboard players set RunningTime gameRules 400
	scoreboard players set ResettingTime gameRules 400
	scoreboard players set MajorRunningTime gameRules 1200
	scoreboard players set MajorResettingTime gameRules 1200
scoreboard objectives add health health
scoreboard objectives add QueryResult dummy
scoreboard objectives add SuccessCount dummy
scoreboard objectives add loggedOff stat.leaveGame

scoreboard objectives add teamSelected trigger
scoreboard objectives add classSelected trigger
scoreboard objectives add startRound trigger
scoreboard objectives add spectate trigger

scoreboard objectives add counter dummy
scoreboard objectives add progressLights dummy
scoreboard objectives add progressSecond dummy
scoreboard objectives add progressSound dummy
scoreboard objectives add displaySecond dummy
scoreboard objectives add displayPercent dummy

scoreboard objectives add outputMajor dummy

# Remove Scoreboard Teams
scoreboard teams remove lobby
scoreboard teams remove spectator
scoreboard teams remove blue
scoreboard teams remove red

# Add And Configure Scoreboard Teams
scoreboard teams add lobby Lobby
scoreboard teams add spectator Spectator
	scoreboard teams option green color green
scoreboard teams add blue Blue
	scoreboard teams option blue collisionRule pushOtherTeams
	scoreboard teams option blue color blue
	scoreboard teams option blue deathMessageVisibility always
	scoreboard teams option blue friendlyfire false
	scoreboard teams option blue nametagVisibility always
scoreboard teams add red Red
	scoreboard teams option red collisionRule pushOtherTeams
	scoreboard teams option red color red
	scoreboard teams option red deathMessageVisibility always
	scoreboard teams option red friendlyfire false
	scoreboard teams option red nametagVisibility always

# AddFakePlayersToTeam
scoreboard teams join blue Blue
scoreboard teams join red Red

# RemoveScoreboardTags
scoreboard players tag @a remove Registered
scoreboard players tag @a remove Winner
scoreboard players tag @a remove Spectating
scoreboard players tag @a remove Playing


#kill @e[type=area_effect_cloud,name=Main]
#summon minecraft:area_effect_cloud 80 96 3152 {CustomName:Main, CustomNameVisible:0b, Duration:2147483647}
#stats entity @e[type=area_effect_cloud,name=Main] set AffectedItems @s AffectedItems
#stats entity @e[type=area_effect_cloud,name=Main] set QueryResult @s QueryResult

#summon minecraft:area_effect_cloud 135 6 57 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue"],CustomNameVisible:0b, Duration:2147483647}
#summon minecraft:area_effect_cloud 121 6 57 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed"],CustomNameVisible:0b, Duration:2147483647}

kill @e[type=area_effect_cloud,tag=Point]
# Blue
summon minecraft:area_effect_cloud 169 42 118 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamBlue","Log"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 164 43 142 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamBlue","Cobblestone"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 150 40 136 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamBlue","GoldIngot"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 151 56 154 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamBlue","Arrow"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 55 173 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamBlue","TNT"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 50 189 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamBlue","Effect","Regeneration"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 102 41 162 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamBlue","Effect","Resistance"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 122 32 162 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamBlue","Effect","Strength"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 18 189 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamBlue","Effect","Speed"],CustomNameVisible:1b, Duration:2147483647}
# Red
summon minecraft:area_effect_cloud 103 42 118 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamRed","Log"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 108 43 142 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamRed","Cobblestone"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 122 40 136 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamRed","GoldIngot"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 121 56 154 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamRed","Arrow"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 55 173 {CustomName:ResourcePoint,Tags:["Point","FacingEast","TeamRed","TNT"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 50 189 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamRed","Effect","Regeneration"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 170 41 162 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamRed","Effect","Resistance"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 150 32 162 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamRed","Effect","Strength"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 18 189 {CustomName:ResourcePoint,Tags:["Point","FacingWest","TeamRed","Effect","Speed"],CustomNameVisible:1b, Duration:2147483647}
# Major Points
summon minecraft:area_effect_cloud 136 55 188 {CustomName:MajorPoint,Tags:["Point","FacingNorth","ExperienceBottle"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 136 23 188 {CustomName:MajorPoint,Tags:["Point","FacingNorth","IronIngot"],CustomNameVisible:1b, Duration:2147483647}
# Objective
summon minecraft:area_effect_cloud 159 43 100 {CustomName:Objective,Tags:["Point","FacingNorth","TeamBlue"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 113 43 100 {CustomName:Objective,Tags:["Point","FacingNorth","TeamRed"],CustomNameVisible:1b, Duration:2147483647}

# Set-up all points to record SuccessCount stats
stats entity @e[type=area_effect_cloud,tag=Point] set SuccessCount @s SuccessCount
scoreboard players add @e[type=area_effect_cloud,tag=Point] SuccessCount 0
execute @e[type=area_effect_cloud,tag=Point] ~ ~ ~ function calamity:setup_signs

function calamity:setup_moesh_for_testing
gamerule gameLoopFunction calamity:main