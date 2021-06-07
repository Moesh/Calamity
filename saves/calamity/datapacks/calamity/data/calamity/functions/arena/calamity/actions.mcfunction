# Called from: calamity:tick
#>--------------------------------------------------------------------------------------------------
#> Purpose: Arena-specific actions. Can be used to add detailing, or specific mechanics.
#>--------------------------------------------------------------------------------------------------

# Play particles for the game table
# This torch particle replication is so important that we must dedicate an entire section to it.
# Torch flame
execute if score #tableCandle gameVariable matches 0 run particle minecraft:flame 136.125 58.65 68.86 0 0 0 0 1 normal
scoreboard players add #tableCandle gameVariable 1
execute if score #tableCandle gameVariable matches 5.. run scoreboard players set #tableCandle gameVariable 0
# Torch smoke!
execute if score #tableCandleSmoke gameVariable matches 0 run particle minecraft:smoke 136.125 58.65 68.86 0 0.1 0 0 1 normal
scoreboard players add #tableCandleSmoke gameVariable 1
execute if score #tableCandleSmoke gameVariable matches 45.. run scoreboard players set #tableCandleSmoke gameVariable 0

# Play particles for the game table
# Highlight players who fell in this location.
execute as @a[gamemode=adventure,x=135,y=54,z=59,dx=2,dz=2,tag=!HowEmbarassing] run tag @s add HowEmbarassing
execute as @a[tag=HowEmbarassing,tag=!MessageSent] run tellraw @a {"translate":"calamity.troll","color": "gray","italic": true,"with": [{"selector":"@s"}]}
tag @a[tag=HowEmbarassing,tag=!MessageSent] add MessageSent
execute as @a[tag=MessageSent] unless entity @s[gamemode=!spectator,x=135,y=54,z=59,dx=2,dz=2] run tag @s remove HowEmbarassing
tag @a[tag=!HowEmbarassing,tag=MessageSent] remove MessageSent