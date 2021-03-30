# Called from: #calamity:load

#---------------------------------------------------------------------------------------------------
# Purpose: Add teams.
#---------------------------------------------------------------------------------------------------

# Remove Scoreboard Teams
team remove lobby
team remove spectator
team remove blue
team remove red

# Add And Configure Scoreboard Teams
team add lobby {"translate":"team.name.lobby"}
team add spectator {"translate":"team.name.spectator"}
	team modify gray color gray
team add blue {"translate":"team.name.blue"}
	team modify blue collisionRule pushOtherTeams
	team modify blue color blue
	team modify blue deathMessageVisibility always
	team modify blue friendlyFire false
	team modify blue nametagVisibility always
	team modify blue seeFriendlyInvisibles true
team add red {"translate":"team.name.red"}
	team modify red collisionRule pushOtherTeams
	team modify red color red
	team modify red deathMessageVisibility always
	team modify red friendlyFire false
	team modify red nametagVisibility always
	team modify red seeFriendlyInvisibles true
	team modify blue suffix {"translate":" b","color":"blue","font":"calamity:icons"}
	team modify red suffix {"translate":" r","color":"red","font":"calamity:icons"}
team add fakeBlue {"translate":"team.name.blue"}
	team modify fakeBlue collisionRule pushOtherTeams
	team modify fakeBlue color blue
	team modify fakeBlue prefix {"translate":"☒ ","color":"dark_red"}
	team modify fakeBlue suffix {"translate":" b","color":"blue","font":"calamity:icons"}
team add fakeRed {"translate":"team.name.red"}
	team modify fakeRed collisionRule pushOtherTeams
	team modify fakeRed color red
	team modify fakeRed prefix {"translate":"☒ ","color":"dark_red"}
	team modify fakeRed suffix {"translate":" r","color":"red","font":"calamity:icons"}

# AddFakePlayersToTeam
team join fakeBlue Blue
team join fakeRed Red

team remove spectators
team add spectators {"text":"Spectators"}
# If you're on this team, you are always in the spectator game mode.
	team modify spectators collisionRule pushOtherTeams
	team modify spectators deathMessageVisibility never
	team modify spectators seeFriendlyInvisibles false
	team modify spectators color gray