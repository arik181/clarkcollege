"Active Shooter" by Devin Quirozoliver

Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Flexible Windows by Jon Ingold.
Include Plurality by Emily Short.


Chapter - "Setup"

Section - "General Mechanics"

An event is a kind of thing. An event can be attempted or unattempted. An event is usually unattempted.
A challenge is a kind of thing. A challenge can be successful or unsuccessful. A challenge is usually unsuccessful.

The player-objective is indexed text that varies.
The player-objective is "to drop off your paperwork."

Helping is an action applying to nothing.
Understand "h" or "help" as helping.
Report helping:
	say "To get a list of common commands, type [bold type]commands[roman type].[line break]To see what you should probably be doing right now, type [bold type]objective[roman type].[roman type][line break]Remember to look for commands in [bold type]bold[roman type] to find clues to your next action.[line break]Many commands have shorter versions. For instance, to go [bold type]south[roman type], you can just type [bold type]s[roman type].";
	
Commanding is an action applying to nothing.
Understand "c", "command" or "commands" as commanding.
Report commanding:
	say "[bold type]Commands:[roman type][paragraph break]Movement: [line break][bold type]north, south, east, west, up, down, wait [roman type][line break]([bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration: [line break][bold type]look, examine, open, close, lock, unlock[line break][roman type]([bold type]l, x[roman type])"; 
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
		
Move-timer is a number that varies.
move-timer is 4.

The finding is an event that is unattempted.

last location is a room that varies.

Every turn when panic on the first floor has happened:
	If last location is not location of player:
		now move-timer is 4;
		if the player is in F2 Classroom One:
			now move-timer is 6;
		if the player is in F2 Classroom Two:
			now move-timer is 6;
		if the player is in F3 Hallway North:
			now move-timer is 3;
		if the player is in F3 Hallway South:
			now move-timer is 3;
	Otherwise:
		decrease move-timer by 1;
		if move-timer < 1:
			if the player is not in f2 utility closet AND the player is not in f2 classroom one AND the player is not in f2 classroom two:
				now the finding has been attempted;
				now unsheltered has been attempted;
			move The Strange Man to the player;
			now ending is attempted;
	now last location is the location of the player;

Player-collapse is an event that is unattempted.
Pain-timer is a number that varies.
pain-timer is 10.

Every turn when shooting has been attempted:
	decrease pain-timer by 1;
	If pain-timer < 1:
		now player-collapse is attempted;
		now ending is attempted;
		
	
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
		If The Strange Man is in rname in row N of the curtable:
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

The maximum score is 250.

The time of day is 10:00 AM. 
The watch is a thing. The description of the watch is "You look at your watch. The time is now [time of day]".
The cell phone is a thing. The description of the phone is "You look at your phone. The time is now [time of day]".
Understand "mobile", "cell" and "phone" as  the cell phone.
Dialing is an action applying to a number.
Check dialing:
	say "Figures. There's never any cell phone reception when you most need it."
Instead of dialing: say "Figures. There's never any cell phone reception when you most need it."
Understand "call [number]" as dialing.
Understand "dial [number]" as dialing.


Chapter - "Characters"

Section - "The Player"

The paperwork is a thing that is plural-named.
The player carries the paperwork.The player carries the cell phone. The player carries the watch.
A current-status is a kind of thing. A current-status can be noticed or unnoticed. A current-status is usually unnoticed.
The player-status is a current-status. The player-status is unnoticed. 

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

The Strange Man is a person. He is in F1 Entrance. The description of The Strange Man is "He's a bit lanky, and the workman's uniform that he's wearing doesn't really fit. [if panic on the first floor has happened]What is wrong with this guy?[end if]".
Understand "Shooter", "The shooter", "active shooter", "ac", "Jim" and "James" as The Strange Man.

Rule for printing the name of the strange man: 
	say "[if panic on the first floor has happened]active shooter[otherwise]strange man[end if]".
	
Instead of asking the strange man about something:
	say "He doesn't respond. In fact he completely refuses to acknowledge you. It's almost like he's looking through you at someone else.";
	
Instead of telling the strange man about something:
	say "He doesn't respond. In fact he completely refuses to acknowledge you. It's almost like he's looking through you at someone else.";

Instead of telling to the strange man:
	say "He doesn't respond. In fact he completely refuses to acknowledge you. It's almost like he's looking through you at someone else.";

Instead of talking to the strange man:
	say "He doesn't respond. In fact he completely refuses to acknowledge you. It's almost like he's looking through you at someone else.";

	

Section - "The Emergency Building Coordinator"

The Emergency Building Coordinator is a person. She is in F1 Hallway. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.
Understand "Coordinator" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Dropping Off Paperwork is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".


Section - "The Students"

[I am soooo cheating here....]
A studentgroup is a kind of person.
The classroom one students is a studentgroup. He is in F2 Classroom One.
The classroom two students is a studentgroup. He is in F2 Classroom Two.

Understand "students" as studentgroup.
The classroom one students is a thing that is plural-named.
The classroom two students is a thing that is plural-named.

The description of classroom one students is "The students seem to be milling about nervously, uncertain of what to do. Fortunately, you are prepared for this situation. You are prepared for this situation, aren't you?"

Instead of asking studentgroup about something:
	say "No one among the students really seems to have an answer.";
	
Instead of telling studentgroup about something:
	say "The students look at one another, as if each one is expecting someone else to reply to you. They seem to be hoping that you will show them what to do...";

Instead of telling to studentgroup:
	say "The students look at one another, as if each one is expecting someone else to reply to you. They seem to be hoping that you will show them what to do...";

Instead of talking to studentgroup:
	say "The students look at one another, as if each one is expecting someone else to reply to you. They seem to be hoping that you will show them what to do...";
	
	

Chapter - "Layout"

Section - "First Floor"

The First Floor is a region.

Firstshot is an event that is unattempted.

F1 Entrance is a room in the first floor. The description of F1 Entrance is "You are standing in the building entrance. [If prologue is happening]It's time to go find the Program Coordinator.[end if][if F1 Entrance is unvisited] Remember to type [bold type]objectives[roman type] if you're not sure what to do next, or [bold type]commands[roman type] for a list of possible commands. Good luck![end if]There is a Hallway to the North."

North of F1 Entrance is F1 Hallway. It is in the first floor. The description of F1 Hallway is "You are standing in the hallway outside the office of the Program Coordinator. The office of the Program Coordinator is to the [bold type]West[roman type]. To the [bold type]North[roman type], you can see a stairwell leading to the second floor."

West of F1 stairwell toward two is F1 Dean's Office. It is in the first floor. The description of Dean's Office is "[if Panic on the first floor is happening and Dean's Office is unvisited]What is going on? [end if]You're in the Dean's office. You see a desk with a stack of [papers] and a number of [old books] pertaining to your major. The Program Coordinator's office is to the [bold type]South[roman type], and to the [bold type]East[roman type] you can see a door leading toward the stairwell which leads to the second floor of the building. [if Panic on the first floor is happening]There is no good place to hide here.[end if]";

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


Above F1 stairwell toward Two is F2 stairwell toward One. It is in the second floor. The description of F2 stairwell toward One is "This is the stairwell leading down to the first floor. To the [bold type]South [roman type]you see a hallway. Further [bold type]South[roman type] is the stairwell leading to the third floor."


South of F2 stairwell toward one is F2 Hallway. F2 Hallway is in the second floor. The description of F2 Hallway is "You're standing in the middle of the second floor hallway. [If Panic on the first floor has happened]You feel very exposed. The best idea would probably be to try to conceal yourself and find some kind of protective cover. [end if]The stairwell down to the first floor is back toward the [bold type]North[roman type]. Further to the [bold type]South[roman type] you can see the stairwell that goes up to the third floor. To the [bold type]East[roman type] you see an open lobby with glass walls and large windows. [If panic on the first floor has happened]It doesn't look like there's much protective cover in there. [end if]To the [bold type]West[roman type] you see a utility closet."

South of F2 Hallway is F2 stairwell toward Three. F2 stairwell toward Three is in the second floor.The description of F2 stairwell toward Three is "This is the stairwell leading up to the third floor. To the [bold type]West[roman type] and [bold type]East[roman type] are a pair of classrooms. To the [bold type]North[roman type] is the hallway leading back toward the first floor.[if F2 stairwell toward three is unvisited] Use the [bold type]up[roman type] and [bold type]down[roman type] commands to move between floors.[end if]"

East of F2 Hallway is F2 Open lobby. F2 Open lobby is in the second floor. The description of F2 Open lobby is "A spacious room with glass walls[if panic on the first floor has happened] and no protective cover[end if]."

Closethiding is an event that is unattempted;
ClosetEntering is an action applying to nothing.
Understand "enter closet", "get in closet", "hide in closet", "climb in closet",  "go in closet" or "get into closet" as ClosetEntering.
Instead of ClosetEntering when player is not in F2 Hallway:
	say "There is no closet here."
	
Instead of ClosetEntering when the player is in F2 Hallway:
	If the closet door is locked:
		say "The closet door is locked.";
		stop the action;
	say "You climb into the utility closet and crouch down.";
	now the player is in F2 Utility Closet;
	now the closet door is closed;
	now closethiding is attempted;
	
Instead of going west when player is in F2 Hallway:
	If hiding on the second floor is happening:
		try ClosetEntering;
	Otherwise:
		say "Why would you want to get into the closet?";

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
	if the player is in F3 Hallway North:
		if panic on the first floor has happened:
			try decisioning; 
			stop the action;
	if the player is in F2 Hallway, say "You can't unlock the door from this side." instead.
	
Carry out unlocking keylessly: 
	if the player is in F3 Hallway North:
		say "You can't unlock the door from this side.";
	otherwise:
		now the noun is unlocked.
	
Report unlocking keylessly:
	If the noun is unlocked:
		say "You unlock the [noun]."

Instead of going east when player is in F2 Utility closet and closet door is locked:
	say "You'll need to unlock the door first.";
	stop the action;
	
F2 Utility closet is a room. F2 Utility closet is in the second floor. The description of F2 Utility closet is "A utility closet. The door is to the [bold type]East[roman type]."

F2 Classroom One is a room in the second floor. The description of F2 Classroom One is "[if panic on the first floor has happened]You look around desperately for someplace to hide. There are a number of students in the room. They seem to have heard the shots[otherwise]This looks like a pretty ordinary classroom.[end if][if shooting is attempted], and one of them points to your injured leg.[else if panic on the first floor has happened], and a number of them appear to be quite scared. What will you do?[end if]"

F2 Classroom Two is a room in the second floor. The description of F2 Classroom Two is "[if panic on the first floor has happened]You look around desperately for someplace to hide. There are a number of students in the room. They seem to have heard the shots[otherwise]This looks like a pretty ordinary classroom.[end if][if shooting is attempted], and one of them points to your injured leg.[else if panic on the first floor has happened], and a number of them appear to be quite scared. What will you do?[end if]"


A lightswitch is a kind of device.
Understand "light", "lights" as lightswitch.

The modern lightswitch is a switched on lightswitch in F2 Classroom One. It is fixed in place. 
The old lightswitch is a switched on lightswitch in F2 Classroom Two. It is fixed in place.
The big desk is a fixed in place supporter in F2 Classroom One. 
The huge old desk is a fixed in place supporter in F2 Classroom Two.
		
Understand "flip [something] on", "switch [something] on", "turn [something] on", "flip on [something]", "switch on [something]", "turn on [something]" as switching on.
Understand "flip [something] off", "switch [something] off", "turn [something] off", "flip off [something]", "switch off [something]", "turn off [something]" as switching off.


Section - "Third Floor"

The Third Floor is a region.

Above F2 stairwell toward Three is F3 Third Floor Stairwell. It is a room in The Third Floor. The description of F3 Third Floor Stairwell is "This is the stairwell leading down to the second floor.[paragraph break][if panic on the first floor has happened]The shooter definitely knows where you are now. You need to move quickly.[end if] To the [bold type]North[roman type] you see a long corridor with several doors.";


North of F3 Third Floor Stairwell is F3 Hallway South. F3 Hallway South is in the Third Floor. The description of F3 Hallway South is "[if panic on the first floor has happened]The hallway seems to stretch for miles. In the stairwell behind you to the [bold type]South[roman type], you see the shooter coming up the stairs. There are doors on either side of the hallway. To the [bold type]North[roman type] you can see that the hallway ends in a single door.[paragraph break]The shooter is right behind you.[otherwise]An empty hallway.[end if]";

Before going to F3 Hallway South during attack on the third floor:
	If the player is in F3 Hallway North:
		now wrongway is attempted;
		now ending is attempted;
	Otherwise:
		now the strange man is in F3 Third Floor Stairwell.

Before going to F2 Stairwell toward three during attack on the third floor:
		now wrongway is attempted;
		now ending is attempted;
		
West of F3 Hallway South is F3 door one. It is a locked door. F3 door one is not lockable.
East of F3 Hallway South is F3 door two. It is a locked door. F3 door two is not lockable.

North of F3 Hallway North is F3 final door. It is a locked door. F3 final door is not lockable.

North of F3 Hallway South is F3 Hallway North. F3 Hallway North is in the Third Floor. The description of F3 Hallway North is "[if panic on the first floor has happened]The hallway seems to stretch for miles. The shooter is following you down the hallway, and he has almost caught up with you. There is no question about what his intentions are. There is a single door to the [bold type]North[roman type].[paragraph break]You're cornered, and you're out of options. The shooter is walking toward you with his gun hanging loosely at his side. I suppose that you could try to run past the shooter, but you might not get very far. Your only real choice here is to attack.[otherwise]You try the door, but it's locked. Looks like this hallway is a dead end.[end if]";

Before going to F3 Hallway North during attack on the third floor:
	now the strange man is in F3 Hallway South.


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

The poster is a thing. The poster is in the F1 Hallway. The description of the poster is "The poster outlines a number of tips for how to be prepared in the event that someone enters a building with a gun, intending to harm other people. Among the points listed here are three important things that one can do in order of priority:[paragraph break][bold type]1. Try to get out of the building if possible.[line break]2. Try to hide from the shooter.[line break]3. Try to confront the shooter physically.[roman type][paragraph break]These are ordered by priority, with confrontation being a strategy of last resort, to be undertaken only when there are no other options available.[paragraph break]When you are forced to hide, try to do the following:[paragraph break][bold type]1. Turn off all lights to avoid attracting attention.[line break]2. Lock all doors in the room you're in.[line break]3. Seek protective cover.[roman type]";

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
	
OffDropping is an action applying to nothing.
Understand "drop off paperwork" as OffDropping.
Instead of OffDropping:
	Now Program Coordinator May has the paperwork;


Section - "Panic on the first floor"


Dean's door is a lockable door that is unlocked. It is north of F1 Coordinator's office and south of F1 Dean's Office.
Toldaboutlock is a truth state that varies. Toldaboutlock is false.

Panic on the first floor is a scene.
Panic on the first floor begins when Dropping Off Paperwork has ended.
Panic on the first floor ends when player is in second floor.
The description of Panic on the first floor is "A loud popping sound can be heard in the hallway to the East. 'Did you hear that?' says Ms. May. She gets up from her desk and moves toward the hallway. The Dean follows her out toward the hallway. 'Isn't that Professor Reynolds ex-husband?' the Dean asks.[paragraph break]The Dean and Ms. May walk out into the hallway. A few moments later several more pops can be heard. Ms. May runs right back past you and [bold type]North[roman type] into the Dean's office. 'Run!' she says, and then she is gone.".

When Panic on the first floor begins:
	now The Strange Man is in F1 Entrance;

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
	
When Panic on the first floor ends:
	Now the player-objective is "run, or hide."


Section - "Hiding on the second floor"

Shooting is an event that is unattempted.
Classrooming is an event that is unattempted.
Closeting is an event that is unattempted.
Notlocking is an event that is unattempted.

Hiding on the second floor is a scene.
Hiding on the second floor begins when Panic on the first floor has ended.
Hiding on the second floor ends when the player is in the Third Floor.
The description of Hiding on the second floor is "It is obvious that guy isn't really a workman. You have to face the fact that there is an active shooter in the building. You hear more gunshots coming from the direction of the stairwell behind you as you move through the building. As frightening as a situation like this is, you know that you need to keep your wits about you. Standing here in the stairwell is probably not the best idea. You'd better keep moving.";
		
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
	
After going to F2 stairwell toward three during Hiding on the second floor:
	clear only the main screen;
	now The Strange Man is in F2 stairwell toward one;
	say "Looking [bold type]North[roman type], you notice that the shooter has appeared at the top of the stairs. He seems preoccupied, [if shooting has been attempted]but after a moment he looks right at you. You'd better run.[else if player-status is noticed]but after a moment he looks right at you. He takes a step toward you, and then another. He begins to raise his gun. You feel frozen in place...[otherwise]and he hasn't noticed you yet.[end if]";
	say "[bold type]";
	pause the game;
	say "[roman type]";
	try looking;
	now the player-status is noticed;
	
Every turn when shooting has been attempted:
	say "[one of]Your leg is killing you.[or]You have a shooting pain in your leg.[or]You think your leg may have just gone numb.[or]The pain in your leg is really getting to you.[or]You wonder how much blood a person can lose before they pass out...[at random]";

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
	now closeting is attempted;

Every turn during Hiding on the second floor:
	If The Strange Man is in F2 stairwell toward one:
		If the player is in F2 hallway:
			now wrongway is attempted;
			now ending is attempted;
		
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

classroom door one is a door that is unlocked. It is west of F2 Stairwell toward three and east of F2 Classroom One.
Classroom door two is a door that is unlocked. It is east of F2 Stairwell toward three and west of F2 Classroom Two.

When classroom shelter begins:
	now the player-objective is "help everyone here take cover.";

cover is an event that is unattempted.
classroom-covered is a challenge that is unsuccessful.

Covering is an action applying to nothing.
Understand "help everyone", "help cover", "help everyone take cover", "help people", "take cover", "cover", "hide", "take shelter" or "shelter" as covering.

Report covering:
	say "[If panic on the first floor has happened]You quickly take charge of the students in the classroom. Very quietly, you motion people toward hiding places around the room. Those who can't find any protective cover stay pressed against the walls of the room so that they can't be easily seen from the doorway.[otherwise]Why would you want to hide?[end if]";
	
Carry out covering:
	If panic on the first floor has happened:
		now cover is attempted;
		try looking;

[Yeah, I know. This implementation is stupid. There's probably a better way to do this.]
Every turn during classroom shelter:
	If player is in F2 classroom One:
		If classroom door one is locked:
			If modern lightswitch is switched off:
				If cover is attempted:
					now classroom-covered is successful;
	If player is in F2 classroom Two:
		If classroom door two is locked:
			If old lightswitch is switched off:
				If cover is attempted:
					now classroom-covered is successful;

Before going to F2 stairwell toward three during classroom shelter:
	now wrongway is attempted;
	now ending is attempted;
	

Section - "Attack on the third floor"

Confrontation is an event that is unattempted.
Passing is an event that is unattempted.

Attack on the third floor is a scene.
Attack on the third floor begins when Hiding on the second floor has ended.
Attack on the third floor ends when the confrontation is attempted.

When attack on the third floor begins:
	now the player-objective is "run.";
	
Before going to F3 Third floor stairwell during Attack on the third floor:
	If shooting is unattempted:
		clear only the main screen;
		say "Going back down the stairs is probably a bad idea, but you decide to take the risk. As you walk down the stairs, the shooter appears at the base of the stairwell. He aims his gun in your direction and fires. After a moment, you begin to feel a sharp pain in your leg. [bold type]You've been shot!";
		pause the game;
		say "[roman type]";
	If shooting has been attempted:
		now wrongway is attempted;
		now ending is attempted;
	else:
		now shooting is attempted.

Decision-making is an event that is unattempted;
Decisioning is an action applying to nothing;
Run-pasting is an action applying to nothing;
Shooter-attacking is an action applying to nothing;

Report decisioning:
	say "Nope. The door is securely locked from the other side.[paragraph break]You're cornered, and you're out of options. The shooter is walking toward you with his gun hanging loosely at his side. I suppose that you could try to run past the shooter, but you might not get very far. Your only real choice here is to attack.";
	now decision-making is attempted;
	
Understand "attack", "fight", "attack the shooter", "attack him", "punch", "punch the shooter", "fight the shooter", "confront", "confront the shooter", "hit the shooter", "hit", "beat the shooter", "beat up the shooter" as shooter-attacking.
Understand the command "run" as something new.
Understand "run", "run past", "run past the shooter", "run away", "pass" as run-pasting.
	
Report shooter-attacking:
	clear only the main screen;
	say "You throw yourself at the shooter, grabbing his gun hand in one hand and tackling him bodily. You wrestle him to the ground. The gun goes off one last time before it spirals away down the hallway. [paragraph break]Just as the shooter pushes you away, a half dozen police officers come barrelling up the stairs with their guns drawn, shouting loudly for everyone to lay face down on the floor."; 
	say "[bold type]";
	pause the game;
	say "[roman type]";
	
Carry out shooter-attacking:
	now confrontation is attempted;
	now ending is attempted;

Report run-pasting during attack on the third floor:
	clear only the main screen;
	say "You try to run past the shooter, but...";
	say "[bold type]";
	pause the game;
	say "[roman type]";

Report run-pasting:
	If panic on the first floor has not happened:
		say "Use the commands north, south, east, west, up and down to move around the map.";
		try looking;
	
Carry out run-pasting during attack on the third floor:
	now passing is attempted;
	now ending is attempted;

Instead of unlocking keylessly when the player is in F3 Hallway South:
	say "The door is locked securely from the other side.";
	
Instead of going west when the player is in F3 Hallway South:
	say "The door is locked securely from the other side.";

Section - "Epilogue"

Epilogue begins when ending is attempted.
Endingmessage is an event that is unattempted.
Epilogue is a scene.

When Epilogue begins:
	say "[bold type]Epilogue:[roman type][paragraph break]";
	If closethiding is attempted:
		If player is in F2 Utility Closet:
			say "You hear footsteps approaching the door. The doorknob begins to turn slowly... [if closet door is locked]but stops because you locked the door behind you.[otherwise]and the door opens. [end if][if closet door is unlocked]You wake up in the back of an ambulance. They tell you that you've lost a lot of blood, but there are others who fared worse. [end if]The police eventually [if closet door is locked]found you hiding safely and [end if]caught the shooter, but many people were injured, and some were even killed. [If closet door is not locked]You might not have been shot if you had only had the closet door locked from the inside.[end if][line break]This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for situations like this.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";
			now endingmessage is attempted;
	Else if classrooming is attempted:
		If classroom-covered is successful:
			If player is in F2 classroom one:
				say "You hear footsteps approaching the door. Everyone in the room tenses up. The doorknob begins to turn slowly... and stops. You hear the shooter begin to walk away from the door. It looks like you're safe for now. [paragraph break]The police eventually catch the shooter. You are given a commendation for your role in securing the other students from harm. [paragraph break]This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for situations like this one.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";
				now endingmessage is attempted;
		Otherwise:
			If player is in F2 classroom one:
				say "Footsteps slowly approach the classroom door. Because you didn't prepare quickly enough, the shooter makes his way into the classroom.[paragraph break]The shooter hovers in the doorway for a moment. He aims his gun at a student in the classroom. A loud crack sounds. The shooter slumps into the doorway and falls to the floor. You feel your heart jump as police officers come pouring into the room, followed shortly by medical personnel.[paragraph break] [if classroom door one is unlocked]The classroom door was unlocked. [end if][if modern lightswitch is switched off]The lights were still on. [end if][if cover is unattempted]No one in the room took protective cover. [end if]Because of this, people in the classroom came very close to dying. The police eventually caught the shooter, but many people were injured, and some were even killed.[paragraph break]This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for situations like this one.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";
				now endingmessage is attempted;
	Else if confrontation is attempted:
		If endingmessage is unattempted:
			say "The police wrap up their investigation quickly, and your story makes its way to the press. Your valiant attack on the active shooter may have saved many lives. Congratulations, hero. You did the right thing.[paragraph break]All the same, this has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for situations like this one.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";
			now endingmessage is attempted;
	If endingmessage is unattempted:
		say "[If player-collapse is attempted][bold type]You have passed out from loss of blood.[roman type][paragraph break][end if][If wrongway is attempted]It looks like you took a very wrong turn. [end if][If finding is attempted]It looks like you didn't find protective cover in time. You stayed in one place for far too long. [end if]You wake up in the back of an ambulance. They tell you that you've lost a lot of blood, but there are others who fared worse. The police eventually caught the shooter, but many people were injured, and some were even killed. [If wrongway is attempted]Any wrong turn [end if][If finding is attempted]Hesitation [end if][If unsheltered is attempted]Staying in an open area [end if]can cost you a lot in a situation involving an active shooter. [paragraph break]This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for situations like this one.[paragraph break][bold type]Here are some pointers for the next time you play:[roman type][paragraph break]";	
		now endingmessage is attempted;
	If the Dean's door is locked:
		say "* You locked the Dean's door behind you. That's a good way to be safer in a situation like this. Nice work.[paragraph break]";
		increase the score by 20;
	Otherwise:
		say "* Consider locking more doors behind you. This will deter an active shooter from getting the jump on you.[paragraph break]";
	If closethiding is attempted:
		If player is in F2 Utility Closet:
			If closet door is locked:
				say "* You hid in the closet and stayed put until help arrived. This is a very good way to stay safe until help arrives, especially if you can't get out of the building any other way.[paragraph break]";
				increase the score by 50;
			Otherwise:
				say "* When hiding, make sure that the doors between you and the active shooter are locked from the inside.[paragraph break]";
				decrease the score by 20;
	If wrongway is attempted:
		say "* Try to be aware of where the active shooter is in relation to you. Don't move toward the shooter unless you have to.[paragraph break]";
		decrease the score by 50;
	If unsheltered is attempted:
		say "* Be careful about entering open areas with little or no protective cover.[paragraph break]";
		decrease the score by 20;
	If finding is attempted:
		say "* Try not to linger too long in unsafe places.";
		decrease the score by 50;
	If player-collapse is attempted:
		say "* Going back down the stairs toward the shooter was a pretty bad move. You could have died.";
		decrease the score by 50;
	If classrooming is attempted:
		If classroom-covered is successful:
			say "* You performed exceptionally well in the classroom. Good job.";
			increase the score by 50;
		Otherwise:
			say "* You could have done more to prepare in the classroom. Next time be sure the lights are off, the door is locked and that you take protective cover.";
	If panic on the first floor has happened:
		increase the score by 20;
	If hiding on the second floor has happened:
		increase the score by 20;
		If closet door is locked:
			decrease the score by 50;
	If attack on the third floor has happened:
		increase the score by 20;
	If the confrontation is attempted:
		say "* You're a hero. Well done.";
		increase the score by 100;
	If the passing is attempted:
		say "* Sometimes there is no alternative left to us but to fight.";
		decrease the score by 20;
	end the game saying "Final Score : [score]. Can you do better?".
	

release along with the source text.
release along with an interpreter.
release along with a website.
