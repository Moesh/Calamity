#running block check if tagged as blocking
execute if entity @s[tag=cushield.blocking] run function cushield:block/hit_check
execute if entity @s[tag=cushield.coyote] unless score @s cush.block_total matches 1.. run function cushield:coyote