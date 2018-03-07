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
scoreboard objectives remove displaySecond

# Add Scoreboard Objectives
scoreboard objectives add CONST dummy
scoreboard players set TWENTY CONST 20
scoreboard players set EIGHTY CONST 80

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
scoreboard objectives add displaySecond dummy

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


kill @e[type=area_effect_cloud,name=Main]
#summon minecraft:area_effect_cloud 80 96 3152 {CustomName:Main, CustomNameVisible:1b, Duration:2147483647}
#stats entity @e[type=area_effect_cloud,name=Main] set AffectedItems @s AffectedItems
#stats entity @e[type=area_effect_cloud,name=Main] set QueryResult @s QueryResult

kill @e[type=area_effect_cloud,name=ResourcePoint]
summon minecraft:area_effect_cloud 136 6 57 {CustomName:ResourcePoint,Tags:["FacingWest"],CustomNameVisible:1b, Duration:2147483647}
summon minecraft:area_effect_cloud 136 6 47 {CustomName:ResourcePoint,Tags:["FacingWest"],CustomNameVisible:1b, Duration:2147483647}
stats entity @e[type=area_effect_cloud,name=ResourcePoint] set SuccessCount @s SuccessCount
scoreboard players add @e[type=area_effect_cloud,name=ResourcePoint] SuccessCount 0


function calamity:setup_moesh_for_testing
#gamerule gameLoopFunction calamity:main