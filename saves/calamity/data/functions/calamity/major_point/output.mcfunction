# Decide who won
scoreboard players tag @a remove CountForOutput
scoreboard players set BlueTeam outputMajor 0
scoreboard players set RedTeam outputMajor 0

execute @a[r=7] ~ ~ ~ detect ~ ~-2 ~ minecraft:bedrock 0 scoreboard players tag @s add CountForOutput
execute @a[r=7] ~ ~ ~ detect ~ ~-3 ~ minecraft:bedrock 0 scoreboard players tag @s add CountForOutput
execute @a[team=blue,tag=CountForOutput] ~ ~ ~ scoreboard players add BlueTeam outputMajor 1
execute @a[team=red,tag=CountForOutput] ~ ~ ~ scoreboard players add RedTeam outputMajor 1

# Positive = Blue Wins
# Negative = Red Wins
# Zero = Draw, no one wins
scoreboard players set @s outputMajor 0
scoreboard players operation @s outputMajor = BlueTeam outputMajor
scoreboard players operation @s outputMajor -= RedTeam outputMajor

# Multiply scores for message output
execute @s[tag=IronIngot] ~ ~ ~ scoreboard players operation BlueTeam outputMajor *= 12 CONST
execute @s[tag=IronIngot] ~ ~ ~ scoreboard players operation RedTeam outputMajor *= 12 CONST
execute @s[tag=ExperienceBottle] ~ ~ ~ scoreboard players operation BlueTeam outputMajor *= 6 CONST
execute @s[tag=ExperienceBottle] ~ ~ ~ scoreboard players operation RedTeam outputMajor *= 6 CONST

execute @s[tag=IronIngot,score_outputMajor_min=1] ~ ~ ~ execute @a[team=blue,tag=CountForOutput] ~ ~ ~ summon minecraft:item 154 44 118 {Item:{id:"minecraft:iron_ingot",Count:12b}}
execute @s[tag=IronIngot,score_outputMajor=-1] ~ ~ ~ execute @a[team=red,tag=CountForOutput] ~ ~ ~ summon minecraft:item 154 44 118 {Item:{id:"minecraft:iron_ingot",Count:12b}}

execute @s[tag=ExperienceBottle,score_outputMajor_min=1] ~ ~ ~ execute @a[team=blue,tag=CountForOutput] ~ ~ ~ summon minecraft:item 118 44 118 {Item:{id:"minecraft:experience_bottle",Count:6b}}
execute @s[tag=ExperienceBottle,score_outputMajor=-1] ~ ~ ~ execute @a[team=red,tag=CountForOutput] ~ ~ ~ summon minecraft:item 118 44 118 {Item:{id:"minecraft:experience_bottle",Count:6b}}

execute @s[tag=IronIngot,score_outputMajor_min=1] ~ ~ ~ tellraw @a {"translate":"majorPoint.output","color":"light_purple","with":[{"translate":"team.blue","color":"blue"},{"translate":"item.ingotIron.name","color":"green"},{"score":{"name":"BlueTeam","objective":"outputMajor"},"color":"white"}]}
execute @s[tag=IronIngot,score_outputMajor=-1] ~ ~ ~ tellraw @a {"translate":"majorPoint.output","color":"light_purple","with":[{"translate":"team.red","color":"red"},{"translate":"item.ingotIron.name","color":"green"},{"score":{"name":"RedTeam","objective":"outputMajor"},"color":"white"}]}
execute @s[tag=IronIngot,score_outputMajor=0,score_outputMajor_min=0] ~ ~ ~ tellraw @a {"text":"IronIngot Draw!","bold":true,"color":"green"}

execute @s[tag=ExperienceBottle,score_outputMajor_min=1] ~ ~ ~ tellraw @a {"translate":"majorPoint.output","color":"light_purple","with":[{"translate":"team.blue","color":"blue"},{"translate":"item.expBottle.name","color":"green"},{"score":{"name":"BlueTeam","objective":"outputMajor"},"color":"white"}]}
execute @s[tag=ExperienceBottle,score_outputMajor=-1] ~ ~ ~ tellraw @a {"translate":"majorPoint.output","color":"light_purple","with":[{"translate":"team.red","color":"red"},{"translate":"item.expBottle.name","color":"green"},{"score":{"name":"RedTeam","objective":"outputMajor"},"color":"white"}]}

execute @s[tag=IronIngot,score_outputMajor=0,score_outputMajor_min=0] ~ ~ ~ tellraw @a {"translate":"majorPoint.output.draw","color":"light_purple","with":[{"translate":"item.ingotIron.name","color":"white"}]}
execute @s[tag=ExperienceBottle,score_outputMajor=0,score_outputMajor_min=0] ~ ~ ~ tellraw @a {"translate":"majorPoint.output.draw","color":"light_purple","with":[{"translate":"item.expBottle.name","color":"green"}]}



#scoreboard players tag @a remove CountForOutput


# Reset
scoreboard players tag @s add Resetting
scoreboard players operation @s counter = MajorResettingTime gameRules

execute @s ~ ~ ~ blockdata ~ ~ ~-6 {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
scoreboard players tag @s remove Output