# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Resource point has finished charging, check for nearby players and give resources or
#>   apply team effects. Update players and state.
#>--------------------------------------------------------------------------------------------------

# Update generator state to resetting
tag @s add Resetting
tag @s remove Charging
scoreboard players operation @s GeneratorTimer = GeneratorResetTime mapRules

#---------------------------------------------------------------------------------------------------
# Detect players who are standing on a generator
#---------------------------------------------------------------------------------------------------

# Determine if nearby players are standing on bedrock (2 blocks down is y-3)
execute as @s[tag=TeamBlue] run tag @a[distance=..4,team=blue] add CheckIfStandingOnPoint
execute as @s[tag=TeamRed] run tag @a[distance=..4,team=red] add CheckIfStandingOnPoint
    # We use this weird "if entity as entity if block" section because we know the shape of our
    #   generator does not exactly match Minecraft's search radius. This will accurately detect if
    #   a player is standing above or on bedrock while in the generator's search radius.
    execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add Buff
    execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add Buff
    execute if entity @s[tag=AttackEffect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add Debuff
    execute if entity @s[tag=AttackEffect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add Debuff
    execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveItem
    execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveItem
    execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add Enchant
    execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add Enchant
# This is a temporary tag used to target players who need additional checks. Remove it right away.
tag @a remove CheckIfStandingOnPoint

# Output the effect!
execute if entity @a[tag=Buff] run function calamity:generator/output/status_effect
execute if entity @a[tag=Debuff] run function calamity:generator/output/status_effect
execute if entity @a[tag=GiveItem] run function calamity:generator/output/item
execute if entity @a[tag=Enchant] run function calamity:generator/output/enchant

# Update signs
execute as @s run data merge block ^ ^ ^3 {Text3: "{\"translate\":\"calamity.generator.sign.activated\"}"}
# Make sure the handler doesn't call this function on the next cycle, unless it is needed
tag @s remove Output