# Called from: calamity:arena/<arena name>/load_blocks

#>--------------------------------------------------------------------------------------------------
#> Purpose: Load generators
#>--------------------------------------------------------------------------------------------------

# Place generators
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=TeamBlue,tag=FacingWest] run setblock ~ ~ ~ minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: -3, mode: "LOAD", posY: -2, sizeX: 7, posZ: -3, integrity: 1.0f, showair: 1b, name: "calamity:blue_resource_point", sizeY: 2, sizeZ: 7, showboundingbox: 1b}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=TeamBlue,tag=FacingEast] run setblock ~ ~ ~ minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: 3, mode: "LOAD", posY: -2, sizeX: 7, posZ: 3, integrity: 1.0f, showair: 1b, name: "calamity:blue_resource_point", sizeY: 2, sizeZ: 7, showboundingbox: 1b}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=TeamRed,tag=FacingWest] run setblock ~ ~ ~ minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "NONE", posX: -3, mode: "LOAD", posY: -2, sizeX: 7, posZ: -3, integrity: 1.0f, showair: 1b, name: "calamity:red_resource_point", sizeY: 2, sizeZ: 7, showboundingbox: 1b}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=TeamRed,tag=FacingEast] run setblock ~ ~ ~ minecraft:structure_block[mode=load]{metadata: "", mirror: "NONE", ignoreEntities: 1b, powered: 0b, seed: 0L, author: "Moesh", rotation: "CLOCKWISE_180", posX: 3, mode: "LOAD", posY: -2, sizeX: 7, posZ: 3, integrity: 1.0f, showair: 1b, name: "calamity:red_resource_point", sizeY: 2, sizeZ: 7, showboundingbox: 1b}
execute at @e[type=minecraft:area_effect_cloud,name="Generator"] run setblock ~ ~1 ~ minecraft:redstone_block
execute at @e[type=minecraft:area_effect_cloud,name="Generator"] run fill ~ ~ ~ ~ ~1 ~ minecraft:air
execute at @e[type=minecraft:area_effect_cloud,name="Generator"] run setblock ~ ~-1 ~ minecraft:end_portal_frame[facing=east,eye=true]

# Place signs
execute at @e[type=minecraft:area_effect_cloud,name="LobbyPoint",tag=FacingEast] run setblock ^ ^ ^1 minecraft:oak_sign[rotation=12]
execute at @e[type=minecraft:area_effect_cloud,name="LobbyPoint",tag=FacingWest] run setblock ^ ^ ^1 minecraft:oak_sign[rotation=4]

# Rotate those eyes
execute at @e[type=minecraft:area_effect_cloud,name="LobbyPoint"] run setblock ~ ~-1 ~ minecraft:end_portal_frame[facing=east,eye=true]

# Place signs
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=FacingEast] run setblock ^ ^ ^3 minecraft:oak_sign[rotation=4]
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=FacingWest] run setblock ^ ^ ^3 minecraft:oak_sign[rotation=12]

execute at @e[type=minecraft:area_effect_cloud,name="Generator"] run data merge block ^ ^ ^3 {Text3: "{\"translate\":\"calamity.generator.sign.ready\"}", Text3: "{\"text\":\"---\"}"}
# Update signs
# Resources
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Arrow] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"item.minecraft.arrow\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"32\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Chain] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"block.minecraft.chain\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"24\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Cobblestone] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"block.minecraft.cobblestone\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"9\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Enchant] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"container.enchant\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.enchant\"}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=GoldIngot] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"item.minecraft.gold_ingot\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"24\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Log] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"block.minecraft.birch_log\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"16\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Scaffolding] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"block.minecraft.scaffolding\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"16\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=TNT] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"block.minecraft.tnt\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"3\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=ArrowOfSlowFalling] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.slow_falling\"}]}", Text2: "{\"translate\":\"item.minecraft.tipped_arrow\"}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"32\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=SpectralArrow] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"item.minecraft.spectral_arrow\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"32\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=LingeringPotionOfLevitation] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.levitation\"}]}", Text2: "{\"translate\":\"item.minecraft.lingering_potion\"}", Text4: "{\"translate\":\"calamity.generator.sign.perPlayer\",\"with\":[{\"text\":\"2\"}]}"}

# Effects
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Blindness] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.blindness\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.attack\",\"with\":[{\"text\":\"30\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Haste] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.haste\"},{\"translate\":\"spacer.left\",\"with\":[{\"translate\":\"potion.potency.3\"}]}]}", Text4: "{\"translate\":\"calamity.generator.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=MiningFatigue] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.mining_fatigue\"},{\"translate\":\"spacer.left\",\"with\":[{\"translate\":\"potion.potency.1\"}]}]}", Text4: "{\"translate\":\"calamity.generator.sign.attack\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Regeneration] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.regeneration\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Resistance] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.resistance\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Speed] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.speed\"},{\"translate\":\"spacer.left\",\"with\":[{\"translate\":\"potion.potency.1\"}]}]}", Text4: "{\"translate\":\"calamity.generator.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=minecraft:area_effect_cloud,name="Generator",tag=Strength] run data merge block ^ ^ ^3 {Text1: "{\"translate\":\"calamity.generator.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.strength\"}]}", Text4: "{\"translate\":\"calamity.generator.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}