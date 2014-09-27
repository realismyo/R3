/*
Mission Briefing
by AGeNT
- Handles the briefing notes that players will have available during the mission.
- General Briefing Script, if 'agent_var_separateBriefings' is set to FALSE or undefined in the init.sqf, this will run for ALL players.
========== Usage ==========
- Some basic HTML works placed inside the briefing text, such as <br/> for new line.

player createDiarySubject ["Subject Handle","Subject Title"];
-Subject Handle = The handle used to tie records under. (default diary, which will appear under the 'Notes' section in the map screen).
-Subject Title = The title players will see in the briefing / map screen.

player createDiaryRecord ["Subject Handle", ["Record Title","Insert Briefing Text Here"]];
-Subject Handle = The handle that the record will appear under.
-Record Title = The title players will see in the briefing / map screen.
-Briefing Text = Insert whatever you want players to read here. Accepts some basic HTML. 
===========================
*/

// creates notes on command & signals protocols
player createDiaryRecord ["diary", ["Command / Signal","
== MISSION COMMAND AND SIGNAL INFORMATION HERE. == 
"]];

// creates notes on mission administration
player createDiaryRecord ["diary", ["Admin / Logistics","
== MISSION ADMINISTRATION AND LOGISTICAL INFORMATION HERE. ==
"]];

// creates notes a general how to accomplish the mission
player createDiaryRecord ["diary", ["Execution","
Movement: <br/>
== INFORMATION ON MOVEMENT PLAN HERE. ==
<br/><br/>
Fire Support: <br/>
== INFORMATION ON MISSION FIRE SUPPORT ASSETS HERE. ==
<br/><br/>
Objectives: <br/>
== INFORMATION ON MISSION OBJECTIVES HERE. ==
<br/><br/>
"]];

// creates notes on the mission objectives
player createDiaryRecord ["diary", ["Mission","
== KEY MISSION POINTS HERE. ==
"]];

// creates notes on the mission situation
player createDiaryRecord ["diary", ["Situation","
== GENERAL SITUATION STATEMENT HERE. ==
<br/><br/> 
Friendlies: <br/> 
== INFORMATION ON FRIENDLY FORCES HERE. == 
<br/><br/>  
Enemies: <br/> 
== INFORMATION ON ENEMY FORCES HERE. == 
"]];