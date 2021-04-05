#dummy scores
scoreboard objectives add cush.main dummy
scoreboard objectives add cush.wait dummy
scoreboard objectives add cush.wait.max dummy
scoreboard objectives add cush.block_time dummy
scoreboard objectives add cush.block_total dummy
scoreboard objectives add cush.durability dummy
scoreboard objectives add cush.reflect dummy

#effect removal score
scoreboard objectives add cush.effect dummy

#title display time and default icon mode
scoreboard objectives add cush.title dummy
execute unless score icon= cush.main matches 0..1 run scoreboard players set icon= cush.main 1

#coyote time scores
scoreboard objectives add cush.cy.dur dummy "coyote time duration"
scoreboard objectives add cush.cy.dam dummy "coyote time damage"
scoreboard objectives add cush.cy.abs dummy "coyote time absorption damage"
scoreboard objectives add cush.cy.has dummy "has coyote time shield"
scoreboard objectives add cush.cy.slot dummy "coyote time current slot"
scoreboard objectives add cush.cy.hit_by dummy "coyote time last hit by entity"
scoreboard objectives add cush.cy.disabl dummy "coyote time last hit by entity holding disabler weapon"
scoreboard objectives add cush.cy.ref.ty dummy "coyote time last hit by projectile type"

#stat scores
##angles
scoreboard objectives add cush.x_angle dummy "x block angle (vertical)"
scoreboard objectives add cush.y_angle dummy "y block angle (horizontal)"
##times
scoreboard objectives add cush.max_time dummy "maximum block time"
scoreboard objectives add cush.cooldown dummy "re-parry time"
scoreboard objectives add cush.spam dummy "spam detection"
##default values
scoreboard objectives add cush.block_val dummy "block value"
scoreboard objectives add cush.decay dummy "block value decay"
scoreboard objectives add cush.bl.eff.pl dummy "successful block player effect id"
scoreboard objectives add cush.bl.eff.en dummy "successful block entity effect id"
##parry values
scoreboard objectives add cush.parry dummy "parry time in ticks"
scoreboard objectives add cush.py.eff.pl dummy "successful parry player effect id"
scoreboard objectives add cush.py.eff.en dummy "successful parry entity effect id"
##resistance tracking
scoreboard objectives add cush.res.amp dummy "resistance amplifier"
scoreboard objectives add cush.res.par dummy "resistance particles"
scoreboard objectives add cush.res.dur dummy "resistance duration"
scoreboard objectives add cush.res.amb dummy "resistance ambient"
scoreboard objectives add cush.res.icn dummy "resistance icon"
##bash
scoreboard objectives add cush.bash dummy
##disabler
scoreboard objectives add cush.dis.dont dummy
scoreboard objectives add cush.dis.time dummy

#tracking scores
scoreboard objectives add cush.health health
scoreboard objectives add cush.atk minecraft.custom:minecraft.damage_dealt
scoreboard objectives add cush.dam minecraft.custom:minecraft.damage_taken
scoreboard objectives add cush.dmg minecraft.custom:minecraft.damage_resisted
scoreboard objectives add cush.use minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add cush.abs minecraft.custom:minecraft.damage_absorbed
scoreboard objectives add cush.fall minecraft.custom:minecraft.fall_one_cm
scoreboard objectives add cush.drop minecraft.dropped:minecraft.warped_fungus_on_a_stick
scoreboard objectives add cush.sprint minecraft.custom:minecraft.sprint_one_cm

#numbers used
scoreboard objectives add num dummy
scoreboard players set -1 num -1
scoreboard players set 2 num 2
scoreboard players set 4 num 4
scoreboard players set 10 num 10
scoreboard players set 11 num 11
scoreboard players set 20 num 20
scoreboard players set 25 num 25
scoreboard players set 100 num 100

#summoning armorstand used for angle calculations and placing shulker box used for item modification
function inv:setup
forceload add -1 -1 1 1
execute unless entity 63757368-0-0-0-1 run summon minecraft:armor_stand 0 0 0 {UUID:[I;1668641640,0,0,1],Marker:1b,Small:1b,Invisible:1b}