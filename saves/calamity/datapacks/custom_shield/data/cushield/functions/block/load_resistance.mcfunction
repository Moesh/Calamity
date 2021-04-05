#writing blank effect
data modify storage cushield:main effect set value {Ambient: 0b, ShowIcon: 0b, ShowParticles: 0b, Duration: 20, Id: 11b, Amplifier: 0b}

#writing values
execute store result storage cushield:main effect.Amplifier byte 1 run scoreboard players get @s cush.res.amp
execute store result storage cushield:main effect.ShowParticles byte 1 run scoreboard players get @s cush.res.par
execute store result storage cushield:main effect.Duration int 1 run scoreboard players get @s cush.res.dur
execute store result storage cushield:main effect.Ambient byte 1 run scoreboard players get @s cush.res.amb
execute store result storage cushield:main effect.ShowIcon byte 1 run scoreboard players get @s cush.res.icn

#summoning cloud
summon minecraft:area_effect_cloud ~ ~ ~ {Particle:"minecraft:block minecraft:air",ReapplicationDelay:0,Age:-1,Radius:0.5f,RadiusPerTick:0f,RadiusOnUse:-0.5f,Duration:2,WaitTime:0,Effects:[{Id:1b,Amplifier:1b,Duration:1,ShowParticles:1b,ShowIcon:1b,Ambient:0b}],Tags:["utilEffectCloud"]}

#writing effect
data modify entity @e[type=minecraft:area_effect_cloud,tag=utilEffectCloud,distance=..1,sort=nearest,limit=1] Effects[0] set from storage cushield:main effect