#setting entity parry effect
scoreboard players operation entity_parry= cush.main = @s cush.py.eff.en

#running player effect if applicable
execute if score @s cush.py.eff.pl matches 1.. run function cushield:blocked/parry/player

#negating damage
scoreboard players set @s cush.dmg 0

#playing sound
playsound shield:large_shield.parry player @a

#particles
execute anchored eyes run particle enchanted_hit ^ ^-0.25 ^0.25 0.1 0.1 0.1 0.2 8 normal @s