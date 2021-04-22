# Called from: #calamity:load

#>--------------------------------------------------------------------------------------------------
#> Purpose: We're reloading the map, reset all of the player's tags
#>--------------------------------------------------------------------------------------------------

tag @a remove ForfeitTriggered
tag @a remove GiveEffects
tag @a remove GiveEnchant
tag @a remove GiveMessage
tag @a remove GiveMessageAttack
tag @a remove GiveMessageAttacked
tag @a remove GiveResources
tag @a remove Playing
tag @a remove Registered
tag @a remove Spectating
tag @a remove StopForfeit
tag @a remove VotedForfeit