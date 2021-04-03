# Called from: #calamity:load

#---------------------------------------------------------------------------------------------------
# Purpose: We're reloading the map, let's reset players to default state.
#---------------------------------------------------------------------------------------------------
tag @a remove Registered
tag @a remove Spectating
tag @a remove Playing
tag @a remove ForfeitTriggered
tag @a remove StopForfeit
tag @a remove VotedForfeit
tag @a remove GiveMessage
tag @a remove GiveMessageAttack
tag @a remove GiveMessageAttacked
tag @a remove GiveEffects
tag @a remove GiveEnchant
tag @a remove GiveResources