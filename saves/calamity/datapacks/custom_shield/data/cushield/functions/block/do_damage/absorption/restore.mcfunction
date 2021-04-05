#converting into amplifier
scoreboard players set damage= cush.main 0
#scoreboard players add absorption= cush.main 1
scoreboard players operation absorption= cush.main /= 4 num
scoreboard players remove absorption= cush.main 1

#restoring effect to nearest value
execute if score absorption= cush.main matches 0.. run function cushield:block/do_damage/absorption/restore_cloud