# Called from: calamity:generator/handler

#>--------------------------------------------------------------------------------------------------
#> Purpose: Resource point has finished charging, check for nearby players and give resources or
#   apply team effects. Update players and state.
#>--------------------------------------------------------------------------------------------------

# Update generator state to resetting
tag @s add Resetting
tag @s remove Charging
scoreboard players operation @s GeneratorTimer = PointResetTime mapRules

#---------------------------------------------------------------------------------------------------
# Detect players who are standing on a generator
#---------------------------------------------------------------------------------------------------
# Determine if nearby players are standing on bedrock (2 blocks down is y-3)
execute as @s[tag=TeamBlue] run tag @a[distance=..4,team=blue] add CheckIfStandingOnPoint
execute as @s[tag=TeamRed] run tag @a[distance=..4,team=red] add CheckIfStandingOnPoint
# We use this weird "if block" section because we know the shape of our generator does not
#   exactly match Minecraft's search radius.
execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=AttackEffect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add AttackWithEffect
execute if entity @s[tag=AttackEffect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add AttackWithEffect
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add Enchant
execute if entity @s[tag=Enchant] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add Enchant
tag @a remove CheckIfStandingOnPoint

# A player successfully captured an important resource point, let's reward them for it!
# This section scores points towards the objective!
scoreboard players operation @a[tag=GiveEffects] captureScore = ScoreForCaptureResource mapRules
scoreboard players operation @a[tag=AttackWithEffect] captureScore = ScoreForCaptureResource mapRules
scoreboard players operation @a[tag=GiveResources] captureScore = ScoreForCaptureResource mapRules
    # We're going to load the Enchant score early, and take it away if there is no valid item.
    scoreboard players operation @a[tag=Enchant] captureScore = ScoreForEnchantedItem mapRules

# A player has scored effects for their team, let's flag the whole team!
execute as @a[team=blue,tag=GiveEffects,limit=1] run tag @a[team=blue] add GiveEffects
execute as @a[team=red,tag=GiveEffects,limit=1] run tag @a[team=red] add GiveEffects
execute as @a[team=blue,tag=AttackWithEffect,limit=1] run tag @a[team=red] add GiveAttackEffect
execute as @a[team=blue,tag=AttackWithEffect,limit=1] run tag @a[team=blue] remove GiveAttackEffect
execute as @a[team=red,tag=AttackWithEffect,limit=1] run tag @a[team=blue] add GiveAttackEffect
execute as @a[team=red,tag=AttackWithEffect,limit=1] run tag @a[team=red] remove GiveAttackEffect

#---------------------------------------------------------------------------------------------------
# Resources
#---------------------------------------------------------------------------------------------------

# Check for generator type and give resources/effects
execute as @s[tag=Log] run give @a[distance=..4,tag=GiveResources] minecraft:oak_log 16
execute as @s[tag=Scaffolding] run give @a[distance=..4,tag=GiveResources] minecraft:scaffolding 16
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveResources] minecraft:gold_ingot 24
execute as @s[tag=Chain] run give @a[distance=..4,tag=GiveResources] minecraft:chain 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveResources] minecraft:cobblestone 9
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveResources] minecraft:arrow 16
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveResources] minecraft:tnt 3

# Play success sounds
execute as @a[tag=GiveResources] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5

# Give title message and resource/effect
tag @a[tag=GiveResources] add GiveMessage
tag @a[tag=GiveResources] remove GiveResources

# Resources
title @a[tag=GiveMessage] times 5 30 10
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=Scaffolding] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.scaffolding"},{"text":"16"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"16"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}
execute as @s[tag=Points] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}
# Reset tags
tag @a[tag=GiveMessage] remove GiveMessage

#---------------------------------------------------------------------------------------------------
# Effects
#---------------------------------------------------------------------------------------------------

# Buff
execute as @s[tag=Regeneration] run effect give @a[tag=GiveEffects] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[tag=GiveEffects] minecraft:resistance 45
execute as @s[tag=Strength] run effect give @a[tag=GiveEffects] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[tag=GiveEffects] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[tag=GiveEffects] minecraft:haste 45 3
tag @a[tag=GiveEffects] add GiveMessage
tag @a[tag=GiveEffects] remove GiveEffects

# Attack
execute as @s[tag=MiningFatigue] run effect give @a[tag=GiveAttackEffect] minecraft:mining_fatigue 45 1
execute as @s[tag=Blindness] run effect give @a[tag=GiveAttackEffect] minecraft:blindness 45
execute as @s[tag=Blindness] run effect give @a[tag=AttackWithEffect] minecraft:glowing 45
tag @a[tag=AttackWithEffect] add GiveMessageAttack
tag @a[tag=AttackWithEffect] remove AttackWithEffect
tag @a[tag=GiveAttackEffect] add GiveMessageAttacked
tag @a[tag=GiveAttackEffect] remove GiveAttackEffect

# Play success sounds
execute as @a[tag=GiveEffects] run playsound minecraft:entity.generic.drink player @s

# Effect messages
execute as @s[tag=Regeneration] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.regeneration"},{"text":"45"}]}
execute as @s[tag=Resistance] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.resistance"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}
execute as @s[tag=Strength] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Strength] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Speed] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.speed"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}
execute as @s[tag=Haste] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.haste"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}

# Attack effect messages
execute as @s[tag=MiningFatigue] run title @a[tag=GiveMessageAttack] actionbar {"translate":"calamity.generator.output.attackEffect","with":[{"translate":"effect.minecraft.mining_fatigue"},{"text":"45"}]}
execute as @s[tag=MiningFatigue] run title @a[tag=GiveMessageAttacked] actionbar {"translate":"calamity.generator.output.attackedEffect","with":[{"translate":"effect.minecraft.mining_fatigue"},{"text":"45"}]}
execute as @s[tag=Blindness] run title @a[tag=GiveMessageAttack] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.glowing"},{"text":"30"}]}
execute as @s[tag=Blindness] run title @a[tag=GiveMessageAttacked] actionbar {"translate":"calamity.generator.output.attackedEffect","with":[{"translate":"effect.minecraft.blindness"},{"text":"30"}]}

# Remove message tags
tag @a[tag=GiveMessageAttack] remove GiveMessageAttack
tag @a[tag=GiveMessageAttacked] remove GiveMessageAttacked

#---------------------------------------------------------------------------------------------------
# Enchant item output
#---------------------------------------------------------------------------------------------------

# We've identified that a player is standing on a generator type called "Enchant". Now let's
#   check what item they are holding in their main hand. Then we'll enchant their mainhand
#   item right away.
tag @a[tag=Enchant] add CheckForValidItem

# Bow
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow", tag: {Enchantments: [{id: "minecraft:punch"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:bow"}}] minecraft:punch 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow", tag: {Enchantments: [{id: "minecraft:punch"}]}}}] remove CheckForValidItem

# Crossbow
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow", tag: {Enchantments: [{id: "minecraft:multishot"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:crossbow"}}] minecraft:multishot 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow", tag: {Enchantments: [{id: "minecraft:multishot"}]}}}] remove CheckForValidItem

# All axes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_axe"}}] minecraft:sharpness 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe", tag: {Enchantments: [{id: "minecraft:sharpness"}]}}}] remove CheckForValidItem

# All hoes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_hoe"}}] minecraft:fortune 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe", tag: {Enchantments: [{id: "minecraft:fortune"}]}}}] remove CheckForValidItem

# All pickaxes
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem

# All shovels
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_shovel"}}] minecraft:efficiency 3
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_shovel"}}] minecraft:efficiency 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel", tag: {Enchantments: [{id: "minecraft:efficiency"}]}}}] remove CheckForValidItem

# Swords
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:wooden_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:stone_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_sword"}}] minecraft:knockback 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_sword"}}] minecraft:knockback 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword", tag: {Enchantments: [{id: "minecraft:knockback"}]}}}] remove CheckForValidItem

# All helmets
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_helmet"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_helmet"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_helmet"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_helmet"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_helmet"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_helmet"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# All chestplates
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_chestplate"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_chestplate"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_chestplate"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_chestplate"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_chestplate"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItenchant

# All leggings
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_leggings"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_leggings"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_leggings"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_leggings"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_leggings"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_leggings"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# All boots
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:leather_boots"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:chainmail_boots"}}] minecraft:thorns 1
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots", tag: {Enchantments: [{id: "minecraft:thorns"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:iron_boots"}}] minecraft:protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:golden_boots"}}] minecraft:blast_protection 2
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots", tag: {Enchantments: [{id: "minecraft:blast_protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:diamond_boots"}}] minecraft:protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots", tag: {Enchantments: [{id: "minecraft:protection"}]}}}] remove CheckForValidItem
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] add ItemAlreadyEnchanted
enchant @a[tag=CheckForValidItem,tag=!ItemAlreadyEnchanted,nbt={SelectedItem: {id: "minecraft:netherite_boots"}}] minecraft:fire_protection
tag @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots", tag: {Enchantments: [{id: "minecraft:fire_protection"}]}}}] remove CheckForValidItem

# ItemAlreadyEnchanted tag means the player is holding an item that already has the enchantment its trying to apply. Advise them.
tellraw @a[tag=ItemAlreadyEnchanted] {"translate":"calamity.generator.enchantedItem.alreadyEnchanted","color": "gray","italic": true}
tag @a remove ItemAlreadyEnchanted

# A player still has the Enchant tag, but does not have the CheckForValidItem tag. This means they
#   were holding a valid item and are now holding an enchanted item.
# Let the player know they got an enchanted item
tellraw @a[tag=Enchant,tag=!CheckForValidItem] {"translate":"calamity.generator.enchantedItem.valid","color": "gray","italic": true,"with":[{"translate":"calamity.enchanted.item","color":"white"}]}
# Announce it to the server
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=blue] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"blue","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=red] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"red","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}

execute as @a[tag=Enchant] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5
execute as @a[tag=Enchant,team=blue] run playsound calamity:calamity.announcer.enchanted.item master @a[team=red] ~ ~ ~ 500
execute as @a[tag=Enchant,team=red] run playsound calamity:calamity.announcer.enchanted.item master @a[team=blue] ~ ~ ~ 500

# If the CheckForValidItem tag has survived on a player this far down, then we are sure they are
#   not holding a valid item to enchant. Let's give them nothing. This isn't a charity!
#   IT'S CALAMITY!
tellraw @a[tag=Enchant,tag=CheckForValidItem] {"translate":"calamity.generator.enchantedItem.invalid","color": "gray","italic": true}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=blue] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"blue","with":[{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}]}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=red] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"red","with":[{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}]}
# Make sure the player doesn't get any score for this
scoreboard players set @a[tag=Enchant,tag=CheckForValidItem] captureScore 0
tag @a[tag=CheckForValidItem] remove Enchant
tag @a[tag=CheckForValidItem] remove CheckForValidItem

# Finally, finally remove this tag
tag @a[tag=Enchant] remove Enchant

#---------------------------------------------------------------------------------------------------
# End function
#---------------------------------------------------------------------------------------------------

# Update signs
execute as @s run data merge block ^ ^ ^3 {Text2: "{\"translate\":\"calamity.generator.sign.activated\"}"}

# Make sure the handler doesn't call this function on the next cycle, unless it is needed
tag @s remove Output