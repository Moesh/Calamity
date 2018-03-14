scoreboard players tag @s add Resetting
scoreboard players operation @s counter = ResettingTime gameRules

#Gives resources for blue team
execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @a[r=4,team=blue] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=TeamBlue] ~ ~ ~ function calamity:resource_point/give_reward

#Gives resouorces for red team
execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @a[r=4,team=red] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add GiveResources
execute @s[tag=TeamRed] ~ ~ ~ function calamity:resource_point/give_reward

scoreboard players tag @a[tag=GiveResources] add GiveMessage
scoreboard players tag @a[tag=GiveResources] remove GiveResources

title @a[tag=GiveMessage] actionbar {"translate":"Resources given!"}
scoreboard players tag @a[tag=GiveMessage] remove GiveMessage


execute @s[tag=FacingWest] ~ ~ ~ blockdata ~-3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
execute @s[tag=FacingEast] ~ ~ ~ blockdata ~3 ~ ~ {Text2:"{\"translate\":\"Activated!\"}"}
scoreboard players tag @s remove Output