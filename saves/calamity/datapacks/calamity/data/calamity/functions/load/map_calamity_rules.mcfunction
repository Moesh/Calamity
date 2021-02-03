# Called from: #calamity:load

#---------------------------------------------------------------------------------------------------
# Purpose: Game rules control global elements of the game.
#---------------------------------------------------------------------------------------------------
# Removing and readding objectives complete wipes the set data and sets these values.
scoreboard objectives remove mapRules
scoreboard objectives add mapRules dummy
    # PointChargeTime: Point refers to resource points, a physical location on the map where players
    #   can gain  resources or status effects for their team. ChargeTime refers to how much time
    #   must pass before resources or status effects are given. ResetTime refers to how much time
    #   must passes before the the resource point can be used again. 
    # 20 redstone ticks = 1 second
    # 400/20 = 20 seconds
	scoreboard players set PointChargeTime mapRules 400
	scoreboard players set PointResetTime mapRules 400

    # Count Iron Ore and set the objective. The amount of iron ore left in the mine is the score
    # teams must get to win the game.
    function calamity:load/count_iron_ore

# The percentage of players who has to trigger the gg trigger before the team will forfeit
# Number has to be between 0(%) and 100(%).
scoreboard players set PercentPlayersToForfeit mapRules 75
    
# Craft items are worth points. This scoreboard tracks those points.
# iron_nugget and iron_block have been intentionally left out.
# Diamond can be found on the map, I am not counting these for points.
scoreboard objectives remove itemValues
scoreboard objectives add itemValues dummy
# Some recipes gives more items than 1. This scoreboard tracks how many items the recipe gives.
# This is needed since minecraft.crafted:minecraft.* goes up by the amount of items the recipe gives.
# (We don't want rails to give 6*16=96 points)
scoreboard objectives remove itemCounts
scoreboard objectives add itemCounts dummy
    # The number of lines in this list must exactly match the number of created objectives we
    #   create below.
    scoreboard players set activator_rail itemValues 6
    scoreboard players set activator_rail itemCounts 6
    scoreboard players set anvil itemValues 31
    scoreboard players set anvil itemCounts 1
    scoreboard players set blast_furnace itemValues 5
    scoreboard players set blast_furnace itemCounts 1
    scoreboard players set bucket itemValues 3
    scoreboard players set bucket itemCounts 1
    scoreboard players set cauldron itemValues 7
    scoreboard players set cauldron itemCounts 1
    scoreboard players set chain itemValues 1
    scoreboard players set chain itemCounts 1
    scoreboard players set compass itemValues 4
    scoreboard players set compass itemCounts 1
    scoreboard players set crossbow itemValues 1
    scoreboard players set crossbow itemCounts 1
    scoreboard players set detector_rail itemValues 6
    scoreboard players set detector_rail itemCounts 6
    scoreboard players set flint_and_steel itemValues 1
    scoreboard players set flint_and_steel itemCounts 1
    scoreboard players set heavy_weighted_pressure_plate itemValues 2
    scoreboard players set heavy_weighted_pressure_plate itemCounts 1
    scoreboard players set hopper itemValues 5
    scoreboard players set hopper itemCounts 1
    scoreboard players set iron_trapdoor itemValues 4
    scoreboard players set iron_trapdoor itemCounts 1
    scoreboard players set iron_axe itemValues 3
    scoreboard players set iron_axe itemCounts 1
    scoreboard players set iron_bars itemValues 6
    scoreboard players set iron_bars itemCounts 16
    scoreboard players set iron_boots itemValues 4
    scoreboard players set iron_boots itemCounts 1
    scoreboard players set iron_chestplate itemValues 8
    scoreboard players set iron_chestplate itemCounts 1
    scoreboard players set iron_door itemValues 6
    scoreboard players set iron_door itemCounts 3
    scoreboard players set iron_helmet itemValues 5
    scoreboard players set iron_helmet itemCounts 1
    scoreboard players set iron_hoe itemValues 2
    scoreboard players set iron_hoe itemCounts 1
    scoreboard players set iron_leggings itemValues 7
    scoreboard players set iron_leggings itemCounts 1
    scoreboard players set iron_pickaxe itemValues 3
    scoreboard players set iron_pickaxe itemCounts 1
    scoreboard players set iron_shovel itemValues 1
    scoreboard players set iron_shovel itemCounts 1
    scoreboard players set iron_sword itemValues 2
    scoreboard players set iron_sword itemCounts 1
    scoreboard players set minecart itemValues 5
    scoreboard players set minecart itemCounts 1
    scoreboard players set piston itemValues 1
    scoreboard players set piston itemCounts 1
    scoreboard players set rail itemValues 6
    scoreboard players set rail itemCounts 16
    scoreboard players set shears itemValues 2
    scoreboard players set shears itemCounts 1
    scoreboard players set shield itemValues 1
    scoreboard players set shield itemCounts 1
    scoreboard players set smithing_table itemValues 2
    scoreboard players set smithing_table itemCounts 1
    scoreboard players set stonecutter itemValues 1
    scoreboard players set stonecutter itemCounts 1
    scoreboard players set tripwire_hook itemValues 1
    scoreboard players set tripwire_hook itemCounts 2

# This list MUST exactly be double the amount of lines found in the list above.
scoreboard objectives remove craftedObjItem01
scoreboard objectives add craftedObjItem01 minecraft.crafted:minecraft.activator_rail
scoreboard objectives remove craftedObjItem02
scoreboard objectives add craftedObjItem02 minecraft.crafted:minecraft.anvil
scoreboard objectives remove craftedObjItem03
scoreboard objectives add craftedObjItem03 minecraft.crafted:minecraft.blast_furnace
scoreboard objectives remove craftedObjItem04
scoreboard objectives add craftedObjItem04 minecraft.crafted:minecraft.bucket
scoreboard objectives remove craftedObjItem05
scoreboard objectives add craftedObjItem05 minecraft.crafted:minecraft.cauldron
scoreboard objectives remove craftedObjItem06
scoreboard objectives add craftedObjItem06 minecraft.crafted:minecraft.chain
scoreboard objectives remove craftedObjItem07
scoreboard objectives add craftedObjItem07 minecraft.crafted:minecraft.compass
scoreboard objectives remove craftedObjItem08
scoreboard objectives add craftedObjItem08 minecraft.crafted:minecraft.crossbow
scoreboard objectives remove craftedObjItem09
scoreboard objectives add craftedObjItem09 minecraft.crafted:minecraft.detector_rail
scoreboard objectives remove craftedObjItem10
scoreboard objectives add craftedObjItem10 minecraft.crafted:minecraft.flint_and_steel
scoreboard objectives remove craftedObjItem11
scoreboard objectives add craftedObjItem11 minecraft.crafted:minecraft.heavy_weighted_pressure_plate
scoreboard objectives remove craftedObjItem12
scoreboard objectives add craftedObjItem12 minecraft.crafted:minecraft.hopper
scoreboard objectives remove craftedObjItem13
scoreboard objectives add craftedObjItem13 minecraft.crafted:minecraft.iron_trapdoor
scoreboard objectives remove craftedObjItem14
scoreboard objectives add craftedObjItem14 minecraft.crafted:minecraft.iron_axe
scoreboard objectives remove craftedObjItem15
scoreboard objectives add craftedObjItem15 minecraft.crafted:minecraft.iron_bars
scoreboard objectives remove craftedObjItem16
scoreboard objectives add craftedObjItem16 minecraft.crafted:minecraft.iron_boots
scoreboard objectives remove craftedObjItem17
scoreboard objectives add craftedObjItem17 minecraft.crafted:minecraft.iron_chestplate
scoreboard objectives remove craftedObjItem18
scoreboard objectives add craftedObjItem18 minecraft.crafted:minecraft.iron_door
scoreboard objectives remove craftedObjItem19
scoreboard objectives add craftedObjItem19 minecraft.crafted:minecraft.iron_helmet
scoreboard objectives remove craftedObjItem20
scoreboard objectives add craftedObjItem20 minecraft.crafted:minecraft.iron_hoe
scoreboard objectives remove craftedObjItem21
scoreboard objectives add craftedObjItem21 minecraft.crafted:minecraft.iron_leggings
scoreboard objectives remove craftedObjItem22
scoreboard objectives add craftedObjItem22 minecraft.crafted:minecraft.iron_pickaxe
scoreboard objectives remove craftedObjItem23
scoreboard objectives add craftedObjItem23 minecraft.crafted:minecraft.iron_shovel
scoreboard objectives remove craftedObjItem24
scoreboard objectives add craftedObjItem24 minecraft.crafted:minecraft.iron_sword
scoreboard objectives remove craftedObjItem25
scoreboard objectives add craftedObjItem25 minecraft.crafted:minecraft.minecart
scoreboard objectives remove craftedObjItem26
scoreboard objectives add craftedObjItem26 minecraft.crafted:minecraft.piston
scoreboard objectives remove craftedObjItem27
scoreboard objectives add craftedObjItem27 minecraft.crafted:minecraft.rail
scoreboard objectives remove craftedObjItem28
scoreboard objectives add craftedObjItem28 minecraft.crafted:minecraft.shears
scoreboard objectives remove craftedObjItem29
scoreboard objectives add craftedObjItem29 minecraft.crafted:minecraft.shield
scoreboard objectives remove craftedObjItem30
scoreboard objectives add craftedObjItem30 minecraft.crafted:minecraft.smithing_table
scoreboard objectives remove craftedObjItem31
scoreboard objectives add craftedObjItem31 minecraft.crafted:minecraft.stonecutter
scoreboard objectives remove craftedObjItem32
scoreboard objectives add craftedObjItem32 minecraft.crafted:minecraft.tripwire_hook
