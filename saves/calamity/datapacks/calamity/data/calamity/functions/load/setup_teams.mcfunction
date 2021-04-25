# Called from: #calamity:load

#>--------------------------------------------------------------------------------------------------
#> Purpose: Add teams.
#>--------------------------------------------------------------------------------------------------

# Remove Scoreboard Teams
team remove lobby
team remove spectator
team remove blue
team remove red
team remove finishLine

# Add And Configure Scoreboard Teams
team add lobby {"translate":"team.name.lobby"}
team add spectator {"translate":"team.name.spectator"}
	team modify spectator collisionRule pushOtherTeams
	team modify spectator deathMessageVisibility never
	team modify spectator seeFriendlyInvisibles false
	team modify spectator color gray
team add blue {"translate":"team.blue"}
	team modify blue collisionRule pushOtherTeams
	team modify blue color blue
	team modify blue deathMessageVisibility always
	team modify blue friendlyFire false
	team modify blue nametagVisibility always
	team modify blue seeFriendlyInvisibles true
	team modify blue suffix {"translate":"spacer.left","color":"blue","with": [{"translate":"b","font":"calamity:icons"}]}
team add red {"translate":"team.red"}
	team modify red collisionRule pushOtherTeams
	team modify red color red
	team modify red deathMessageVisibility always
	team modify red friendlyFire false
	team modify red nametagVisibility always
	team modify red seeFriendlyInvisibles true
	team modify red suffix {"translate":"spacer.left","color":"red","with": [{"translate":"r","font":"calamity:icons"}]}
team add fakeBlue {"translate":"team.blue"}
	team modify fakeBlue collisionRule pushOtherTeams
	team modify fakeBlue color blue
	team modify fakeBlue prefix {"translate":"spacer.right","color":"blue","with": [{"translate":"☒","color":"dark_red"}]}
	team modify fakeBlue suffix {"translate":"spacer.left","color":"blue","with": [{"translate":"b","font":"calamity:icons"}]}
team add fakeRed {"translate":"team.red"}
	team modify fakeRed collisionRule pushOtherTeams
	team modify fakeRed color red
	team modify fakeRed prefix {"translate":"spacer.right","color":"red","with": [{"translate":"☒","color":"dark_red"}]}
	team modify fakeRed suffix {"translate":"spacer.left","color":"red","with": [{"translate":"r","font":"calamity:icons"}]}
team add finishLine
	team modify finishLine color white
	team modify finishLine suffix {"translate":"spacer.left","color":"white","with": [{"translate":"i","font":"calamity:icons","color":"white"}]}

# AddFakePlayersToTeam
team join fakeBlue Blue
team join fakeRed Red
team join finishLine ░░░░░░