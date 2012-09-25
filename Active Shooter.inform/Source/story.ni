"Active Shooter" by Devin Quirozoliver

Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Flexible Windows by Jon Ingold.
Include Plurality by Emily Short.


Chapter - "Setup"

Section - "General Mechanics"

An event is a kind of thing. An event can be attempted or unattempted. An event is usually unattempted.

The player-objective is indexed text that varies.
The player-objective is "to drop off your paperwork."

Helping is an action applying to nothing.
Understand "h" or "help" as helping.
Report helping:
	say "To get a list of common commands, type [bold type]commands[roman type].[line break]To see what you should probably be doing right now, type [bold type]objective[roman type].[roman type][line break]Remember to look for commands in [bold type]bold[roman type] to find clues to your next action.[line break]Many commands have shorter versions. For instance, to go [bold type]south[roman type], you can just type [bold type]s[roman type].";
	
Commanding is an action applying to nothing.
Understand "c", "command" or "commands" as commanding.
Report commanding:
	say "[bold type]Commands:[roman type][paragraph break]Movement: [line break][bold type]north, south, east, west, up, down [roman type][line break]([bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration: [line break][bold type]look, examine, open, close[line break][roman type]([bold type]l, x[roman type])"; 
	say "[paragraph break]Inventory: [line break][bold type]take, give, drop, inventory[line break][roman type]([bold type]t, p, d, i[roman type])"; 
	say "[paragraph break]Speech: [line break][bold type]ask, tell, say[roman type]"; 
	say "[paragraph break]Assistance: [line break]Type [bold type]help[roman type], [bold type]commands[roman type], or [bold type]objective[roman type] at any time to get help.";
	
Objectiving is an action applying to nothing.
Understand the command "objectives" as something new.
Understand "objectives" as objectiving.
Understand "objective" or "obj" as objectiving.

Report objectiving:
	say "    [bold type]Your current objective is:[roman type][line break]    [player-objective]";
	say "[line break]";
	
Currentrooming is an action applying to nothing.
Report currentrooming:
	say "[line break]";
	say "    [bold type]You are currently in:[roman type][line break]    [location]."; 

Mapping is an action applying to nothing.
Understand "m" or "map" as mapping.
Report mapping:
	clear the map-window;
	try rendering;

Nomap is a truth state that varies.
Before the player mapping:
	If nomap is true:
		say "That's not a verb I recognise.";
		stop the action.	
	
Section - "Map Rendering"

[Grid is enumerated from 1]
Table of Third Floor Rooms
RName			X	Y
F3 Third Floor Stairwell			2	3
F3 Hallway North			2	1
F3 Hallway South			2	2

Table of Second Floor Rooms
RName		X	Y
F2 stairwell toward One		2	1
F2 Utility Closet		1	2
F2 Hallway		2	2	
F2 Open Lobby		3	2
F2 Classroom One		1	3
F2 stairwell toward Three		2	3
F2 Classroom Two 		3	3

Table of First Floor Rooms
RName			X	Y
F1 Dean's Office			1	1
F1 stairwell toward Two			2	1
F1 Coordinator's Office			1	2
F1 Hallway			2	2
F1 Entrance			2	3

[This table describes a separate grid 
 which overlays the room grid, to dislpay
 connected rooms on the map.]
  [Type 1 : Vertical]
  [Type 2 : Horizontal]
Table of First Floor Connecting Passages
Orientation			X	Y
"v"			2	1
"v"			2	2
"v"			1	1
"h"			1	2
"h"			1	1

Table of Second Floor Connecting Passages
Orientation			X	Y
"v"			2	1
"v"			2	2
"v"			1	2
"v"			3	2
"h"			1	3
"h"			1	2
"h"			2	3
"h"			2	2

Table of Third Floor Connecting Passages
Orientation			X	Y
"v"			2	1
"v"			2	2

The curtable is a table-name that varies;
The curconnection is a table-name that varies;

Rendering is an action applying to nothing.
Report rendering:
	If the player is in the Second Floor:
		Now the curtable is the Table of Second Floor Rooms;
		Now the curconnection is the Table of Second Floor Connecting Passages;
	If the player is in the First Floor:
		Now the curtable is the Table of First Floor Rooms;
		Now the curconnection is the Table of First Floor Connecting Passages;
	If the player is in the Third Floor:
		Now the curtable is the Table of Third Floor Rooms;
		Now the curconnection is the Table of Third Floor Connecting Passages;
	repeat with N running from 1 to the number of rows in the curtable:
		If the player is in rname in row N of the curtable:
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 2) column (X in row N of the curtable * 6);
			say "***";
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 3) column (X in row N of the curtable * 6);
			say "*@*";
			position the cursor in map-window at row ((Y in row N of the curtable * 4) + 4) column (X in row N of the curtable * 6);
			say "***";
		Otherwise:
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 2) column (X in row N of the curtable * 6);
			say "***";
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 3) column (X in row N of the curtable * 6);
			say "* *";
			position the cursor in map-window at row ((Y in row N of the curtable * 4) + 4) column (X in row N of the curtable * 6);
			say "***";
		If james shooter is in rname in row N of the curtable:
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 2) column (X in row N of the curtable * 6);
			say "***";
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 3) column (X in row N of the curtable * 6);
			say "*s*";
			position the cursor in map-window at row ((Y in row N of the curtable * 4) + 4) column (X in row N of the curtable * 6);
			say "***";	
	repeat with M running from 1 to the number of rows in the curconnection:
		Choose row M in the curconnection;
		If the orientation entry is "v": 
			position the cursor in map-window at row ((Y entry * 4) + 5) column ((X entry * 6) + 1);
			say "|";
		If the orientation entry is "h": 
			position the cursor in map-window at row ((Y entry * 4) + 3) column ((X entry * 6) + 3);
			say "---";
	position the cursor in map-window at row 2 column 2;
	say "    MAP KEY - [line break]     @ = You. [line break][if Panic on the first floor has happened]    	s = Shooter. [end if][paragraph break]";


Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to. 
Understand "talk" as talking to.
Understand "say hello to [someone]" as talking to.

Telling to is an action applying to two things.
Understand "say [something] to [someone]" as telling to.
Understand "tell [someone] [something]" as telling to.
Understand "ask [someone] [something]" as telling to.

Every turn:
	follow the window-drawing rules for the map-window;
	try currentrooming;
	try objectiving;

Section - "Command and Map Windows"

The command-window is a text-buffer g-window spawned by the main-window.
The map-window is a text-grid g-window spawned by the command-window.

The position of the command-window is g-placeright.
The position of the map-window is g-placebelow.

The scale method of the command-window is g-proportional. The measurement of the command-window is 35.
The scale method of the map-window is g-proportional. The measurement of the map-window is 50.

Window-drawing rule for the command-window:
	if command-window is g-unpresent, rule fails;
	clear the command-window;
	move focus to command-window;
	try commanding;
	return to main screen;
		
Window-drawing rule for the map-window:
	if map-window is g-unpresent, rule fails;
	clear the map-window;
	move focus to map-window;
	now nomap is false;
	try mapping;
	now nomap is true;
	return to main screen;

	
Section - "Tracking Time and Score"

The maximum score is 150.

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


Chapter - "Characters"

Section - "The Player"

The paperwork is a thing that is plural-named.
The player carries the paperwork.The player carries the cell phone. The player carries the watch.


Section - "The Dean"

Dean Martin is a person. He is in the F1 Coordinator's office. The description of Dean Martin is "Professor Martin is the Dean of your school. He's quite nice when you get to know him."
Understand "The Dean", "Martin", "Professor Martin" and "Dean" as Dean Martin.

Instead of asking Dean Martin about something:
	say "'Oh, yes. Good to see you again. That's probably a better question for the Progarm Coordinator,' says the Dean.";
	
Instead of telling Dean Martin about something:
	say "'Oh, hello. I'll let you talk to the Program Coordinator, then.";

Instead of telling to Dean Martin:
	say "'Oh, yes. I'll let you talk to the Program Coordinator, then.";

Instead of talking to Dean Martin:
	say "'Oh, yes. I'll let you talk to the Program Coordinator, then.";


Section - "The Program Coordinator"

Program Coordinator May is a female person. She is in the F1 Coordinator's office. The description of Program Coordinator May is "Ms. May is the Program Coordinator. She's helped you out a lot with your school career."
Understand "May", "Program Coordinator May", "Secretary", "PC", "ms may" or "Program Coordinator" as Program Coordinator May.

Instead of talking to Program Coordinator May:
	say "[if Dropping off paperwork is happening][one of]'Hm? What can I help you with?'[or]'Can I take those papers from you?'[or]'Do you have some paperwork for me?'[at random][end if][if Panic on the first floor is happening][one of]'Don't talk, run!'[or]'We have to get out of here!'[or]'Hurry! Into the Dean's office!'[at random][end if] says Ms. May.";
	
Instead of asking Program Coordinator May about something:
	say "[if Dropping off paperwork is happening][one of]'Hm? What can I help you with?'[or]'Can I take those papers from you?'[or]'Do you have some paperwork for me?'[at random][end if][if Panic on the first floor is happening][one of]'Don't talk, run!'[or]'We have to get out of here!'[or]'Hurry! Into the Dean's office!'[at random][end if] says Ms. May.";


Section - "The Shooter"

James Shooter is a person. The description of James Shooter is "What is wrong with this guy?"
Understand "Shooter", "The shooter", "active shooter", "ac", "Jim" and "James" as James Shooter.

After asking James Shooter about something:
	say "He doesn't respond. In fact he completely refuses to acknowledge you. It's almost like he's looking through you at someone else.";
	

Section - "The Emergency Building Coordinator"

The Emergency Building Coordinator is a person. She is in F1 Hallway. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.
Understand "Coordinator" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Dropping Off Paperwork is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".


Chapter - "Layout"

Section - "First Floor"

The First Floor is a region.

Firstshot is an event that is unattempted.

F1 Entrance is a room in the first floor. The description of F1 Entrance is "You are standing in the building entrance. [If prologue is happening]It's time to go find the Program Coordinator.[end if][if F1 Entrance is unvisited] Remember to type [bold type]objectives[roman type] if you're not sure what to do next, or [bold type]commands[roman type] for a list of possible commands. Good luck![end if]There is a Hallway to the North."

North of F1 Entrance is F1 Hallway. It is in the first floor. The description of F1 Hallway is "You are standing in the hallway outside the office of the Program Coordinator. The office of the Program Coordinator is to the [bold type]West[roman type]. To the [bold type]North[roman type], you can see a stairwell leading to the second floor."

West of F1 stairwell toward two is F1 Dean's Office. It is in the first floor. The description of Dean's Office is "[if Panic on the first floor is happening and Dean's Office is unvisited]What is going on? [end if]You're in the Dean's office. You see a desk with a stack of [papers] and a number of [old books] pertaining to your major. The Program Coordinator's office is to the [bold type]South[roman type], and to the [bold type]West[roman type] you can see a door leading toward the stairwell which leads to the second floor of the building."
There are some papers  on the Dean's desk. They are fixed in place. They are scenery. The description of the papers is "You probably shouldn't be poking around through this stuff. Besides, it doesn't look like your grade is here."
The Dean's Desk is a fixed in place supporter in the Dean's Office.
There are some old books on the Dean's desk. They are fixed in place scenery. The description of the old books is "These books are pretty cool. If you had time, you would probably look at them more closely."
There are some heavy books on the Dean's desk. They are fixed in place scenery. The description of the heavy books is "These books look pretty interesting. Maybe later when you have time you'll come back and check them out.[if firstshot is attempted] If there is a later at all.[end if]"

North of F1 Hallway is F1 stairwell toward Two. It is in the first floor. The description of F1 stairwell toward Two is "This is the stairwell leading up to the second floor.[if F1 stairwell is unvisited] Use the [bold type]up[roman type] and [bold type]down[roman type] commands to move between floors.[end if] To the [bold type]West[roman type] you can see the Dean's office, and to the [bold type]South[roman type] is the hallway leading to the building entrance."

West of F1 Hallway is F1 Coordinator's office. It is in the first floor. The description of the F1 Coordinator's office is "You enter the Coordinator's office of the Dean's office. To the [bold type]North[roman type] is the Dean's office, and to the [bold type]East[roman type] is the hallway leading toward the building entrance."
The Coordinator's Desk is a fixed in place supporter in the Coordinator's office.
There are some new books on the Coordinator's desk. They are fixed in place scenery.


Section - "Second Floor"

The Second Floor is a region.


Above F1 stairwell toward Two is F2 stairwell toward One. It is in the second floor. The description of F2 stairwell toward One is "This is the stairwell leading down to the first floor."


South of F2 stairwell toward one is F2 Hallway. F2 Hallway is in the second floor. The description of F2 Hallway is "You're standing in the middle of the second floor hallway. [If Panic on the first floor has happened]You feel very exposed. [end if]The stairwell down to the first floor is back toward the [bold type]North[roman type]. Further to the [bold type]South[roman type] you can see the stairwell that goes up to the third floor. To the [bold type]East[roman type] you see an open lobby with glass walls and large windows. [If panic on the first floor has happened]It doesn't look like there's much protective cover in there. [end if]To the [bold type]West[roman type] you see a utility closet."


South of F2 Hallway is F2 stairwell toward Three. F2 stairwell toward Three is in the second floor.The description of F2 stairwell toward Three is "This is the stairwell leading up to the third floor."


East of F2 Hallway is F2 Open lobby. F2 Open lobby is in the second floor. The description of F2 Open lobby is "A spacious room with glass walls and no protective cover."

ClosetEntering is an action applying to nothing.
Understand "enter closet", "get in closet", "hide in closet", "climb in closet",  "go in closet" or "get into closet" as ClosetEntering.
Instead of ClosetEntering when player is not in F2 Hallway:
	say "There is no closet here."
	
Instead of ClosetEntering when the player is in F2 Hallway:
	If the closet door is locked:
		say "The closet door is locked.";
		stop the action;
	try going west;
	say "You climb into the utility closet.";

ClosetExiting is an action applying to nothing. 
Understand "exit closet", "leave closet", "get out of closet", "climb out of closet" or "go out of closet" as ClosetExiting.
Instead of ClosetExiting when player is not in F2 Utility Closet:
	say "I don't understand that verb."

Instead of ClosetExiting when player is in F2 Utility Closet:
	If the closet door is locked:
		say "The closet door is locked.";
		stop the action;
	try going east;
	say "You climb out of the utility closet.";
		
Understand "lock [something]" as locking keylessly. Locking keylessly is an action applying to one thing.
Check locking keylessly: 
	if the noun is not a door, say "[The noun] is not something you can lock." instead; 
	if the noun is locked, say "[The noun] is already locked." instead; 
	if the player is in F2 Hallway, say "You can't lock the door from this side." instead.
	
Carry out locking keylessly: 
	now the noun is locked.
	
Report locking keylessly:
	say "You lock the [noun]."

Understand "unlock [something]" as unlocking keylessly. Unlocking keylessly is an action applying to one thing.
Check unlocking keylessly: 
	if the noun is not a door, say "[The noun] is not something you can unlock." instead; 
	if the noun is unlocked, say "[The noun] is already unlocked." instead; 
	if the player is in F2 Hallway, say "You can't unlock the door from this side." instead.
	
Carry out unlocking keylessly: 
	now the noun is unlocked.
	
Report unlocking keylessly:
	say "You unlock the [noun]."

Instead of going east when player is in F2 Utility closet and closet door is locked:
	say "You'll need to unlock the door first.";
	stop the action;
	
F2 Utility closet is a room. F2 Utility closet is in the second floor. The description of F2 Utility closet is "A utility closet."

South of F2 Utility closet and west of F2 stairwell toward Three is F2 Classroom One. F2 Classroom One is in the second floor. The description of F2 Classroom One is "An ordinary looking classroom."


South of F2 Open Lobby and east of F2 stairwell toward Three is F2 Classroom Two. F2 Classroom Two is in the second floor. The description of F2 Classroom Two is "An ordinary looking classroom."


Section - "Third Floor"

The Third Floor is a region.


Above F2 stairwell toward Three is F3 Third Floor Stairwell. It is a room in The Third Floor. The description of F3 Third Floor Stairwell is "This is the stairwell leading down to the third floor."


North of F3 Hallway South is F3 Hallway North. F3 Hallway North is in the Third Floor. The description of F3 Hallway North is "The hallway seems to stretch for miles."


North of F3 Third Floor Stairwell is F3 Hallway South. F3 Hallway South is in the Third Floor. The description of F3 Hallway South is "The hallway seems to stretch for miles."


Chapter - "Time"


Section - "Start"

When play begins: 
	open up the command-window;
	open up the map-window;
	increase the score by 50;

The player is in F1 Entrance.


Section - "Prologue"

Prologue is a scene.
Prologue begins when play begins.
Prologue Ends when the player is in F1 Hallway.

Ending is an event that is unattempted.
Wrongway is an event that is unattempted.

When Prologue begins:
	say "[bold type]";
	pause the game; 
	say "[roman type]";
	say "[paragraph break]The following scenario is intended to provide you with the tools that you will need to respond as safely as possible in the event of an emergency situation."; 
	say "[bold type]";
	pause the game; 
	say "[roman type]";
	say "[paragraph break]What you are about to experience isn't just a game. Any of the things that you read here could happen to you. If you're not prepared, an emergency situation could easily become a horrifying experience.[paragraph break]You are about to have... [paragraph break] ";
	say "[bold type]... a very bad week."; 
	pause the game; 
	say "[roman type]";
	say "[paragraph break]You're in the entrance of the administration building. It's almost time for class. There is a workman here fiddling with the lock on the front door of the building. You say good morning to him, but he very rudely chooses to ignore you. Before you head for the classroom, you need to drop off some paperwork with the Program Coordinator. This should only take a minute.[paragraph break]";
	say "[bold type]";
	pause the game; 
	say "[roman type]";


Section - "EBC Conversation"

EBC Conversation is a scene.
EBC Conversation begins when Prologue has ended.
EBC Conversation ends when the Emergency Building Coordinator is off-stage.
The description of EBC conversation is "".

The poster is a thing. The poster is in the F1 Hallway. The description of the poster is "The poster outlines a number of tips for how to be prepared in the event that someone enters a building with a gun, intending to harm other people. Among the points listed here are three important things that one can do in order of priority:[paragraph break][bold type]1. Try to get out of the building if possible.[line break]2. Try to hide from the shooter[line break]3. Try confront the shooter physically.[roman type][paragraph break]These are ordered by priority, with confrontation being a strategy of last resort, to be undertaken only when there are no other options available.";

When EBC Conversation begins:
	say "The Emergency Building Coordinator steps down from her ladder and sighs lightly. 'These signs are always crooked. Oh well.' You don't see anything wrong with the sign. The Coordinator turns to you and says 'Here. We just printed these [poster]s. Take a [bold type]look[roman type].' The coordinator scratches her head. 'Does this look crooked to you?' Without waiting for a reply,
	 the Emergency Building Coordinator picks up her ladder and walks away.";
	now Emergency Building Coordinator is off-stage.


Section - "Dropping Off Paperwork"

Conversation is an event which is unattempted.

Dropping off Paperwork is a scene.
Dropping off Paperwork begins when EBC Conversation ends.
Dropping off Paperwork ends when the paperwork is in the F1 Coordinator's office, or the paperwork is on the coordinator's desk or Program Coordinator May is carrying the paperwork.
The description of Dropping Off Paperwork is "".

After going to F1 Coordinator's office during Dropping off paperwork:
	try looking;
	If conversation is unattempted:
		say "'Ms. May, did you schedule that staff meeting for next Wednesday?', the Dean asks as he steps into the Coordinator's office. 'Yes, I did,' replies Ms. May, the Program Coordinator. 'We had to move it because of the holiday.'[paragraph break]'Oh, yes. Thank you for reminding me,' the Dean says.[paragraph break]'Hello there,' the program coordinator says, looking at you. 'Do you have some paperwork for me?'";
		now conversation is attempted;

When Dropping off Paperwork ends:
	Now Program Coordinator May has the paperwork;
	say "Ms. May picks up the paperwork and places it aside. 'Thank you,' she says, 'I'll take care of that'.";
	Now the Emergency Building Coordinator is off-stage;
	Now Program Coordinator May is off-stage;
	Now the player-objective is "run."

Check giving paperwork to Program Coordinator May:
	now Program Coordinator May has the paperwork.


Section - "Panic on the first floor"


Dean's door is a lockable door that is unlocked. It is north of F1 Coordinator's office and south of F1 Dean's Office.
Toldaboutlock is a truth state that varies. Toldaboutlock is false.

Panic on the first floor is a scene.
Panic on the first floor begins when Dropping Off Paperwork has ended.
Panic on the first floor ends when player is in second floor.
The description of Panic on the first floor is "A loud popping sound can be heard in the hallway to the East. 'Did you hear that?' says Ms. May. She gets up from her desk and moves toward the hallway. The Dean follows her out toward the hallway. 'Isn't that Professor Reynolds ex-husband?' the Dean asks.[paragraph break]The Dean and Ms. May walk out into the hallway. A few moments later several more pops can be heard. Ms. May runs right back past you and [bold type]North[roman type] into the Dean's office. 'Run!' she says, and then she is gone.".

When Panic on the first floor begins:
	now james shooter is in F1 Entrance;

Every turn during Panic on the first floor:
	If the Dean's door is locked and toldaboutlock is false:
		say "[bold type]Nice work[roman type]. Locking doors behind you is a good way to be safer in a bad situation like this one.";
		now toldaboutlock is true;
	
After going to the F1 Hallway during Panic on the first floor:
	say "You move in the direction of the shots. This is a very bad idea.";
	now wrongway is attempted;
	now ending is attempted.
	
After going to the F1 Dean's office during Panic on the first floor:
	try looking;
	say "You move into the Dean's office. Ms. May is nowhere to be seen. There is another door to the East, leading to the first floor stairwell.";
	now firstshot is attempted.
	
After going to the F1 stairwell toward two during Panic on the first floor:
	try looking;
	say "Down the hall, you can see the man who was working on the door at the front entrance. The door behind him appears to have been bolted shut. He is no longer wearing a hat, and he is holding a gun. He hasn't noticed you yet, but if you remain here for too long, he will.";
	

Section - "Hiding on the second floor"

Shooting is an event that is unattempted.
Classrooming is an event that is unattempted.
Closeting is an event that is unattempted.
Notlocking is an event that is unattempted.

Hiding on the second floor is a scene.
Hiding on the second floor begins when Panic on the first floor has ended.
Hiding on the second floor ends when the player is in the Third Floor.
The description of Hiding on the second floor is "It is obvious that there is an active shooter in the building. You hear more gunshots coming from the direction of the stairwell behind you. As frightening as a situation like this is, you know that you need to keep your wits about you. Standing here in the stairwell is probably not the best idea. You'd better keep moving.[paragraph break]"

Before going to F1 stairwell toward two during Hiding on the second floor:
	If shooting is unattempted:
		clear only the main screen;
		say "Going back down the stairs is probably a bad idea, but you decide to take the risk. As you walk down the stairs, the shooter appears at the base of the stairwell. He aims his gun in your direction and fires. After a moment, you begin to feel a sharp pain in your leg. [bold type]You've been shot!";
		now shooting is attempted;
		pause the game;
		say "[roman type]";
	Otherwise:
		now wrongway is attempted;
		now ending is attempted;
	
Every turn when shooting has been attempted:
	say "[one of]Your leg is killing you.[or]You have a shooting pain in your leg.[or]You think your leg may have just gone numb.[or]The pain in your leg is really getting to you.[or]You wonder how much blood a person can lose before they pass out...[at random]"

Before going to F1 Hallway during Hiding on the second floor:
	say "You move in the direction of the shots. [bold type]This is a very bad idea.[roman type][paragraph break]";
	now wrongway is attempted;
	now ending is attempted;
	 
Before going to F2 classroom one during Hiding on the second floor:
	now classrooming is attempted.

Before going to F2 classroom two during Hiding on the second floor:
	now classrooming is attempted.

Before going to F2 utility closet during Hiding on the second floor:
	say "You climb into the cramped utility closet and ease to a crouched position on the floor, trying not to upset any of the brooms which are leaned haphazardly against the wall.";
	now closeting is attempted. 

Closetturns is a number that varies. Closetturns is 1.
closet door is a door that is unlocked. It is west of F2 Hallway and east of F2 Utility closet.

Every turn when closeting is attempted:
	If closetturns is greater than 4:
		If closet door is unlocked:
			say "The doorknob slowly turns. 'I know that you're in there,' says a voice from the outside.";
			now notlocking is attempted;
			now ending is attempted;
		Else:
			say "The doorknob rattles. Once. Twice. You hear footsteps moving away.";
			now ending is attempted;
	
unsheltered is an event that is unattempted;

Before going to F2 open lobby during Hiding on the second floor:
	clear only the main screen;
	say "You look around desperately for cover, but you can see no place to hide, and no exit. It looks like you took a wrong turn. As you turn back toward the door you came in through, you see the shooter, looking at you from the hallway through the glass walls of the lobby. You don't remember him firing his gun, but suddenly there is a wall of glass exploding toward you as the bullets fly in your direction.";
	say "[bold type]";
	pause the game;
	say "[roman type]";
	now unsheltered is attempted;
	now ending is attempted.

	
Section - "Classroom shelter"

Classroom shelter is a scene.
Classroom shelter begins when Classrooming is attempted.


Section - "Attack on the third floor"

Confrontation is an event that is unattempted.

Attack on the third floor is a scene.
Attack on the third floor begins when Hiding on the second floor has ended.
Attack on the third floor ends when the confrontation is attempted.

Before going to F2 stairwell toward three during Attack on the third floor:
	say "Going back down the stairs is probably a bad idea, but you decide to take the risk. As you walk down the stairs, the shooter appears at the base of the stairwell. He aims his gun in your direction and fires. After a moment, you begin to feel a sharp pain in your leg. [bold type]You've been shot!";
	pause the game;
	say "[roman type]";
	If shooting has been attempted:
		now wrongway is attempted;
		now ending is attempted;
	else:
		now shooting is attempted.

Section - "Epilogue"

Epilogue begins when ending is attempted.
Epilogue is a scene.

When Epilogue begins:
	say "[bold type]Epilogue:[roman type][paragraph break]";
	say "[If wrongway is attempted]It looks like you took a very wrong turn. You wake up in the back of an ambulance. They tell you that you've lost a lot of blood, but there are others who fared worse. The police eventually caught the shooter, but many people were injured, and some were even killed. Any wrong turn can cost you a lot in a situation involving an active shooter.[paragraph break][end if]This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for scenarios like this.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";	
	If the Dean's door is locked:
		say "* You locked the Dean's door behind you. That's a good way to be safer in a situation like this. Nice work.[paragraph break]";
		increase the score by 20;
	Otherwise:
		say "* Consider locking more doors behind you. This will deter an active shooter from getting the jump on you.[paragraph break]";
	If notlocking is attempted:
		say "* When hiding, make sure that the doors between you and the active shooter are locked from the inside.[paragraph break]";
		decrease the score by 20;
	If wrongway is attempted:
		say "* Try to be aware of where the active shooter is in relation to you. Don't move toward the shooter unless you have to.[paragraph break]";
		decrease the score by 50;
	If unsheltered is attempted:
		say "* Be careful about entering open areas with little or no protective cover.[paragraph break]";
		decrease the score by 20;
[	if hiding is attempted:
		increase the score by 50;
	if doorlocking is attempted:
		increase the score by 20;
	if the confrontation is attempted:
		increase the score by 100;]
	end the game saying "Final Score : [score]. Can you do better?".
	

release along with the source text.
release along with an interpreter.
release along with a website.
