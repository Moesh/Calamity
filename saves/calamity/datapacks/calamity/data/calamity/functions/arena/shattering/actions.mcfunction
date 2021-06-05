# Called from: calamity:tick

#>--------------------------------------------------------------------------------------------------
#> Purpose: Arena-specific actions. Can be used to add detailing, or specific mechanics.
#>--------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
# Play particles for the game table
#---------------------------------------------------------------------------------------------------
# This torch particle replication is so important that we must dedicate an entire section to it.
# Torch flame
execute if score GameState gameVariable matches 0 if score #tableCandle gameVariable matches 0 run particle minecraft:flame 106.125 14.65 117.86 0 0 0 0 1 normal
execute if score GameState gameVariable matches 0 run scoreboard players add #tableCandle gameVariable 1
execute if score GameState gameVariable matches 0 if score #tableCandle gameVariable matches 5.. run scoreboard players set #tableCandle gameVariable 0
# Torch smoke!
execute if score GameState gameVariable matches 0 if score #tableCandleSmoke gameVariable matches 0 run particle minecraft:smoke 106.125 14.65 117.86 0 0.1 0 0 1 normal
execute if score GameState gameVariable matches 0 run scoreboard players add #tableCandleSmoke gameVariable 1
execute if score GameState gameVariable matches 0 if score #tableCandleSmoke gameVariable matches 45.. run scoreboard players set #tableCandleSmoke gameVariable 0

#---------------------------------------------------------------------------------------------------
# Make arrows break glass until it shatters
#---------------------------------------------------------------------------------------------------
# Detect that arrow is in a block
tag @e[type=minecraft:arrow,tag=!inBlock,nbt={inGround: 1b}] add inBlock
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:glass"}}] add inGlass
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:black_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:blue_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:brown_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:cyan_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:gray_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:green_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:light_blue_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:light_gray_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:lime_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:magenta_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:orange_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:pink_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:purple_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:red_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:white_stained_glass"}}] add inStained
tag @e[type=minecraft:arrow,tag=inBlock,nbt={inBlockState: {Name: "minecraft:yellow_stained_glass"}}] add inStained

# Check the arrow rotation (appare)
execute as @e[tag=inBlock,y_rotation=-90..90] at @s run tp @e[tag=inBlock,limit=1] ~ ~ ~0.05
execute as @e[tag=inBlock,y_rotation=90..-90] at @s run tp @e[tag=inBlock,limit=1] ~ ~ ~-0.05
execute as @e[tag=inBlock,y_rotation=180..0] at @s run tp @e[tag=inBlock,limit=1] ~-0.05 ~ ~
execute as @e[tag=inBlock,y_rotation=0..180] at @s run tp @e[tag=inBlock,limit=1] ~0.05 ~ ~
execute as @e[tag=inBlock,x_rotation=-90..0] at @s run tp @e[tag=inBlock,limit=1] ~ ~-0.05 ~
execute as @e[tag=inBlock,x_rotation=0..90] at @s run tp @e[tag=inBlock,limit=1] ~ ~0.05 ~

# Break glass (last step in durability) and play animations etc.
execute at @e[tag=inGlass] run fill ~ ~ ~ ~ ~ ~ minecraft:air
execute at @e[tag=inGlass] run particle minecraft:block minecraft:glass ~ ~ ~ .35 .35 .35 0.25 20
execute at @e[tag=inGlass] run playsound minecraft:block.glass.break block @a ~ ~ ~ 0.6
# Consume arrows
kill @e[tag=inGlass]

# Make it seem like something broke because it looks cool.
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:purple_stained_glass run particle minecraft:block minecraft:purple_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:lime_stained_glass run particle minecraft:block minecraft:lime_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:blue_stained_glass run particle minecraft:block minecraft:blue_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:brown_stained_glass run particle minecraft:block minecraft:brown_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:cyan_stained_glass run particle minecraft:block minecraft:cyan_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:green_stained_glass run particle minecraft:block minecraft:green_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:light_blue_stained_glass run particle minecraft:block minecraft:light_blue_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:magenta_stained_glass run particle minecraft:block minecraft:magenta_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:orange_stained_glass run particle minecraft:block minecraft:orange_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:pink_stained_glass run particle minecraft:block minecraft:pink_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:red_stained_glass run particle minecraft:block minecraft:red_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:white_stained_glass run particle minecraft:block minecraft:white_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:gray_stained_glass run particle minecraft:block minecraft:gray_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:light_gray_stained_glass run particle minecraft:block minecraft:light_gray_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:black_stained_glass run particle minecraft:block minecraft:black_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
execute at @e[tag=inStained] if block ~ ~ ~ minecraft:yellow_stained_glass run particle minecraft:block minecraft:yellow_stained_glass ~ ~ ~ .35 .35 .35 0.25 6
# Change color of stained glass ( simulated durability )
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:glass replace minecraft:white_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:white_stained_glass replace minecraft:light_gray_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:light_gray_stained_glass replace minecraft:gray_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:gray_stained_glass replace minecraft:black_stained_glass
# All glass that is not above should just convert straight to black glass.
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:purple_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:lime_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:blue_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:brown_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:cyan_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:green_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:light_blue_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:magenta_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:orange_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:pink_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:red_stained_glass
execute at @e[tag=inStained] run fill ~ ~ ~ ~ ~ ~ minecraft:black_stained_glass replace minecraft:yellow_stained_glass
# Consume arrows which break glass
kill @e[tag=inStained]