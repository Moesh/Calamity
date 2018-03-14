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

# Add Scoreboard Objectives
scoreboard objectives add CONST dummy
scoreboard players set 20 CONST 20
scoreboard players set 80 CONST 80
scoreboard players set 100 CONST 100
scoreboard players set -100 CONST -100

scoreboard objectives add AffectedItems dummy
scoreboard objectives add gameRules dummy
	scoreboard players set RunningTime gameRules 400
	scoreboard players set ResettingTime gameRules 400
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

# Remove Scoreboard Teams
scoreboard teams remove lobby
scoreboard teams add spectator
scoreboard teams remove blue
scoreboard teams remove red

# Add And Configure Scoreboard Teams
scoreboard teams add lobby Lobby
scoreboard teams add spectator Spectator

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
#summon minecraft:area_effect_cloud 80 96 3152 {CustomName:Main, CustomNameVisible:1b, Duration:2147483647}
#stats entity @e[type=area_effect_cloud,name=Main] set AffectedItems @s AffectedItems
#stats entity @e[type=area_effect_cloud,name=Main] set QueryResult @s QueryResult

kill @e[type=area_effect_cloud,name=ResourcePoint]
#summon minecraft:area_effect_cloud 135 6 57 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue"],CustomNameVisible:1b, Duration:2147483647}
#summon minecraft:area_effect_cloud 121 6 57 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed"],CustomNameVisible:1b, Duration:2147483647}

# Blue
summon minecraft:area_effect_cloud 169 42 118 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue","Log"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 164 43 142 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue","Cobblestone"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 150 40 136 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue","GoldIngot"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 151 56 154 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue","Arrow"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 55 173 {CustomName:ResourcePoint,Tags:["FacingWest","TeamBlue","TNT"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 50 189 {CustomName:ResourcePoint,Tags:["FacingEast","TeamBlue","Regeneration"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 102 41 162 {CustomName:ResourcePoint,Tags:["FacingEast","TeamBlue","Resistance"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 122 32 162 {CustomName:ResourcePoint,Tags:["FacingEast","TeamBlue","Strength","Weakness"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 18 189 {CustomName:ResourcePoint,Tags:["FacingEast","TeamBlue","Speed","Haste"],CustomNameVisible:1b, Duration:2147483647}
# Red
summon minecraft:area_effect_cloud 103 42 118 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed","Log"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 108 43 142 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed","Cobblestone"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 122 40 136 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed","GoldIngot"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 121 56 154 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed","Arrow"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 115 55 173 {CustomName:ResourcePoint,Tags:["FacingEast","TeamRed","TNT"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 50 189 {CustomName:ResourcePoint,Tags:["FacingWest","TeamRed","Regeneration"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 170 41 162 {CustomName:ResourcePoint,Tags:["FacingWest","TeamRed","Resistance"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 150 32 162 {CustomName:ResourcePoint,Tags:["FacingWest","TeamRed","Strength","Weakness"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 157 18 189 {CustomName:ResourcePoint,Tags:["FacingWest","TeamRed","Speed","Haste"],CustomNameVisible:1b, Duration:2147483647}
	

	stats entity @e[type=area_effect_cloud,name=ResourcePoint] set SuccessCount @s SuccessCount
	scoreboard players add @e[type=area_effect_cloud,name=ResourcePoint] SuccessCount 0


function calamity:setup_moesh_for_testing
gamerule gameLoopFunction calamity:main