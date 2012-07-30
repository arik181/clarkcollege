"Evacuation" by "Devin Quirozoliver"

Include Basic Screen Effects by Emily Short.


Chapter - "Setup"


Section - "Tracking Time and Score"

Use no scoring.
The time of day is 10:00 AM. 
The watch is a thing. The description of the watch is "You look at your watch. The time is now [time of day]".
The cell phone is a thing. The description of the phone is "You look at your phone. The time is now [time of day]".

Playerscore is a number that varies.



Section - "The Player"

A borrowable is a kind of thing. A borrowable can be returned or not returned.
The borrowed book is a borrowable. The description of the borrowed book is "You really should have returned this book last week, but things have just been so busy lately....".  

The player carries the borrowed book; The player carries the cell phone. The player carries the watch.
[Instead of examining the watch:
	now the time of day is 11:15 AM;
	say "Time seems to have sped up. The time is now [time of day]".]

Section - "The Professor"

The tweed jacket is a wearable thing.
The bowtie is a wearable thing.

In Hallway North is a map. It is fixed in place. The description of the map is "You see a map of the building. At the bottom of the map you see a [label]. In order to get out of the building, you'll have to go North toward the elevator and the stairwell. Then you'll need to head downstairs, and South toward the exit."

The label is a thing on the map. It is fixed in place. The description of the label is "The label at the bottom of the map says: Posted by the Emergency Building Coordinator."

The Professor is a person. He is in North West Office. He wears [a tweed jacket] and [a bowtie].


Section - "The Emergency Building Coordinator"

The ladder is a fixed in place thing in Hallway North.
The Emergency Building Coordinator is a person. She is in Hallway North. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Returning a Book is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".


Section - "The Elevator"

A stickable is a kind of thing. A stickable can be either stuck or unstuck. A stickable is usually unstuck.
The Lift is a stickable.


Chapter - "Layout"


Section - "Second Floor"

The Second Floor is a region.

Hallway South is a room. The description of Hallway South is  "You are at the South end of the hallway, on the second floor. There are offices to the East and West, and the hallway continues to the North."

North of Hallway South is Hallway North. The description of Hallway North is  "You are at the North end of the hallway, on the second floor. [If EBC Conversation is happening or Returning a Book is happening]The Emergency Building Coordinator is busily putting up an evacuation [map] on the wall.[otherwise]On the East wall you see a [map].[end if] There is an office to the West, and the hallway continues to the South. To the North, you see a set of old elevator doors. To the East you see stairs."

West of Hallway North is North West Office. The description of North West Office is "You are in an office at the North West end of the building. There is a [Professor] here who appears to be injured."

West of Hallway South is South West Office. The description of South West Office is "You are in an office at the South West end of the building. You see a desk with a [stack of papers] and a number of [old books] pertaining to your major. There is also a [bookshelf] with many more [heavy looking books] on it."
The stack of papers is fixed in place. It is in the South West Office. The description of the stack of papers is "You probably shouldn't be poking around through this stuff. Besides, it doesn't look like your grade is here."
The desk is a supporter in the south west office.
The bookshelf is a supporter in the south west office.
The old books are on the desk.
The heavy looking books are on the desk.
The heavy looking books are on the desk.

North of Hallway North is The Second Floor Elevator. The description of The Second Floor Elevator is "[if The Second Floor Elevator is unvisited]You don't know this yet, but you're about to have a very bad week.[paragraph break]Right now you need to return a book to your professor's office, but you seem to have gotten yourself lost. You remember that his office is somewhere on the second floor. You need to get there before he leaves. The elevator has just arrived on the second floor. [end if]You are in the elevator on the second floor, and a hallway is before you to the South.".
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
	say "[paragraph break]You may find additional commands that work, but these will be the only commands necessary to successfully complete the game.";
	say "[bold type]";
	pause the game.

The player is in The Second Floor Elevator.


Section - "Returning a Book"

Returning a Book is a scene.
Returning a Book begins when play begins.
Returning a Book ends when borrowed book is on the desk in South West Office.

Instead of asking the Emergency Building Coordinator about "professor", say "I don't know, I think his office is around here somewhere."


Section - "EBC Conversation"

EBC Conversation is a scene.
EBC Conversation begins when Returning a Book has ended.
EBC Conversation ends when the Emergency Building Coordinator is off-stage.


Section - "Not a drill"

A ringable is a kind of thing. A ringable can be ringing or not ringing.
The alarm is a ringable.

Not a drill is a scene.
Not a drill begins when EBC Conversation has ended.
When Not a drill begins:
	now the alarm is ringing;
	say "Well, there goes the alarm. I guess you'd better get downstairs."


Section - "Helping the professor"

Helping the professor is a scene.
Helping the professor begins when Not a drill has ended.


Section - "The Elevator Trap"

The elevator trap is a scene.
The elevator trap begins when the player is in the Second Floor Elevator and the Alarm is ringing.
The elevator trap ends when the player is not in the Second Floor Elevator.

When the Elevator Trap begins:
	now the Lift is stuck;
	say "You jab the button for the first floor repeatedly. The elevator doors close and you feel yourself grow just a tiny bit lighter as the elevator begins to descend.[paragraph break]THUNK.[paragraph break]You stumble as the lights flicker and the elevator comes to a sudden and irrevokable stop."
	
Instead of exiting when the player is in The Second Floor Elevator and the Lift is stuck:
	say "[one of]You can't do that.[or]You're trapped![or]The doors are closed! You can't get out![at random]";
	now the player is in Hallway North


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
