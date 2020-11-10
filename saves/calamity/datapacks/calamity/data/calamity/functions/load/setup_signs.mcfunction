# Resource points
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=FacingEast] run setblock ^ ^ ^3 minecraft:oak_sign[rotation=4]
execute at @e[type=area_effect_cloud,name=ResourcePoint,tag=FacingWest] run setblock ^ ^ ^3 minecraft:oak_sign[rotation=12]
execute at @e[type=area_effect_cloud,name=ResourcePoint] run data merge block ^ ^ ^3 {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}",Text3:"{\"text\":\"---\"}"}

execute at @e[type=area_effect_cloud,tag=Log] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"block.minecraft.birch_log\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"16\"}]}"}
execute at @e[type=area_effect_cloud,tag=GoldIngot] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"item.minecraft.gold_ingot\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"24\"}]}"}
execute at @e[type=area_effect_cloud,tag=Cobblestone] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"block.minecraft.cobblestone\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"9\"}]}"}
execute at @e[type=area_effect_cloud,tag=Arrow] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"item.minecraft.arrow\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"32\"}]}"}
execute at @e[type=area_effect_cloud,tag=TNT] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"block.minecraft.tnt\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"8\"}]}"}
execute at @e[type=area_effect_cloud,tag=Regeneration] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.regeneration\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=area_effect_cloud,tag=Resistance] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.resistance\"},{\"translate\":\"resourcePoint.output.effect.level2\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=area_effect_cloud,tag=Strength] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.strength\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=area_effect_cloud,tag=Speed] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.speed\"},{\"translate\":\"resourcePoint.output.effect.level2\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}
execute at @e[type=area_effect_cloud,tag=Haste] run data merge block ^ ^ ^3 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"effect.minecraft.haste\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perTeam\",\"with\":[{\"text\":\"45\"}]}"}

# Major points
execute at @e[type=area_effect_cloud,tag=FacingNorth] run setblock ^ ^ ^6 minecraft:oak_sign[rotation=0]
execute at @e[type=area_effect_cloud,name=MajorPoint] run data merge block ^ ^ ^6 {Text2:"{\"translate\":\"resourcePoint.sign.ready\"}",Text3:"{\"text\":\"---\"}"}

execute at @e[type=area_effect_cloud,tag=IronIngot] run data merge block ^ ^ ^6 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"majorPoint.sign.ironIngot\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"6\"}]}"}
execute at @e[type=area_effect_cloud,tag=ExperienceBottle] run data merge block ^ ^ ^6 {Text1:"{\"translate\":\"resourcePoint.sign.type\",\"with\":[{\"translate\":\"majorPoint.sign.experienceBottle\"}]}",Text4:"{\"translate\":\"resourcePoint.sign.perPlayer\",\"with\":[{\"text\":\"12\"}]}"}