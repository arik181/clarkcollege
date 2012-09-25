"Evacuation" by "Devin Quirozoliver"

Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Flexible Windows by Jon Ingold.

Chapter - "Setup"

Section - "General Mechanics"

The player-objective is indexed text that varies.
The player-objective is "to find your Professor."

Helping is an action applying to nothing.
Understand "h" or "help" as helping.
Report helping:
	say "To get a list of common commands, type [bold type]commands[roman type].[line break]To see what you should probably be doing right now, type [bold type]objective[roman type].[roman type][line break]Remember to look for commands in [bold type]bold[roman type] to find clues to your next action.[line break]Many commands have shorter versions. For instance, to go [bold type]south[roman type], you can just type [bold type]s[roman type].";
	
Commanding is an action applying to nothing.
Understand "c" or "command" or "commands" as commanding.
Report commanding:
	say "[bold type]Commands:[roman type][paragraph break]Movement: [line break][bold type]north, south, east, west, up, down [roman type][line break]([bold type]n, s, e, w, u, d[roman type])"; 
	say "[paragraph break]Exploration: [line break][bold type]look, examine, push, press[line break][roman type]([bold type]l, x[roman type])"; 
	say "[paragraph break]Inventory: [line break][bold type]take, put, drop, inventory[line break][roman type]([bold type]t, p, d, i[roman type])"; 
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
RName	X	Y
Third Floor Stairwell	3	2

Table of Second Floor Rooms
RName	X	Y
Second Floor Elevator	2	1
Hallway North	2	2
Hallway South	2	3
Professor's Office	1	3
The Second Floor Stairwell	3	2

Table of First Floor Rooms
RName	X	Y
First Floor Elevator	2	1
First Floor Hallway North	2	2
First Floor Stairwell	3	2
First Floor Hallway South	2	3


[This table describes a separate grid 
 which overlays the room grid.]
[There are no connecting passages
  on the third floor]
  [Type 1 : Vertical]
  [Type 2 : Horizontal]
Table of First Floor Connecting Passages
Orientation	X	Y
"v"	2	1
"v"	2	2
"h"	2	2

Table of Second Floor Connecting Passages
Orientation	X	Y
"v"	2	1
"v"	2	2
"h"	2	2
"h"	1	3


Table of Third Floor Connecting Passages
Orientation
"none"

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
	repeat with M running from 1 to the number of rows in the curconnection:
		Choose row M in the curconnection;
		If the orientation entry is "v": 
			position the cursor in map-window at row ((Y entry * 4) + 5) column ((X entry * 6) + 1);
			say "|";
		If the orientation entry is "h": 
			position the cursor in map-window at row ((Y entry * 4) + 3) column ((X entry * 6) + 3);
			say "---";
	position the cursor in map-window at row 2 column 2;
	say "    MAP KEY - [line break]     @ = You.[paragraph break]";

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to. 
Understand "talk" as talking to.
Understand "say hello to [someone]" as talking to.

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

A borrowable is a kind of thing. A borrowable can be returned or not returned.
The borrowed book is a borrowable. The description of the borrowed book is "You really should have returned this book last week, but things have just been so busy lately....".  

The player carries the borrowed book; The player carries the cell phone. The player carries the watch.

Section - "The Professor"

The tweed jacket is a wearable thing.
The bowtie is a wearable thing.

Professor Plum is a person. He is in Professor's Office. He wears a tweed jacket and a bowtie. The description of Professor Plum is "Your Professor is sitting at his desk, quietly grading papers. He wears a bow tie and a tweed jacket."
Understand "prof" as Professor Plum.

In Hallway North is a map. It is fixed in place. The description of the map is "You see a map of the building. At the bottom of the map you see a [label]. In order to get out of the building, you'll have to go North toward the elevator or East toward the stairwell. Then you'll need to head downstairs, and [bold type]South[roman type] toward the exit."

The label is a thing on the map. It is fixed in place. It is scenery. The description of the label is "The label at the bottom of the map says: Posted by the Emergency Building Coordinator."

After examining the map:
	increase the score by 7;


Section - "The Emergency Building Coordinator"

The Emergency Building Coordinator is a person. She is in Hallway North. The description of The Emergency Building Coordinator is "There is a nice lady putting up a permanent sign in the hallway here. She looks pretty busy."

Understand "EBC" as The Emergency Building Coordinator.
Understand "Coordinator" as The Emergency Building Coordinator.

After asking the Emergency Building Coordinator about something: 
	say "[if Returning a Book is happening][one of]What's that?[or]Sorry?[or]Pretty busy here.[or]Don't forget that there's going to be an evacuation drill at noon.[or]Hm?[at random][end if][if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily. [paragraph break]Once the alarm goes off, you will continue to lose points until you get out of the building.[end if]".


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

North of Hallway South is Hallway North. The description of Hallway North is  "You are at the North end of the hallway, on the second floor. [If EBC Conversation is happening or Returning a Book is happening]The Emergency Building Coordinator is busily putting up an evacuation [map] on the wall.[otherwise]On the East wall you see a [map].[end if] The hallway continues to the [bold type]South[roman type]. To the [bold type]North[roman type], you see a set of old elevator doors. To the [bold type]East[roman type] you see stairs."

West of Hallway south is the Professor's Office. The description of Professor's Office is "[if Professor's Office is unvisited]You knock on the door to your professor's office. 'Come in,' he says. [line break]'I'm dropping off your book,' you say, casually.[line break]'Oh, that's fine. You can just [bold type]put[roman type] it anywhere'.[paragraph break][end if]You see a desk with a [stack of papers] and a number of [old books] pertaining to your major. There is also a [bookshelf] with many more [heavy books] on it."
The stack of papers is fixed in place. It is scenery. It is in the Professor's Office. The description of the stack of papers is "You probably shouldn't be poking around through this stuff. Besides, it doesn't look like your grade is here."
The desk is a fixed in place supporter in the Professor's Office.
The bookshelf is a fixed in place supporter in the Professor's Office.
There are some old books on the desk. They are fixed in place.
There are some heavy books on the desk. They are fixed in place.

The Second Floor Elevator is a room. The description of The Second Floor Elevator is "[if Second Floor Elevator is unvisited and Prologue is happening]Now you're upstairs. Notice that the map on the right side of the screen has changed. You'll notice that your objective is located there. You should be able to find the professor's office on this floor. If you want to return to the first floor by way of the elevator, simply [bold type]push[roman type] or [bold type]press[roman type] the 1F button. Good luck![otherwise]You are in the elevator on the second floor. [bold type]Press[roman type] the 1F button to return to the first floor. The hallway is to the [bold type]south[roman type]".
The elevator door is an open door. It is south of the Second Floor Elevator and north of Hallway North.
Understand "leave", "leave the elevator","exit the elevator", "get out", "get out of the elevator", "step out" or "step out of the elevator" as exiting.
Instead of exiting when the player is in The Second Floor Elevator:
	say "You step out of the elevator and into the hall.";
	now the player is in Hallway North.
	
East of Hallway North is The Second Floor Stairwell. The description of The Second Floor Stairwell is "[if Second Floor Stairwell is unvisited and Prologue is happening]So now you're upstairs. Notice that the map on the right side of the screen has changed. You'll notice that your objective is located there. You should be able to find the professor's office on this floor. Remember to type [bold type]objectives[roman type] if you're not sure what to do next, or [bold type]commands[roman type] for a list of possible commands. Good luck![otherwise]You are in the second floor stairwell. Type [bold type]down[roman type] to return to the first floor. You see stairs leading to the first and third floors of the building.[end if]"

Hallway South, Hallway North, Professor's Office, The Second Floor Elevator and The Second Floor Stairwell are in the second floor.


Section - "First Floor"

The First Floor is a region.

The First Floor Elevator is a room. The description of the First Floor Elevator is "[If the First Floor Elevator is unvisited and Prologue is happening]Now you're in the first floor elevator. If you  [bold type]look[roman type] around, you'll see that there are some buttons here. Try [bold type]push[roman type]ing the button for the second floor.[otherwise]You are in the First Floor Elevator. [bold type]Press[roman type] the 2F button to go to the second floor. There are buttons here for the first and second floors.[end if]"

A pressable is a kind of thing.
The 1F Button is a pressable. It is in the First Floor Elevator. The 1F Button is fixed in place.
The 2F Button is a pressable. It is in the First Floor Elevator. The 2F Button is fixed in place.

Every turn:
	if the player is in the first floor elevator:
		now the 1F Button is in the first floor elevator;
		now the 2F Button is in the first floor elevator;
	if the player is in the second floor elevator:
		now the 1F Button is in the second floor elevator;
		now the 2F Button is in the second floor elevator;
		
Understand "press" as pushing.
			
Instead of pushing:
	if the Lift is stuck:
		say "Yeah, that's not going to work. The elevator is stuck, remember?";
	else if the player is in the First Floor Elevator:
		if the noun is the 2F Button:
			say "You press [the noun], and head to the Second Floor.";
			now the player is in the Second Floor Elevator;
		else if the noun is the 1F Button:
			say "You're already on the first floor.";
	else if the player is in the Second Floor Elevator:
		if the noun is the 1F Button:
			say "You press [the noun], and head to the FirstFloor.";
			now the player is in the First Floor Elevator;
		else if the noun is the 2F Button:
			say "You're already on the second floor.";

East of the First Floor Hallway North is First Floor Stairwell. It is below the Second Floor Stairwell. The description of the First Floor Stairwell is "[if First Floor Stairwell is unvisited and Prologue is happening]Excellent. In a stairwell, moving between floors is just a matter of using the [bold type]up[roman type] and [bold type]down[roman type] commands. Try going up to the second floor now.[otherwise]You are in the first floor stairwell. Type [bold type]up[roman type] to go to the second floor.[end if]"

South of The First Floor Elevator is First Floor Hallway North. The description of First Floor Hallway North is "[if First Floor Hallway North is unvisited and Prologue is happening]Great! You will notice that the @ in the map on the right moved north by one room. This map represents your current location in the game. Now let's head upstairs. You can use either the elevator to the North, or the stairwell to the East.[otherwise]You are in the First Floor Hallway North. To the East is a stairwell, and to the North is an elevator.[end if]"

South of First Floor Hallway North is First Floor Hallway South. The description of First Floor Hallway South is "[if First Floor Hallway South is unvisited and Prologue is happening]First, let's do a quick tutorial to get you acquainted with the commands. You are currently in the first floor hallway north. Try moving around. Type [bold type]n[roman type] and press return to go North one room.[otherwise]You're in the First Floor Hallway South. This is the building entrance.[end if]"

The First Floor Elevator, First Floor Stairwell, The First Floor Hallway North, and the First Floor Hallway South are in The First Floor.


Section - "Third Floor"

The Third Floor is a region.

Above the Stairwell is The Third Floor Stairwell. The description of the Third Floor Stairwell is "You are in the third floor stairwell. There's is a door here."

The Empty Room is a room. 

The Third Floor Door is a locked door. It is east of the Third Floor Stairwell and west of the MT Room.

The Third Floor Stairwell is in the Third Floor.


Chapter - "Time"


Section - "Start"

When play begins: 
	open up the command-window;
	open up the map-window;
	increase the score by 50;

The player is in The First Floor Hallway South.

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
	say "[paragraph break]You've just arrived on campus. Your first class of the day is in a half an hour, but first you need to return a book to your professor's office. Unfortunately, you seem to have forgotten where his office is located. It's somewhere on the second floor. You need to get there before he leaves. You've just entered the building where your professor keeps his office.[paragraph break]";
	say "[bold type]";
	pause the game; 
	say "[roman type]";

Section - "Returning a Book"

Returning a Book is a scene.
Returning a Book begins when Prologue ends.
Returning a Book ends when borrowed book is in Professor's Office, or borrowed book is on the desk in Professor's Office, or borrowed book is on the bookshelf in Professor's Office, or Professor Plum is carrying borrowed book.
The description of returning a book is "".

Instead of asking the Emergency Building Coordinator about "professor", say "I don't know, I think his office is around here somewhere."
Instead of giving the book to Professor Plum, say "The professor says 'Just [bold type]put[roman type] it on the desk there, will you?'"
After asking Professor Plum about anything, say "[one of]The professor says 'I don't know, I've been in here all day. Working.'[or]The professor says 'I'm pretty busy right now. If you have questions about the course, come see me during office hours.'[at random]"

Check talking to when noun is Professor Plum during Returning a Book:
	say "'Hello,' you say to the professor.[line break]'I'm pretty busy right now,' The professor says. 'If you have questions about the course, come see me during office hours.'".

Check talking to when noun is Emergency Building Coordinator during Returning a Book:
	say "'Hello,' you say to the Emergency Building Coordinator.[line break][if Returning a Book is happening][one of]'What's that? Oh, hello.'[or]'Sorry? Oh, hello.'[or]'Pretty busy here.'[or]'Hm? Oh, hello.'[at random][end if]'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.".

When Returning a Book ends:
	Now Professor Plum has the borrowed book;
	say "[if borrowed book is in the Professor's Office]The professor bends down and picks up the book. 'You should learn to treat books with respect,' he says, dusting off the cover.[otherwise]The professor picks up the book, without looking in your direction, and places it aside.[end if]";
	Now the player-objective is "to get to class."

Section - "EBC Conversation"

EBC Conversation is a scene.
EBC Conversation begins when Returning a Book has ended.
EBC Conversation ends when the Emergency Building Coordinator is off-stage.
The description of EBC conversation is "".

Every turn during EBC Conversation:
	If player is in Hallway North:
		say "The Emergency Building Coordinator steps down from her ladder and sighs lightly. 'Still a bit crooked. Oh well.' The Coordinator turns to you and says 'Don't forget that there's going to be an evacuation drill in a few minutes.";
		now Emergency Building Coordinator is off-stage.
	
Check talking to when noun is Professor Plum during EBC Conversation:
	say "The Professor seems to be ignoring you".

Check talking to when noun is Emergency Building Coordinator during EBC Conversation:
	say "'Hello,' you say to the Emergency Building Coordinator.[if EBC Conversation is happening]The Emergency Building Coordinator steps down from her ladder and looks at the newly minted map appraisingly. 'Don't forget that there's going to be an evacuation drill at noon.', she says, cheerily.[end if]".
	
When EBC Conversation ends:
	Now the player-objective is "To exit the building safely."


Section - "Not a drill"

A ringable is a kind of thing. A ringable can be ringing or not ringing.
The alarm is a ringable.

Not a drill is a scene.
Not a drill begins when EBC Conversation has ended.
When Not a drill begins:
	now the alarm is ringing;
	say "Well, there goes the alarm. I guess you'd better get downstairs.";
	now the player-objective is "to find out who is moaning."
	
The description of not a drill is "".
	
Before going to the Second Floor during Not a drill:
	If the water heater is undetonated:
		clear only the main screen;
		say "[bold type]What the... Did you feel that? There was a kind of a 'WHUMP', and then the lights flickered. It felt like the whole building shook just then...[roman type][paragraph break]";
		now the water heater is detonated;
		pause the game.

Every turn during Not a drill:
	If alarm is ringing:
		say "The alarm is going off."
		
An event is a kind of thing. An event can be attempted or unattempted.
The rescue is an event.

Every turn during Not a Drill:
	if the player is in Professor's Office:
		say "You help the Professor to his feet. He favors his arm a little bit. 'I can walk if you help me,' he says. 'We should probably leave the building now. You lead the way.' He takes your arm and you help him toward the door.";
		now the rescue is attempted;
		now the player-objective is "to help the Professor leave the building."
		
Every turn during Not a drill:
	If the rescue is unattempted, and the player is in the second floor:
		say "You can hear a low moan coming from the direction of your professor's office."

Every turn when alarm is ringing:
	decrease the score by 1;

Section - "Helping Professor Plum"
 
Helping Professor Plum is a scene.
Helping Professor Plum begins when the rescue is attempted.
The description of helping professor plum is "".

Every turn during Helping Professor Plum:
	say "It looks like Professor is doing ok."

Section - "The Elevator Trap"

The elevator trap is a scene.
The elevator trap begins when the player is in the Second Floor Elevator and the Alarm is ringing.
The elevator trap ends when the player is not in the Second Floor Elevator.
The description of the elevator trap is "".

When the Elevator Trap begins:
	say "You jab the button for the first floor repeatedly. The elevator doors close and you feel yourself grow just a tiny bit lighter as the elevator begins to descend.[paragraph break]THUNK.[paragraph break]You stumble as the lights flicker and the elevator comes to a sudden and irrevokable stop.";
	now the elevator door is closed;
	now the Lift is stuck;

Every turn during The Elevator Trap:
	If the lift is stuck and the player is in the second floor elevator:
		say "You may have to [bold type]pry[roman type] open the doors."

Instead of exiting when the player is in The Second Floor Elevator and the Lift is stuck:
	say "[one of]You can't do that.[or]You're trapped![or]The doors are closed! You can't get out![at random]";
	now the player is in Hallway North.

Prying is an action applying to nothing.
Understand "pry", "pry doors", "pry open doors" or "pry elevator doors" as prying.

Instead of prying:
	clear the screen;
	say "You have to pry the doors open with your hands. The elevator has stopped between floors. Through the gap at the bottom you can see people yelling and scurrying around on the first floor. Something strange is definitely going on.[paragraph break]You have to climb up to get back to the second floor. Maybe you shouldn't have taken the elevator.";
	say "[bold type]";
	pause the game;
	say "[roman type]";
	now the player is in Hallway North;

Before going to Hallway North during Elevator Trap:
	try prying;

Section - "Chaos on the first floor"

Chaos on the first floor is a scene.
Chaos on the first floor begins when the player is in the First Floor Stairwell and the Alarm is ringing.
Chaos on the first floor ends when the player is in the First Floor Hallway South and the Alarm is ringing.
The description of chaos on the first floor is "There are people running around all over the place down here! You wonder what's going on[if rescue is attempted], but you'd better get the professor out of the building.[otherwise].[end if]".



Section - "Epilogue"

Epilogue is a scene.
Epilogue begins when Chaos on the first floor ends.

When Epilogue begins:
	say "There's an EMT near the entrance to the building.[if rescue is attempted]You ask him to help you get the Professor to safety.[paragraph break][end if]'What's going on?' you ask.[paragraph break]'An old water heater exploded in the basement. Shook the whole building. Looks like there were only some minor injuries though.' Looks like you're going to be late for class. This has turned out to be a pretty bad day. You're sure that the rest of the week will be better than this. Of course it will. Right?[paragraph break]";	
	if the rescue is attempted:
		increase the score by 50;
	if the lift is stuck:
		decrease the score by 50;
	if the third floor stairwell is visited:
		decrease the score by 20;
	end the game saying "Final Score : [score]. Can you do better?".
	

release along with the source text.
release along with an interpreter.
release along with a website.
