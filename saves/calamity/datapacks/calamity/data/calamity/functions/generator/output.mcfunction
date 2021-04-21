# Called from: calamity:generator/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Resource point has finished charging, check for nearby players and give resources or
#   apply team effects. Update players and state.
#---------------------------------------------------------------------------------------------------
# Update generator state
tag @s add Resetting
tag @s remove Charging
scoreboard players operation @s PointTimer = PointResetTime mapRules

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

# Check for generator type and give resources/effects
execute as @s[tag=Log] run give @a[distance=..4,tag=GiveResources] minecraft:oak_log 16
execute as @s[tag=Scaffolding] run give @a[distance=..4,tag=GiveResources] minecraft:scaffolding 16
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveResources] minecraft:gold_ingot 24
execute as @s[tag=Chain] run give @a[distance=..4,tag=GiveResources] minecraft:chain 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveResources] minecraft:cobblestone 9
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveResources] minecraft:arrow 16
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveResources] minecraft:tnt 3
execute as @s[tag=Regeneration] run effect give @a[tag=GiveEffects] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[tag=GiveEffects] minecraft:resistance 45
execute as @s[tag=Strength] run effect give @a[tag=GiveEffects] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[tag=GiveEffects] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[tag=GiveEffects] minecraft:haste 45 3
# Attack
execute as @s[tag=MiningFatigue] run effect give @a[tag=GiveAttackEffect] minecraft:mining_fatigue 45 1
execute as @s[tag=Blindness] run effect give @a[tag=GiveAttackEffect] minecraft:blindness 45
execute as @s[tag=Blindness] run effect give @a[tag=AttackWithEffect] minecraft:glowing 45

# We've identified that a player is standing on a generator type called "Enchant". Now let's
#   check what item they are holding in their main hand. Then we'll enchant their mainhand
#   item right away.
tag @a[tag=Enchant] add CheckForValidItem
# Bow
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:punch"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:punch"}]}}}] run enchant @s minecraft:punch 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:bow"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:punch"}]}}}] run tag @s remove CheckForValidItem
# Crossbow
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:multishot"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:multishot"}]}}}] run enchant @s minecraft:multishot 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:crossbow"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:multishot"}]}}}] run tag @s remove CheckForValidItem
# All axes
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run enchant @s minecraft:sharpness 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run enchant @s minecraft:sharpness 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run enchant @s minecraft:sharpness 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run enchant @s minecraft:sharpness 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run enchant @s minecraft:sharpness 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_axe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:sharpness"}]}}}] run tag @s remove CheckForValidItem
# All hoes
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run enchant @s minecraft:fortune 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run enchant @s minecraft:fortune 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run enchant @s minecraft:fortune 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run enchant @s minecraft:fortune 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run enchant @s minecraft:fortune 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_hoe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fortune"}]}}}] run tag @s remove CheckForValidItem
# All pickaxes
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_pickaxe"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
# All shovels
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 3
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run enchant @s minecraft:efficiency 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_shovel"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:efficiency"}]}}}] run tag @s remove CheckForValidItem
# Swords
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run enchant @s minecraft:knockback 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:wooden_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run enchant @s minecraft:knockback 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:stone_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run enchant @s minecraft:knockback 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run enchant @s minecraft:knockback 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run enchant @s minecraft:knockback 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_sword"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:knockback"}]}}}] run tag @s remove CheckForValidItem
# All helmets
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run enchant @s minecraft:thorns 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run enchant @s minecraft:blast_protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run enchant @s minecraft:fire_protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_helmet"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s remove CheckForValidItem
# All chestplates
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run enchant @s minecraft:thorns 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run enchant @s minecraft:blast_protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run enchant @s minecraft:fire_protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_chestplate"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s remove CheckForValidItenchant
# All leggings
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run enchant @s minecraft:thorns 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run enchant @s minecraft:blast_protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run enchant @s minecraft:fire_protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_leggings"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s remove CheckForValidItem
# All boots
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:leather_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run enchant @s minecraft:thorns 1
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:chainmail_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:thorns"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:iron_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run enchant @s minecraft:blast_protection 2
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:golden_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:blast_protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run enchant @s minecraft:protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:diamond_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:protection"}]}}}] run tag @s remove CheckForValidItem
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots"}}] if entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s add ItemAlreadyEnchanted
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run enchant @s minecraft:fire_protection
execute as @a[tag=CheckForValidItem,nbt={SelectedItem: {id: "minecraft:netherite_boots"}}] unless entity @s[nbt={SelectedItem:{tag:{Enchantments:[{id:"minecraft:fire_protection"}]}}}] run tag @s remove CheckForValidItem

# ItemAlreadyEnchanted tag means the player is holding an item that already has the enchantment its trying to apply. Advise them.
tellraw @a[tag=ItemAlreadyEnchanted] {"translate":"calamity.generator.enchantedItem.alreadyEnchanted","color": "gray","italic": true}
tag @a remove ItemAlreadyEnchanted

# A player still has the Enchant tag, but does not have the CheckForValidItem tag. This means they
#   were holding a valid item and is now holding an enchanted item. Announce it to the server.
tellraw @a[tag=Enchant,tag=!CheckForValidItem] {"translate":"calamity.generator.enchantedItem.valid","color": "gray","italic": true,"with":[{"translate":"calamity.enchanted.item","color":"white"}]}
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=blue] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"blue","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}
execute if entity @a[tag=Enchant,tag=!CheckForValidItem,team=red] run tellraw @a {"translate":"calamity.generator.enchantedItem.announced","color":"red","with":[{"translate":"calamity.enchanted.item","color":"white"},{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}

# If the CheckForValidItem tag has survived on a player this far down, then we are sure they are
#   not holding a valid item to enchant. Let's give them nothing. This isn't a charity!
#   IT'S CALAMITY!
tellraw @a[tag=Enchant,tag=CheckForValidItem] {"translate":"calamity.generator.enchantedItem.invalid","color": "gray","italic": true}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=blue] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"blue","with":[{"translate":"team.blue"},{"translate":"b","color":"blue","font": "calamity:icons"}]}]}
execute if entity @a[tag=Enchant,tag=CheckForValidItem,team=red] run tellraw @a {"translate":"system.message","with":[{"translate":"calamity.generator.enchantedItem.announced.invalid","color":"red","with":[{"translate":"team.red"},{"translate":"r","color": "red","font": "calamity:icons"}]}]}
scoreboard players set @a[tag=Enchant,tag=CheckForValidItem] captureScore 0
tag @a[tag=CheckForValidItem] remove Enchant
tag @a[tag=CheckForValidItem] remove CheckForValidItem

# Play success sounds
execute as @a[tag=GiveEffects] run playsound minecraft:entity.generic.drink player @s
execute as @a[tag=GiveResources] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5
execute as @a[tag=Enchant] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5
execute as @a[tag=Enchant,team=blue] run playsound calamity:calamity.announcer.enchanted.item master @a[team=red] ~ ~ ~ 500
execute as @a[tag=Enchant,team=red] run playsound calamity:calamity.announcer.enchanted.item master @a[team=blue] ~ ~ ~ 500

# Give title message and resource/effect
tag @a[tag=GiveResources] add GiveMessage
tag @a[tag=GiveResources] remove GiveResources
tag @a[tag=GiveEffects] add GiveMessage
tag @a[tag=GiveEffects] remove GiveEffects
tag @a[tag=AttackWithEffect] add GiveMessageAttack
tag @a[tag=AttackWithEffect] remove AttackWithEffect
tag @a[tag=GiveAttackEffect] add GiveMessageAttacked
tag @a[tag=GiveAttackEffect] remove GiveAttackEffect
tag @a[tag=Enchant] remove Enchant

# Resources
title @a[tag=GiveMessage] times 5 30 10
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=Scaffolding] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.scaffolding"},{"text":"16"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"16"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}
execute as @s[tag=Points] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}
# Effects
execute as @s[tag=Regeneration] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.regeneration"},{"text":"45"}]}
execute as @s[tag=Resistance] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.resistance"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}
execute as @s[tag=Strength] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=MiningFatigue] run title @a[tag=GiveMessageAttack] actionbar {"translate":"calamity.generator.output.attackEffect","with":[{"translate":"effect.minecraft.mining_fatigue"},{"text":"45"}]}
execute as @s[tag=MiningFatigue] run title @a[tag=GiveMessageAttacked] actionbar {"translate":"calamity.generator.output.attackedEffect","with":[{"translate":"effect.minecraft.mining_fatigue"},{"text":"45"}]}
execute as @s[tag=Strength] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Blindness] run title @a[tag=GiveMessageAttack] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.glowing"},{"text":"30"}]}
execute as @s[tag=Blindness] run title @a[tag=GiveMessageAttacked] actionbar {"translate":"calamity.generator.output.attackedEffect","with":[{"translate":"effect.minecraft.blindness"},{"text":"30"}]}
execute as @s[tag=Speed] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.speed"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}
execute as @s[tag=Haste] run title @a[tag=GiveMessage] actionbar {"translate":"calamity.generator.output.effect","with":[{"translate":"effect.minecraft.haste"},{"text":"45"},{"translate":"calamity.generator.output.effect.level2"}]}
tag @a[tag=GiveMessage] remove GiveMessage
tag @a[tag=GiveMessageAttack] remove GiveMessageAttack
tag @a[tag=GiveMessageAttacked] remove GiveMessageAttacked

# Update signs
execute as @s run data merge block ^ ^ ^3 {Text2: "{\"translate\":\"calamity.generator.sign.activated\"}"}

# Tag which caused the handler to call this function
tag @s remove Output