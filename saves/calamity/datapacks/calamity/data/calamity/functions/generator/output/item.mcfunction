#---------------------------------------------------------------------------------------------------
# Generate output for items
#---------------------------------------------------------------------------------------------------

# Give the player a score
scoreboard players operation @a[tag=GiveItem] captureScore += ScoreForCaptureResource mapRules

# Check for generator type and give items
execute as @s[tag=Arrow] run give @a[distance=..4,tag=GiveItem] minecraft:arrow 32
execute as @s[tag=ArrowOfSlowFalling] run give @a[distance=..4,tag=GiveItem] minecraft:tipped_arrow{Potion: "minecraft:slow_falling"} 16
execute as @s[tag=Chain] run give @a[distance=..4,tag=GiveItem] minecraft:chain 24
execute as @s[tag=Cobblestone] run give @a[distance=..4,tag=GiveItem] minecraft:cobblestone 9
execute as @s[tag=GoldIngot] run give @a[distance=..4,tag=GiveItem] minecraft:gold_ingot 24
execute as @s[tag=Log] run give @a[distance=..4,tag=GiveItem] minecraft:oak_log 16
execute as @s[tag=Scaffolding] run give @a[distance=..4,tag=GiveItem] minecraft:scaffolding 16
execute as @s[tag=SpectralArrow] run give @a[distance=..4,tag=GiveItem] minecraft:spectral_arrow 16
execute as @s[tag=SplashPotionOfLevitation] run give @a[distance=..4,tag=GiveItem] lingering_potion{display:{Name:'{"translate":"item.minecraft.lingering_potion.effect.levitation"}'},CustomPotionEffects:[{Id:25b,Amplifier:0b,Duration:220,ShowParticles:1b},{Id:28b,Amplifier:0b,Duration:260,ShowParticles:1b}],Potion:"minecraft:empty",CustomPotionColor:16777215} 1
execute as @s[tag=TNT] run give @a[distance=..4,tag=GiveItem] minecraft:tnt 3

# Play success sounds
execute as @a[tag=GiveItem] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.5 0.5

# Give title message and resource
tag @a[tag=GiveItem] add GiveMessage
tag @a[tag=GiveItem] remove GiveItem

# Resources
title @a[tag=GiveMessage] times 5 30 10
execute as @s[tag=Arrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.arrow"},{"text":"32"}]}
execute as @s[tag=ArrowOfLevitation] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.tipped_arrow.effect.levitation"},{"text":"16"}]}
execute as @s[tag=Cobblestone] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.cobblestone"},{"text":"9"}]}
execute as @s[tag=GoldIngot] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.gold_ingot"},{"text":"24"}]}
execute as @s[tag=Log] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.birch_log"},{"text":"16"}]}
execute as @s[tag=Scaffolding] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.scaffolding"},{"text":"16"}]}
execute as @s[tag=SpectralArrow] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.spectral_arrow"},{"text":"16"}]}
execute as @s[tag=SplashPotionOfSlowFalling] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"item.minecraft.potion.effect.slow_falling"},{"text":"1"}]}
execute as @s[tag=TNT] run title @a[distance=..4,tag=GiveMessage] actionbar {"translate":"calamity.generator.output.item","with":[{"translate":"block.minecraft.tnt"},{"text":"3"}]}