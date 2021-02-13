# Called from: calamity:resource_point/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Resource point has finished charging, check for nearby players and give resources or
#   apply team effects. Update players and state.
#---------------------------------------------------------------------------------------------------
# Update resource point state
tag @s add Resetting
tag @s remove Charging
scoreboard players operation @s PointTimer = PointResetTime mapRules

# Determine if nearby players are standing on bedrock (2 blocks down is y-3)
execute as @s[tag=TeamBlue] run tag @a[distance=..4,team=blue] add CheckIfStandingOnPoint
execute as @s[tag=TeamRed] run tag @a[distance=..4,team=red] add CheckIfStandingOnPoint

# We use this weird "if block" section because we know the shape of our resource point does not
#   exactly match Minecraft's search radius.
execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=Effect] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveEffects
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=Resource] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveResources
execute if entity @s[tag=GiveBook] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-3 ~ minecraft:bedrock run tag @s add GiveBook
execute if entity @s[tag=GiveBook] as @a[tag=CheckIfStandingOnPoint,distance=..4] if block ~ ~-2 ~ minecraft:bedrock run tag @s add GiveBook
tag @a remove CheckIfStandingOnPoint

# A player successfully captured an important resource point, let's reward them for it!
# This section scores points towards the objective!
scoreboard players operation @a[tag=GiveEffects] captureScore = ScoreForCaptureResource mapRules
scoreboard players operation @a[tag=GiveResources] captureScore = ScoreForCaptureResource mapRules

# A player has scored effects for their team, let's flag the whole team!
execute as @a[team=blue,tag=GiveEffects,limit=1] run tag @a[team=blue] add GiveEffects
execute as @a[team=red,tag=GiveEffects,limit=1] run tag @a[team=red] add GiveEffects

# Check for resource point type and give resources/effects
execute as @s[tag=Log] run give @a[distance=..4,tag=GiveResources] minecraft:oak_log 16
execute as @s[tag=Scaffolding] run give @a[distance=..4,tag=GiveResources] minecraft:scaffolding 16
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveResources] minecraft:gold_ingot 24
execute as @s[tag=Chain] run give @a[distance=..4,tag=GiveResources] minecraft:chain 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveResources] minecraft:cobblestone 9
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveResources] minecraft:arrow 16
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveResources] minecraft:tnt 8
execute as @s[tag=Regeneration] run effect give @a[tag=GiveEffects] minecraft:regeneration 45
execute as @s[tag=Resistance] run effect give @a[tag=GiveEffects] minecraft:resistance 45 1
execute as @s[tag=Strength] run effect give @a[tag=GiveEffects] minecraft:strength 45
execute as @s[tag=Speed] run effect give @a[tag=GiveEffects] minecraft:speed 45 1
execute as @s[tag=Haste] run effect give @a[tag=GiveEffects] minecraft:haste 45 1

# We've identified that a player is standing on a resource point type called "GiveBook". Now let's
#   check what item they are holding in their main hand. This will determine what kind of book they
#   are
tag @a[tag=GiveBook] add CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:bow"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:punch",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:bow"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:crossbow"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:multishot",lvl:1s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:crossbow"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:sharpness",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_axe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_axe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:sharpness",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_axe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_axe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:sharpness",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_axe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_axe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:sharpness",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_axe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:sharpness",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_axe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_hoe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_hoe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_hoe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_hoe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:fortune",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_hoe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_pickaxe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_pickaxe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_pickaxe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_pickaxe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_pickaxe"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_shovel"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_shovel"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_shovel"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_shovel"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_shovel"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_shovel"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_shovel"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:3s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_shovel"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_shovel"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:efficiency",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_shovel"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:knockback",lvl:1s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_sword"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:knockback",lvl:1s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:stone_sword"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_sword"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:knockback",lvl:1s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:golden_sword"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:knockback",lvl:1s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] remove CheckForValidItem
give @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:knockback",lvl:2s}]}
tag @a[tag=CheckForValidItem,nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] remove CheckForValidItem

# We must handle messaging different for this section, as we will likely expand it it to be more
#   clear. Players will want to know or learn what item gives what Enchanted Book, so we should
#   work that in some day, but not in alpha.
# TODO: Expand messages to include custom message for each book type.
tellraw @a[tag=GiveBook,tag=!CheckForValidItem] {"text":"Valid item found! Enchanted Book given.","color": "light_grey","italic": true}
tellraw @a[tag=GiveBook,tag=CheckForValidItem] {"text":"No valid item found in main hand. Enjoy this Mending book.","color": "light_grey","italic": true}
execute if entity @a[tag=GiveBook,team=blue] run tellraw @a {"text":"An Enchanted Book has been created by Blue team!!","color":"blue"}
execute if entity @a[tag=GiveBook,team=red] run tellraw @a {"text":"An Enchanted Book has been created by the Red team!","color": "red"}

# No valid item found, give default book
# Default book should be a rather innoculous, but useful book. Should not be a book meant for
#   for combat, as we want to continue promoting good logistics.
give @a[tag=CheckForValidItem] minecraft:enchanted_book{StoredEnchantments:[{id:"minecraft:mending",lvl:1s}]}
tag @a[tag=CheckForValidItem] remove CheckForValidItem

# Play success sounds
execute as @a[tag=GiveEffects] run playsound minecraft:entity.generic.drink player @s
execute as @s[tag=GiveResources] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5
execute as @s[tag=GiveBook] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5

# Give title message and resource/effect
tag @a[tag=GiveResources] add GiveMessage
tag @a[tag=GiveResources] remove GiveResources
tag @a[tag=GiveEffects] add GiveMessage
tag @a[tag=GiveEffects] remove GiveEffects
tag @a[tag=GiveBook] add Give
tag @a[tag=GiveBook] remove GiveBook

# Resources
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"32"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"8"}]}
execute as @s[tag=Points] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"8"}]}
# Effects
execute as @s[tag=Regeneration] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.regeneration"},{"text":"45"}]}
execute as @s[tag=Resistance] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.resistance"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Strength] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.strength"},{"text":"45"}]}
execute as @s[tag=Speed] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.speed"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
execute as @s[tag=Haste] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"resourcePoint.output.effect","with":[{"translate":"effect.minecraft.haste"},{"text":"45"},{"translate":"resourcePoint.output.effect.level2"}]}
tag @a[tag=GiveMessage] remove GiveMessage

# Update signs
execute as @s[tag=FacingWest] run data merge block ~-3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"}
execute as @s[tag=FacingEast] run data merge block ~3 ~ ~ {Text2:"{\"translate\":\"resourcePoint.sign.activated\"}"} 

# Tag which caused the handler to call this function
tag @s remove Output