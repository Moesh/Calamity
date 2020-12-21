# Called from: #moesh:load

#---------------------------------------------------------------------------------------------------
# Purpose: Load
#---------------------------------------------------------------------------------------------------

# The players are decidely always in the play space. We can assume it's safe to remove all resource
#   points and reset them. This file could 
kill @e[type=area_effect_cloud,tag=Point]
# Blue team resource points only appear on the blue lane
summon minecraft:area_effect_cloud 169 42 118 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamBlue","Resource","Log"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 164 43 142 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamBlue","Resource","Cobblestone"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 150 40 136 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamBlue","Resource","GoldIngot"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 151 56 154 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamBlue","Resource","Arrow"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 157 55 173 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamBlue","Resource","TNT"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
# Blue team effect points only appear on the red lane
summon minecraft:area_effect_cloud 115 50 189 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamBlue","Effect","Regeneration"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 102 41 162 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamBlue","Effect","Resistance"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 122 32 162 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamBlue","Effect","Strength"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 115 18 189 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamBlue","Effect","Speed"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
# Red team resource points only appear on the red lane
summon minecraft:area_effect_cloud 103 42 118 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamRed","Resource","Log"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 108 43 142 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamRed","Resource","Cobblestone"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 122 40 136 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamRed","Resource","GoldIngot"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 121 56 154 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamRed","Resource","Arrow"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 115 55 173 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingEast","TeamRed","Resource","TNT"],CustomNameVisible:1b,Duration:2147483647,Rotation:[-90.0f,-0.0f]}
summon minecraft:area_effect_cloud 157 50 189 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamRed","Effect","Regeneration"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 170 41 162 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamRed","Effect","Resistance"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 150 32 162 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamRed","Effect","Strength"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
summon minecraft:area_effect_cloud 157 18 189 {CustomName:'{"text":"ResourcePoint"}',Tags:["Point","FacingWest","TeamRed","Effect","Speed"],CustomNameVisible:1b,Duration:2147483647,Rotation:[90.0f,-0.0f]}
# Major Points
summon minecraft:area_effect_cloud 136 55 188 {CustomName:'{"text":"MajorPoint"}',Tags:["Point","FacingNorth","ExperienceBottle"],CustomNameVisible:1b,Duration:2147483647,Rotation:[180.0f,-0.0f]}
summon minecraft:area_effect_cloud 136 23 188 {CustomName:'{"text":"MajorPoint"}',Tags:["Point","FacingNorth","IronIngot"],CustomNameVisible:1b,Duration:2147483647,Rotation:[180.0f,-0.0f]}
# Objective
summon minecraft:area_effect_cloud 159 43 100 {CustomName:'{"text":"Objective"}',Tags:["Point","FacingNorth","TeamBlue"],CustomNameVisible:1b,Duration:2147483647,Rotation:[180.0f,-0.0f]}
summon minecraft:area_effect_cloud 113 43 100 {CustomName:'{"text":"Objective"}',Tags:["Point","FacingNorth","TeamRed"],CustomNameVisible:1b,Duration:2147483647,Rotation:[180.0f,-0.0f]}

#
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
