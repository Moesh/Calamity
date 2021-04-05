#setting coyote duration
execute if entity @s[tag=cushield.coyote.off] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:-106b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.0,nbt={SelectedItemSlot:0}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:0b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.1,nbt={SelectedItemSlot:1}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:1b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.2,nbt={SelectedItemSlot:2}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:2b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.3,nbt={SelectedItemSlot:3}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:3b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.4,nbt={SelectedItemSlot:4}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:4b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.5,nbt={SelectedItemSlot:5}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:5b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.6,nbt={SelectedItemSlot:6}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:6b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.7,nbt={SelectedItemSlot:7}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:7b}].tag.shield.coyote_time
execute if entity @s[tag=!cushield.coyote.off,tag=cushield.coyote.8,nbt={SelectedItemSlot:8}] store result score @s cush.cy.dur run data get entity @s Inventory[{Slot:8b}].tag.shield.coyote_time

#specifying attacker
scoreboard players operation @s cush.cy.hit_by = attacker= entityid
scoreboard players operation @s cush.cy.disabl = disable= cush.main
scoreboard players operation @s cush.cy.dam = @s cush.dam
scoreboard players operation @s cush.cy.abs = @s cush.abs
function cushield:coyote/reflect