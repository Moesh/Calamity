#ending block state
tag @s add cushield.end_from_hand
tag @s add cushield.ended
function cushield:block/end

#fixing shield data in the inventory
data modify storage cushield:main player set from entity @s Inventory
data modify storage cushield:main player[{tag:{blocking:1b}}].tag.CustomModelData set from storage cushield:main player[{tag:{blocking:1b}}].tag.shield.default_model
data remove storage cushield:main player[{tag:{blocking:1b}}].tag.blocking

#restoring inventory
function inv:internal/reset
data modify storage inv:main inv.all set from storage cushield:main player
data modify storage cushield:main player set value {}
function inv:load