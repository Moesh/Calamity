execute if entity @s[tag=cushield.offhand] if predicate cushield:blocking_mainhand run function cushield:hand_check/in_main
execute if entity @s[tag=!cushield.offhand] if predicate cushield:blocking_offhand run function cushield:hand_check/in_off
execute if entity @s[tag=!cushield.offhand,tag=!cushield.ended] unless predicate cushield:blocking_mainhand run function cushield:block/unblock_all
execute if entity @s[tag=cushield.offhand,tag=!cushield.ended] unless predicate cushield:blocking_offhand run function cushield:block/unblock_all
tag @s remove cushield.ended