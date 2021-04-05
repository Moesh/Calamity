data modify storage inv:main inv set value {}
data modify storage inv:main inv.all set value []
scoreboard objectives add Inventory dummy

forceload add 29999999 91665
setblock 29999999 0 91665 minecraft:shulker_box
setblock 29999999 1 91665 minecraft:bedrock
