#writing into storage {Ambient: 0b, ShowIcon: 0b, ShowParticles: 0b, Duration: 20, Id: 11b, Amplifier: 0b}
data modify storage cushield:main effect set from entity @s ActiveEffects[{Id:11b}] 

#reading values
execute store result score @s cush.res.amp run data get storage cushield:main effect.Amplifier
execute store result score @s cush.res.par run data get storage cushield:main effect.ShowParticles
execute store result score @s cush.res.dur run data get storage cushield:main effect.Duration
execute store result score @s cush.res.amb run data get storage cushield:main effect.Ambient
execute store result score @s cush.res.icn run data get storage cushield:main effect.ShowIcon