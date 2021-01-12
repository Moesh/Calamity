# Called from: moesh:points/handler

#---------------------------------------------------------------------------------------------------
# Purpose: Determine if this player has crafted an item and transfer the correlating point value to
#   prepScore for further processing.
#---------------------------------------------------------------------------------------------------

scoreboard players operation @s[scores={craftedObjItem01=1..}] craftedScore = @s craftedObjItem01
scoreboard players operation @s[scores={craftedObjItem01=1..}] craftedScore *= activator_rail itemValues
scoreboard players operation @s[scores={craftedObjItem01=1..}] craftedScore /= activator_rail itemCounts
scoreboard players operation @s[scores={craftedObjItem01=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem02=1..}] craftedScore = @s craftedObjItem02
scoreboard players operation @s[scores={craftedObjItem02=1..}] craftedScore *= anvil itemValues
scoreboard players operation @s[scores={craftedObjItem02=1..}] craftedScore /= anvil itemCounts
scoreboard players operation @s[scores={craftedObjItem02=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem03=1..}] craftedScore = @s craftedObjItem03
scoreboard players operation @s[scores={craftedObjItem03=1..}] craftedScore *= blast_furnace itemValues
scoreboard players operation @s[scores={craftedObjItem03=1..}] craftedScore /= blast_furnace itemCounts
scoreboard players operation @s[scores={craftedObjItem03=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem04=1..}] craftedScore = @s craftedObjItem04
scoreboard players operation @s[scores={craftedObjItem04=1..}] craftedScore *= bucket itemValues
scoreboard players operation @s[scores={craftedObjItem04=1..}] craftedScore /= bucket itemCounts
scoreboard players operation @s[scores={craftedObjItem04=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem05=1..}] craftedScore = @s craftedObjItem05
scoreboard players operation @s[scores={craftedObjItem05=1..}] craftedScore *= cauldron itemValues
scoreboard players operation @s[scores={craftedObjItem05=1..}] craftedScore /= cauldron itemCounts
scoreboard players operation @s[scores={craftedObjItem05=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem06=1..}] craftedScore = @s craftedObjItem06
scoreboard players operation @s[scores={craftedObjItem06=1..}] craftedScore *= chain itemValues
scoreboard players operation @s[scores={craftedObjItem06=1..}] craftedScore /= chain itemCounts
scoreboard players operation @s[scores={craftedObjItem06=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem07=1..}] craftedScore = @s craftedObjItem07
scoreboard players operation @s[scores={craftedObjItem07=1..}] craftedScore *= compass itemValues
scoreboard players operation @s[scores={craftedObjItem07=1..}] craftedScore /= compass itemCounts
scoreboard players operation @s[scores={craftedObjItem07=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem08=1..}] craftedScore = @s craftedObjItem08
scoreboard players operation @s[scores={craftedObjItem08=1..}] craftedScore *= crossbow itemValues
scoreboard players operation @s[scores={craftedObjItem08=1..}] craftedScore /= crossbow itemCounts
scoreboard players operation @s[scores={craftedObjItem08=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem09=1..}] craftedScore = @s craftedObjItem09
scoreboard players operation @s[scores={craftedObjItem09=1..}] craftedScore *= detector_rail itemValues
scoreboard players operation @s[scores={craftedObjItem09=1..}] craftedScore /= detector_rail itemCounts
scoreboard players operation @s[scores={craftedObjItem09=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem10=1..}] craftedScore = @s craftedObjItem10
scoreboard players operation @s[scores={craftedObjItem10=1..}] craftedScore *= flint_and_steel itemValues
scoreboard players operation @s[scores={craftedObjItem10=1..}] craftedScore /= flint_and_steel itemCounts
scoreboard players operation @s[scores={craftedObjItem10=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem11=1..}] craftedScore = @s craftedObjItem11
scoreboard players operation @s[scores={craftedObjItem11=1..}] craftedScore *= heavy_weighted_pressure_plate itemValues
scoreboard players operation @s[scores={craftedObjItem11=1..}] craftedScore /= heavy_weighted_pressure_plate itemCounts
scoreboard players operation @s[scores={craftedObjItem11=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem12=1..}] craftedScore = @s craftedObjItem12
scoreboard players operation @s[scores={craftedObjItem12=1..}] craftedScore *= hopper itemValues
scoreboard players operation @s[scores={craftedObjItem12=1..}] craftedScore /= hopper itemCounts
scoreboard players operation @s[scores={craftedObjItem12=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem13=1..}] craftedScore = @s craftedObjItem13
scoreboard players operation @s[scores={craftedObjItem13=1..}] craftedScore *= iron_trapdoor itemValues
scoreboard players operation @s[scores={craftedObjItem13=1..}] craftedScore /= iron_trapdoor itemCounts
scoreboard players operation @s[scores={craftedObjItem13=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem14=1..}] craftedScore = @s craftedObjItem14
scoreboard players operation @s[scores={craftedObjItem14=1..}] craftedScore *= iron_axe itemValues
scoreboard players operation @s[scores={craftedObjItem14=1..}] craftedScore /= iron_axe itemCounts
scoreboard players operation @s[scores={craftedObjItem14=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem15=1..}] craftedScore = @s craftedObjItem15
scoreboard players operation @s[scores={craftedObjItem15=1..}] craftedScore *= iron_bars itemValues
scoreboard players operation @s[scores={craftedObjItem15=1..}] craftedScore /= iron_bars itemCounts
scoreboard players operation @s[scores={craftedObjItem15=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem16=1..}] craftedScore = @s craftedObjItem16
scoreboard players operation @s[scores={craftedObjItem16=1..}] craftedScore *= iron_boots itemValues
scoreboard players operation @s[scores={craftedObjItem16=1..}] craftedScore /= iron_boots itemCounts
scoreboard players operation @s[scores={craftedObjItem16=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem17=1..}] craftedScore = @s craftedObjItem17
scoreboard players operation @s[scores={craftedObjItem17=1..}] craftedScore *= iron_chestplate itemValues
scoreboard players operation @s[scores={craftedObjItem17=1..}] craftedScore /= iron_chestplate itemCounts
scoreboard players operation @s[scores={craftedObjItem17=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem18=1..}] craftedScore = @s craftedObjItem18
scoreboard players operation @s[scores={craftedObjItem18=1..}] craftedScore *= iron_door itemValues
scoreboard players operation @s[scores={craftedObjItem18=1..}] craftedScore /= iron_door itemCounts
scoreboard players operation @s[scores={craftedObjItem18=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem19=1..}] craftedScore = @s craftedObjItem19
scoreboard players operation @s[scores={craftedObjItem19=1..}] craftedScore *= iron_helmet itemValues
scoreboard players operation @s[scores={craftedObjItem19=1..}] craftedScore /= iron_helmet itemCounts
scoreboard players operation @s[scores={craftedObjItem19=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem20=1..}] craftedScore = @s craftedObjItem20
scoreboard players operation @s[scores={craftedObjItem20=1..}] craftedScore *= iron_hoe itemValues
scoreboard players operation @s[scores={craftedObjItem20=1..}] craftedScore /= iron_hoe itemCounts
scoreboard players operation @s[scores={craftedObjItem20=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem21=1..}] craftedScore = @s craftedObjItem21
scoreboard players operation @s[scores={craftedObjItem21=1..}] craftedScore *= iron_leggings itemValues
scoreboard players operation @s[scores={craftedObjItem21=1..}] craftedScore /= iron_leggings itemCounts
scoreboard players operation @s[scores={craftedObjItem21=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem22=1..}] craftedScore = @s craftedObjItem22
scoreboard players operation @s[scores={craftedObjItem22=1..}] craftedScore *= iron_pickaxe itemValues
scoreboard players operation @s[scores={craftedObjItem22=1..}] craftedScore /= iron_pickaxe itemCounts
scoreboard players operation @s[scores={craftedObjItem22=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem23=1..}] craftedScore = @s craftedObjItem23
scoreboard players operation @s[scores={craftedObjItem23=1..}] craftedScore *= iron_shovel itemValues
scoreboard players operation @s[scores={craftedObjItem23=1..}] craftedScore /= iron_shovel itemCounts
scoreboard players operation @s[scores={craftedObjItem23=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem24=1..}] craftedScore = @s craftedObjItem24
scoreboard players operation @s[scores={craftedObjItem24=1..}] craftedScore *= iron_sword itemValues
scoreboard players operation @s[scores={craftedObjItem24=1..}] craftedScore /= iron_sword itemCounts
scoreboard players operation @s[scores={craftedObjItem24=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem25=1..}] craftedScore = @s craftedObjItem25
scoreboard players operation @s[scores={craftedObjItem25=1..}] craftedScore *= minecart itemValues
scoreboard players operation @s[scores={craftedObjItem25=1..}] craftedScore /= minecart itemCounts
scoreboard players operation @s[scores={craftedObjItem25=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem26=1..}] craftedScore = @s craftedObjItem26
scoreboard players operation @s[scores={craftedObjItem26=1..}] craftedScore *= piston itemValues
scoreboard players operation @s[scores={craftedObjItem26=1..}] craftedScore /= piston itemCounts
scoreboard players operation @s[scores={craftedObjItem26=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem27=1..}] craftedScore = @s craftedObjItem27
scoreboard players operation @s[scores={craftedObjItem27=1..}] craftedScore *= rail itemValues
scoreboard players operation @s[scores={craftedObjItem27=1..}] craftedScore /= rail itemCounts
scoreboard players operation @s[scores={craftedObjItem27=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem28=1..}] craftedScore = @s craftedObjItem28
scoreboard players operation @s[scores={craftedObjItem28=1..}] craftedScore *= shears itemValues
scoreboard players operation @s[scores={craftedObjItem28=1..}] craftedScore /= shears itemCounts
scoreboard players operation @s[scores={craftedObjItem28=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem29=1..}] craftedScore = @s craftedObjItem29
scoreboard players operation @s[scores={craftedObjItem29=1..}] craftedScore *= shield itemValues
scoreboard players operation @s[scores={craftedObjItem29=1..}] craftedScore /= shield itemCounts
scoreboard players operation @s[scores={craftedObjItem29=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem30=1..}] craftedScore = @s craftedObjItem30
scoreboard players operation @s[scores={craftedObjItem30=1..}] craftedScore *= smithing_table itemValues
scoreboard players operation @s[scores={craftedObjItem30=1..}] craftedScore /= smithing_table itemCounts
scoreboard players operation @s[scores={craftedObjItem30=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem31=1..}] craftedScore = @s craftedObjItem31
scoreboard players operation @s[scores={craftedObjItem31=1..}] craftedScore *= stonecutter itemValues
scoreboard players operation @s[scores={craftedObjItem31=1..}] craftedScore /= stonecutter itemCounts
scoreboard players operation @s[scores={craftedObjItem31=1..}] prepScore += @s craftedScore
scoreboard players operation @s[scores={craftedObjItem32=1..}] craftedScore = @s craftedObjItem32
scoreboard players operation @s[scores={craftedObjItem32=1..}] craftedScore *= tripwire_hook itemValues
scoreboard players operation @s[scores={craftedObjItem32=1..}] craftedScore /= tripwire_hook itemCounts
scoreboard players operation @s[scores={craftedObjItem32=1..}] prepScore += @s craftedScore

# We've checked everyone this tick, clear their scores.
scoreboard players reset * craftedObjItem01
scoreboard players reset * craftedObjItem02
scoreboard players reset * craftedObjItem03
scoreboard players reset * craftedObjItem04
scoreboard players reset * craftedObjItem05
scoreboard players reset * craftedObjItem06
scoreboard players reset * craftedObjItem07
scoreboard players reset * craftedObjItem08
scoreboard players reset * craftedObjItem09
scoreboard players reset * craftedObjItem10
scoreboard players reset * craftedObjItem11
scoreboard players reset * craftedObjItem12
scoreboard players reset * craftedObjItem13
scoreboard players reset * craftedObjItem14
scoreboard players reset * craftedObjItem15
scoreboard players reset * craftedObjItem16
scoreboard players reset * craftedObjItem17
scoreboard players reset * craftedObjItem18
scoreboard players reset * craftedObjItem19
scoreboard players reset * craftedObjItem20
scoreboard players reset * craftedObjItem21
scoreboard players reset * craftedObjItem22
scoreboard players reset * craftedObjItem23
scoreboard players reset * craftedObjItem24
scoreboard players reset * craftedObjItem25
scoreboard players reset * craftedObjItem26
scoreboard players reset * craftedObjItem27
scoreboard players reset * craftedObjItem28
scoreboard players reset * craftedObjItem29
scoreboard players reset * craftedObjItem30
scoreboard players reset * craftedObjItem31
scoreboard players reset * craftedObjItem32