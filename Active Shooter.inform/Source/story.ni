"Active Shooter" by Devin Quirozoliver

Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Flexible Windows by Jon Ingold.



Chapter - "Setup"

Section - "General Mechanics"

The objective is indexed text that varies.
The objective is "to get to class on time."

Helping is an action applying to nothing.
Understand "h" or "help" as helping.
Report helping:
	say "To get a list of common commands, type [bold type]commands[roman type].[line break]To see what you should probably be doing right now, type [bold type]objective[roman type].[roman type][line break]Remember to look for commands in [bold type]bold[roman type] to find clues to your next action.[line break]Many commands have shorter versions. For instance, to go [bold type]south[roman type], you can just type [bold type]s[roman type]."
	
Commanding is an action applying to nothing.
Understand "c", "command" or "commands" as commanding.
Report commanding:
	say "[paragraph break]Use the following commands to explore:[paragraph break]Movement: [line break][bold type]north, south, east, west, up, down [roman type][line break]([bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration: [line break][bold type]look, examine, push, press[line break][roman type]([bold type]l, x[roman type])"; 
	say "[paragraph break]Inventory: [line break][bold type]take, put, drop, inventory[line break][roman type]([bold type]t, p, d, i[roman type])"; 
	say "[paragraph break]Speech: [line break][bold type]ask, tell, say[roman type]"; 
	say "[paragraph break]Assistance: [line break]Type [bold type]help[roman type], [bold type]commands[roman type], or [bold type]objective[roman type] at any time to get help.";
	
Objectiving is an action applying to nothing.
Understand "obj", "objective" or "objectives" as objectiving.
Report objectiving:
	say "    Your current objective is:[line break]    [objective]";
	say "[line break]";
	
Currentrooming is an action applying to nothing.
Report currentrooming:
	say "[line break]";
	say "    You are currently in the[line break]    [location]."; 

Mapping is an action applying to nothing.
Understand "m" or "map" as mapping.
Report mapping:
	clear the map-window;
	try currentrooming;
	try objectiving;
	try rendering;
	
Section - "Map Rendering"

[Grid is enumerated from 1]
Table of Third Floor Rooms
RName			X	Y
F3 Third Floor Stairwell			2	3
F3 Hallway North			2	1
F3 Hallway South			2	2

Table of Second Floor Rooms
RName		X	Y
F2 Stairwell to One		2	1
F2 Classroom One		1	2
F2 Hallway		2	2	
F2 Classroom Two		3	2
F2 Classroom Three		1	3
F2 Stairwell to Three		2	3
F2 Classroom Four 		3	3

Table of First Floor Rooms
RName			X	Y
F1 Dean's Office			1	1
F1 Stairwell to Two			2	1
F1 Outer Lobby			1	2
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
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 6) column (X in row N of the curtable * 6);
			say "***";
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 7) column (X in row N of the curtable * 6);
			say "*@*";
			position the cursor in map-window at row ((Y in row N of the curtable * 4) + 8) column (X in row N of the curtable * 6);
			say "***";
		Otherwise:
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 6) column (X in row N of the curtable * 6);
			say "***";
			position the cursor in map-window at row ((Y in row N of the curtable * 4)+ 7) column (X in row N of the curtable * 6);
			say "* *";
			position the cursor in map-window at row ((Y in row N of the curtable * 4) + 8) column (X in row N of the curtable * 6);
			say "***";
	repeat with M running from 1 to the number of rows in the curconnection:
		Choose row M in the curconnection;
		If the orientation entry is "v": 
			position the cursor in map-window at row ((Y entry * 4) + 9) column ((X entry * 6) + 1);
			say "|";
		If the orientation entry is "h": 
			position the cursor in map-window at row ((Y entry * 4) + 7) column ((X entry * 6) + 3);
			say "---";
	position the cursor in map-window at row 23 column 1;
	say "    MAP KEY - [line break]    @ = You. [line break][if Panic on the first floor has happened]   	s = Shooter. [end if][paragraph break]";


Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to. 
Understand "talk" as talking to.
Understand "say hello to [someone]" as talking to.

Every turn:
	follow the window-drawing rules for the map-window;
	

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
	try mapping;
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

The paperwork is a thing.
The player carries the paperwork.The player carries the cell phone. The player carries the watch.

Section - "The Dean"

Dean Martin is a person. He is in the Outer Lobby. The description of Dean Martin is "Professor Martin is the Dean of your school. He's quite nice when you get to know him."
Understand "The Dean", "Martin", "Professor Martin" and "Dean" as Dean Martin.

Section - "The Secretary"

Ms May is a person. She is in the Outer Lobby. The description of Ms May is "Ms. May is the undergraduate coordinator. She's helped you out a lot with your school career."
Understand "May", "Ms May", "Secretary", "UC" and "Undergraduate Coordinator" as Ms May.

Section - "The Shooter"

James Shooter is a person. The description of James Shooter is "What is wrong with this guy?"
Understand "Shooter", "The shooter", "active shooter", "ac", "Jim" and "James" as James Shooter.

Section - "The Emergency Building Coordinator"

The Emergency Building Coordinator is a person. She is in Hallway North. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.
Understand "Coordinator" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Dropping Off Paperwork is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".




Chapter - "Layout"

Section - "First Floor"

The First Floor is a region.


F1 Entrance is a room in the first floor. The description of F1 Entrance is "You are standing in the building entrance. [If prologue is happening]It's time to go find the Undergraduate Coordinator.[end if][if F1 Entrance is unvisited] Remember to type [bold type]objectives[roman type] if you're not sure what to do next, or [bold type]commands[roman type] for a list of possible commands. Good luck![end if]"


North of F1 Entrance is F1 Hallway. It is in the first floor. The description of F1 Hallway is "You are standing in the hallway outside the office of the Undergraduate Coordinator. The office of the Undergraduate Coordinator is to the West. To the North, you can see a stairwell leading to the second floor."


West of F1 stairwell to two and north of F1 Outer Lobby is F1 Dean's Office. It is in the first floor. The description of Dean's Office is "[if Panic on the first floor is happening and Dean's Office is unvisited]What is going on?[end if]You're in the Dean's office. You see a desk with a [stack of papers] and a number of [old books] pertaining to your major."
The stack of papers is fixed in place. It is scenery. It is in the Professor's Office. The description of the stack of papers is "You probably shouldn't be poking around through this stuff. Besides, it doesn't look like your grade is here."
The Dean's Desk is a fixed in place supporter in the Dean's Office.
There are some old books on the Dean's desk. They are fixed in place scenery.
There are some heavy books on the Dean's desk. They are fixed in place scenery.


North of F1 Hallway is F1 Stairwell to Two. It is in the first floor. The description of F1 Stairwell to Two is "This is the stairwell leading up to the second floor."


West of F1 Hallway is F1 Outer Lobby. It is in the first floor. The description of the F1 Outer Lobby is "You enter the outer lobby of the Dean's office."
The Coordinator's Desk is a fixed in place supporter in the Outer Lobby.
There are some new books on the Coordinator's desk. They are fixed in place scenery.




Section - "Second Floor"

The Second Floor is a region.


Above F1 Stairwell to Two is F2 Stairwell to One. It is in the second floor. The description of F2 Stairwell to One is "This is the stairwell leading down to the first floor."


South of F2 Stairwell to one is F2 Hallway. F2 Hallway is in the second floor. The description of F2 Hallway is "You're standing in the middle of the second floor hallway. [If Panic on the first floor has happened]You feel very exposed.[end if]"


South of F2 Hallway is F2 Stairwell to Three. F2 Stairwell to Three is in the second floor.The description of F2 Stairwell to Three is "This is the stairwell leading up to the third floor."


East of F2 Hallway is F2 Classroom Two. F2 Classroom Two is in the second floor. The description of F2 Classroom Two is "An ordinary looking classroom."


West of F2 Hallway is F2 Classroom One. F2 Classroom One is in the second floor. The description of F2 Classroom One is "An ordinary looking classroom."


South of F2 Classroom One and west of F2 Stairwell to Three is F2 Classroom Three. F2 Classroom Three is in the second floor. The description of F2 Classroom Three is "An ordinary looking classroom."


South of F2 Classroom Two and east of F2 Stairwell to Three is F2 Classroom Four. F2 Classroom Four is in the second floor. The description of F2 Classroom Four is "An ordinary looking classroom."


Section - "Third Floor"

The Third Floor is a region.


Above F2 Stairwell to Three is F3 Third Floor Stairwell. It is a room in The Third Floor. The description of F3 Third Floor Stairwell is "This is the stairwell leading down to the third floor."


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
Prologue Ends when the player is in Second Floor.

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
	say "[paragraph break]You're in the entrance of the administration building. It's almost time for class. There is a workman here fiddling with the lock on the front door of the building. You say good morning to him, but he very rudely chooses to ignore you. Before you head for the classroom, you need to drop off some paperwork with the undergraduate coordinator. This should only take a minute.[paragraph break]";
	say "[bold type]";
	pause the game; 
	say "[roman type]";


Section - "EBC Conversation"

EBC Conversation is a scene.
EBC Conversation begins when Prologue has ended.
EBC Conversation ends when the Emergency Building Coordinator is off-stage.
The description of EBC conversation is "".

The brochure is a thing. The description of the brochure is "The brochure outlines a number of tips for how to be prepared in the event that someone enters a building with a gun, intending to harm other people. Among the points listed here are three important things that one can do in order of priority:[paragraph break]1. Try to get out of the building if possible.[line break]2. Try to hide from the shooter[line break]3. Try confront the shooter physically."  

Every turn during EBC Conversation:
	If player is in Hallway North:
		say "The Emergency Building Coordinator steps down from her ladder and sighs lightly. 'These signs are always crooked. Oh well.' You don't see anything wrong with the sign. The Coordinator turns to you and says 'Here. We just printed these. Take a [bold type]look[roman type].";
		now the player is carrying the brochure.
		now Emergency Building Coordinator is off-stage.


Section - "Dropping Off Paperwork"

Dropping off Paperwork is a scene.
Dropping off Paperwork begins when EBC Conversation ends.
Dropping off Paperwork ends when the paperwork is in the Outer Lobby, or the paperwork is on the coordinator's desk or Ms May is carrying the paperwork.
The description of Dropping Off Paperwork is "".


Section - "Office Conversation"

Office Conversation is a scene.
Office Conversation begins when Dropping Off Paperwork has ended.
Office Conversation ends when the Emergency Building Coordinator is off-stage.
The description of Office conversation is "".


Section - "Panic on the first floor"

Panic on the first floor is a scene.
Panic on the first floor begins when Office Conversation has ended.
Panic on the first floor ends when the player is in the Second Floor.

Section - "Confrontation"

Confrontation is a scene.
Confrontation begins when the player is in the Third Floor.

Section - "Epilogue"

Epilogue is a scene.
Epilogue begins when Confrontation ends.

When Epilogue begins:
	say "This has turned out to be a pretty bad week. It doesn't really get much worse than this. You've survived, and now you've decided that in the future you're going to be more prepared for scenarios like this.[paragraph break]";	
	if hiding is attempted:
		increase the score by 50;
	if doorlocking is attempted:
		increase the score by 20;
	if the confrontation is attempted:
		increase the score by 100;
	end the game saying "Final Score : [score]. Can you do better?".
	

release along with the source text.
release along with an interpreter.
release along with a website.
