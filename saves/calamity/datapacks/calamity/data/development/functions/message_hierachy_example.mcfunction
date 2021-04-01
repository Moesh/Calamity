# Called from: nowhere

#---------------------------------------------------------------------------------------------------
# Purpose: Sets the world back to development mode.
#---------------------------------------------------------------------------------------------------

# Any message
tellraw @a {"text":"\n\nMoesh's Style Guide","bold": true}
tellraw @a {"translate":"system.message","color": "green","with":[{"text":"Messages sent by the system look like this"}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"text":"When a single sentence, no punctuation is used"}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"translate":"Error messages look like this. Notice the system indicator, %s, is still green.","color": "red","with":[{"text":">>>","color": "green"}]}]}
tellraw @a {"translate":"system.message","color": "blue","with":[{"translate":"Blue team specific messages look like this."}]}
tellraw @a {"translate":"system.message","color": "gray","with":[{"translate":"Lobby or spectator team specific message"}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"translate":"When a blue player changes the game state","color": "blue"}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"translate":"When a red player changes the game state","color": "red"}]}
tellraw @a {"translate":"system.message","color": "gray","with":[{"translate":"When a large amount of text needs to be sent, we'll treat it like a subheader. We should almost never send as much text as is in this message. Most all text should strive to fit on one line.","italic": true}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"text":"Messages sent by the system look like this"}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"translate":"Numbers, like %s, should always appear in white","with":[{"text":"3","color":"white"}]}]}
tellraw @a {"translate":"system.message","color": "gray","with":[{"translate":"Important words, teams, and actions, like Start match %s, should have an related emoji character. If none exist, create one. Emojis should always be the same color as the word they are accentuating, unless the emoji is in full color.","italic": true,"with":[{"text":"▶"}]}]}
tellraw @a {"translate":"system.message","color": "green","with":[{"translate":"All %s should be blue and underlined when sent in chat box. If in book, use any color","with":[{"text":"links","color":"blue","underlined": true}]}]}