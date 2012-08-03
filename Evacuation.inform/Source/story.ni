"Evacuation" by "Devin Quirozoliver"

Include Basic Screen Effects by Emily Short.


Chapter - "Setup"

Section - "General Mechanics"

Helping is an action applying to nothing.
Understand "h" or "help" as helping.
Report helping:
	say "To get a list of common commands, type [bold type]commands[roman type].[line break]To see what you should probably be doing right now, type [bold type]objective[roman type].[roman type][line break]Remember to look for commands in [bold type]bold[roman type] to find clues to your next action.[line break]Many commands have shorter versions. For instance, to go [bold type]south[roman type], you can just type [bold type]s[roman type]."
	
Commanding is an action applying to nothing.
Understand "c" or "commands" as commanding.
Report commanding:
	say "[paragraph break]You may use any of the following commands during this scenario:[paragraph break]Movement commands: [line break][bold type]north, south, east, west, up, down [roman type](or [bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration commands: [line break][bold type]look, examine[roman type](or [bold type]l, x[roman type])"; 
	say "[paragraph break]Inventory commands: [line break][bold type]take, inventory[roman type](or [bold type]t, i[roman type])"; 
	say "[paragraph break]Speech commands: [line break][bold type]ask, tell, say[roman type]"; 
	say "[paragraph break]Finally, remember to use [bold type]help[roman type], [bold type]command[roman type], and [bold type]objective[roman type] at any time to get help.";
	say "[line break]You may find additional commands that work, but these will be the only commands necessary to successfully complete the game.";
	
Objectiving is an action applying to nothing.
Understand "obj", "objective" or "objectives" as objectiving.
Report objectiving:
	say "Your current objective is ..." [need to insert a table of objectives here to match the current scene]
	
Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to. 
Understand "talk" as talking to.
Understand "say hello to [someone]" as talking to.



Section - "Tracking Time and Score"

The time of day is 10:00 AM. 
The watch is a thing. The description of the watch is "You look at your watch. The time is now [time of day]".
The cell phone is a thing. The description of the phone is "You look at your phone. The time is now [time of day]".
Understand "mobile", "cell" and "phone" as  the cell phone.
Dialing is an action applying to a number.
Check dialing:
	say "Figures. There's no cell phone reception in this building."
Instead of dialing: say "Figures. There's no cell phone reception in this building."
Understand "call [number]" as dialing.
Understand "dial [number]" as dialing.


Section - "The Player"

A borrowable is a kind of thing. A borrowable can be returned or not returned.
The borrowed book is a borrowable. The description of the borrowed book is "You really should have returned this book last week, but things have just been so busy lately....".  

The player carries the borrowed book; The player carries the cell phone. The player carries the watch.

Section - "The Professor"

The tweed jacket is a wearable thing.
The bowtie is a wearable thing.

The Professor is a person. He is in South West Office. He wears [a tweed jacket] and [a bowtie].
Understand "prof" as the Professor.

In Hallway North is a map. It is fixed in place. The description of the map is "You see a map of the building. At the bottom of the map you see a [label]. In order to get out of the building, you'll have to go North toward the elevator and the stairwell. Then you'll need to head downstairs, and [bold type]South[roman type] toward the exit."

The label is a thing on the map. It is fixed in place. The description of the label is "The label at the bottom of the map says: Posted by the Emergency Building Coordinator."


Section - "The Emergency Building Coordinator"

The Emergency Building Coordinator is a person. She is in Hallway North. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.
Understand "Coordinator" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Returning a Book is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".


Section - "The Elevator"

A stickable is a kind of thing. A stickable can be either stuck or unstuck. A stickable is usually unstuck.
The Lift is a stickable.

Section - "The Water Heater"

An explodable is a kind of thing. An explodable can be either detonated or undetonated. An explodable is usually undetonated.
The Water Heater is an explodable.


Chapter - "Layout"


Section - "Second Floor"

The Second Floor is a region.

Hallway South is a room. The description of Hallway South is  "You are at the South end of the hallway, on the second floor. There is an office to the [bold type]West[roman type], and the hallway continues to the [bold type]North[roman type]."

North of Hallway South is Hallway North. The description of Hallway North is  "You are at the North end of the hallway, on the second floor. [If EBC Conversation is happening or Returning a Book is happening]The Emergency Building Coordinator is busily putting up an evacuation [map] on the wall.[otherwise]On the East wall you see a [map].[end if] There is an office to the [bold type]West[roman type], and the hallway continues to the [bold type]South[roman type]. To the [bold type]North[roman type], you see a set of old elevator doors. To the [bold type]East[roman type] you see stairs."

South West Office is a room. The description of South West Office is "[if South West Office is unvisited]You knock on the door to your professor's office. 'Come in,' he says. [line break]'I'm dropping off your book,' you say, casually.[line break]'Oh, that's fine. You can just [bold type]put[roman type] it anywhere'.[paragraph break][end if]You see a desk with a [stack of papers] and a number of [old books] pertaining to your major. There is also a [bookshelf] with many more [heavy looking books] on it."
The stack of papers is fixed in place. It is in the South West Office. The description of the stack of papers is "You probably shouldn't be poking around through this stuff. Besides, it doesn't look like your grade is here."
The desk is a supporter in the south west office.
The bookshelf is a supporter in the south west office.
The old books are on the desk.
The heavy looking books are on the desk.
The heavy looking books are on the desk.

South West Door is an open door. It is east of South West Office and west of Hallway South.

The Second Floor Elevator is a room. The description of The Second Floor Elevator is "[if The Second Floor Elevator is unvisited]You don't know this yet, but you're about to have a very bad week.[paragraph break]Right now you need to return a book to your professor's office, but you seem to have gotten yourself lost. You seem to remember that his office is somewhere on the second floor. You need to get there before he leaves. The elevator has just arrived on the second floor. [otherwise]You are in the elevator on the second floor. The hallway is to the [bold type]south[roman type][end if]".
The elevator door is an open door. It is south of the Second Floor Elevator and north of Hallway North.
Understand "leave the elevator" or "exit the elevator" or "get out" or "get out of the elevator"  or "step out" or "step out of the elevator" as exiting.
Instead of exiting when the player is in The Second Floor Elevator:
	say "You step out of the elevator and into the hall.";
	now the player is in Hallway North
	
	
East of Hallway North is The Stairwell. The description of The Stairwell is "You see stairs leading to the first and third floors of the building."

Hallway South, Hallway North, North West Office, South West Office, The Second Floor Elevator and The Stairwell are in the second floor.


Section - "First Floor"

The First Floor is a region.

The First Floor Elevator is a room.

East of the First Floor Hallway North is The First Floor Stairwell. It is below the Stairwell.

South of The First Floor Elevator is First Floor Hallway North.
South of First Floor Hallway North is First Floor Hallway South.

The First Floor Elevator, The First Floor Stairwell, The First Floor Hallway North, and the First Floor Hallway South are in The First Floor.


Section - "Third Floor"

The Third Floor is a region.

Above the Stairwell is The Third Floor Stairwell.

The Third Floor Stairwell is in the Third Floor.


Chapter - "Time"


Section - "Start"

When play begins: 
	say "The following scenario is intended to provide you with the tools that you will need to respond as safely as possible in the event of an emergency situation."; 
	say "[bold type]";
	pause the game; 
	say "[roman type]";
	say "[paragraph break][paragraph break]You want me to tell you that this is just a game, but I won't. The truth is that any of the things that you read here could happen to you. If you're not properly prepared for disaster, an emergency situation could easily become a horrifying experience.[paragraph break] Welcome. You are about to have... [paragraph break] ";
	say "[bold type]... a very bad week."; 
	pause the game; 
	say "[roman type]";
	say "[paragraph break][paragraph break]You may use any of the following commands during this scenario:[paragraph break]Movement commands: [line break][bold type]north, south, east, west, up, down [roman type](or [bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration commands: [line break][bold type]look, examine[roman type](or [bold type]l, x[roman type])"; 
	say "[paragraph break]Inventory commands: [line break][bold type]take, inventory[roman type](or [bold type]t, i[roman type])"; 
	say "[paragraph break]Speech commands: [line break][bold type]ask, tell, say[roman type]"; 
	say "[paragraph break]Finally, remember to use [bold type]help[roman type], and [bold type]command[roman type] at any time to get help.";
	say "[line break]You may find additional commands that work, but these will be the only commands necessary to successfully complete the game.";
	say "[bold type]";
	pause the game.

The player is in The Second Floor Elevator.

Section - "Returning a Book"

Returning a Book is a scene.
Returning a Book begins when play begins.
Returning a Book ends when borrowed book is in South West Office, or borrowed book is on the desk in South West Office, or borrowed book is on the bookshelf in South West Office, or Professor is carrying borrowed book.

Instead of asking the Emergency Building Coordinator about "professor", say "I don't know, I think his office is around here somewhere."
Instead of giving the book to the professor, say "The professor says 'Just [bold type]put[roman type] it on the desk there, will you?'"
After asking the professor about anything, say "[one of]The professor says 'I don't know, I've been in here all day. Working.'[or]The professor says 'I'm pretty busy right now. If you have questions about the course, come see me during office hours.'[at random]"

Check talking to when noun is the Professor during Returning a Book:
	say "'Hello,' you say to the Professor.[line break]'I'm pretty busy right now,' The professor says. 'If you have questions about the course, come see me during office hours.'".

Check talking to when noun is Emergency Building Coordinator during Returning a Book:
	say "'Hello,' you say to the Emergency Building Coordinator.[line break][if Returning a Book is happening][one of]'What's that? Oh, hello.'[or]'Sorry? Oh, hello.'[or]'Pretty busy here.'[or]'Hm? Oh, hello.'[at random][end if]'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.".

Section - "EBC Conversation"

EBC Conversation is a scene.
EBC Conversation begins when Returning a Book has ended.
EBC Conversation ends when the Emergency Building Coordinator is off-stage.

Every turn during EBC Conversation:
	If player is in Hallway North:
		say "The Emergency Building Coordinator steps down from her ladder and sighs lightly. 'Still a bit crooked. Oh well.' The Coordinator turns to you and says 'Don't forget that there's going to be an evacuation drill in a few minutes.";
		now Emergency Building Coordinator is off-stage.
	
Check talking to when noun is the Professor during EBC Conversation:
	say "The Professor seems to be ignoring you".

Check talking to when noun is Emergency Building Coordinator during EBC Conversation:
	say "'Hello,' you say to the Emergency Building Coordinator.[if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".


Section - "Not a drill"

A ringable is a kind of thing. A ringable can be ringing or not ringing.
The alarm is a ringable.

Not a drill is a scene.
Not a drill begins when EBC Conversation has ended.
When Not a drill begins:
	now the alarm is ringing;
	say "Well, there goes the alarm. I guess you'd better get downstairs."
	
Before going to the Second Floor Elevator during Not a drill:
	If the water heater is undetonated:
		clear only the main screen;
		say "[bold type]What the... Did you feel that? There was a kind of a 'WHUMP', and then the lights flickered. It felt like the whole building shook just then...[roman type][paragraph break]";
		now the water heater is detonated;
		pause the game.

Every turn during Not a drill:
	If alarm is ringing:
		say "The alarm is going off."

Section - "Helping the professor"
 
Helping the professor is a scene.
Helping the professor begins when Not a drill begins.

An event is a kind of thing. An event can be attempted or unattempted.
The rescue is an event.

Every turn during Not a drill:
	If the rescue is unattempted, and the player is in the second floor:
		say "You can hear a low moan coming from the direction of your professor's office."

Section - "The Elevator Trap"

The elevator trap is a scene.
The elevator trap begins when the player is in the Second Floor Elevator and the Alarm is ringing.
The elevator trap ends when the player is not in the Second Floor Elevator.

When the Elevator Trap begins:
	say "You jab the button for the first floor repeatedly. The elevator doors close and you feel yourself grow just a tiny bit lighter as the elevator begins to descend.[paragraph break]THUNK.[paragraph break]You stumble as the lights flicker and the elevator comes to a sudden and irrevokable stop.";
	now the elevator door is closed;
	now the Lift is stuck;

Every turn during The Elevator Trap:
	If the lift is stuck:
		say "You may have to pry open the doors somehow."

Instead of exiting when the player is in The Second Floor Elevator and the Lift is stuck:
	say "[one of]You can't do that.[or]You're trapped![or]The doors are closed! You can't get out![at random]";
	now the player is in Hallway North.

Before going to Hallway North during Elevator Trap:
	say "You have to pry the doors open with your hands. The elevator has stopped between floors. Through the gap at the bottom you can see people yelling and scurrying around on the first floor. Something strange is definitely going on.[paragraph break]You have to climb up to get back to the second floor. Maybe you shouldn't have taken the elevator."

Section - "Chaos on the first floor"

Chaos on the first floor is a scene.
Chaos on the first floor begins when the player is in the First Floor Stairwell and the Alarm is ringing.
Chaos on the first floor ends when the player is in the First Floor Hallway South and the Alarm is ringing.

Section - "Epilogue"

Epilogue is a scene.
Epilogue begins when Chaos on the first floor ends.

release along with the source text.
release along with an interpreter.
release along with a website.
