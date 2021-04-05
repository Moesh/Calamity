#setting entity parry effect
scoreboard players operation entity_block= cush.main = @s cush.bl.eff.en

#running player effect if applicable
execute if score @s cush.bl.eff.pl matches 1.. run function cushield:blocked/normal/player

#damage calculations 
## formula v1 
## damage * 10 - ((block_value * 100) - ((time - parry_time) * decay))
#writing scores
scoreboard players operation decay= cush.dmg = @s cush.decay
scoreboard players operation parry= cush.dmg = @s cush.parry
scoreboard players operation block_val= cush.dmg = @s cush.block_val
scoreboard players operation block_total= cush.dmg = @s cush.block_total

#math
scoreboard players operation @s cush.dmg *= 10 num
scoreboard players operation block_val= cush.dmg *= 100 num
scoreboard players operation block_total= cush.dmg -= parry= cush.dmg
scoreboard players operation block_total= cush.dmg *= decay= cush.dmg
scoreboard players operation block_val= cush.dmg -= block_total= cush.dmg
scoreboard players operation @s cush.dmg -= block_val= cush.dmg
scoreboard players operation @s cush.dmg /= 10 num

#maxing out
execute if score @s cush.dmg matches ..-1 run scoreboard players set @s cush.dmg 0

#playing sound
execute if score @s cush.dmg matches 1.. run playsound shield:large_shield.block_some player @a
execute if score @s cush.dmg matches 0 run playsound shield:large_shield.block_all player @a
execute if score @s cush.dmg matches 0 run playsound shield:large_shield.block_all.wobble player @a

#particles
execute anchored eyes run particle crit ^ ^-0.25 ^0.25 0.1 0.1 0.1 0.2 8 normal @s