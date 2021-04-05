#ending block
tag @s add cushield.end
tag @s add cushield.blocked
scoreboard players reset @s cush.drop

#executing as dropped item
execute as @e[type=item,distance=..2,nbt={Item:{tag:{blocking:1b}}},limit=1,sort=nearest] run function cushield:block/drop/as_item