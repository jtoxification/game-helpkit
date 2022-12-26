# game-helpkit
Helper tools for troubleshooting common issues and automating various common tasks, everything from firewall exclusions to clearing & re-acquiring EAC.

(I know the directory structure kinda sucks! I'm working on it!)

I can be reached via Discord.

## Full Credits Forthcoming
The short version is that this wouldn't have been possible without the vast amount of time and energy provided by the entire volunteer help staff in the r/Star Citizen Discord server.

## Upload Notes
First game on the implementation list is Star Citizen, but many of these troubleshooting tasks aren't game-specific.


## License
Copyright (C) 2022 jtoxification aka Just Some Rando for the Star Citizen Community.

Not affiliated with Cloud Imperium Games


https://www.gnu.org/licenses/gpl-3.0-standalone.html

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

### Add'l Info


## Change Log

2022-12-23  - Initial commit, first activity implemented: clear the shader cache on request.

2022-12-25a - Fixed double-initialization of App Form.

2022-12-25b - Added stub for credits from the help staff.

2022-12-25c - Added add'l directories for moving items into saner locations.

2022-12-25d - Added Syntexx's cat as icon (permission granted as of 2022-12-26 01:13 UTC).

## To Do

#### Lots of stuff. Nothing is guaranteed yet. Trello link forthcoming!

01. Import To Do List into Trello.

02. Add Directory-based Class Hot-loader.

03. Add directory for global troubleshooting/activities.

04. Add directory for game-specific troubleshooting/activities.

05. Add directory for game-agnostic templates for game-specific troubleshooting/activities.

06. Create start-up messages screen.

07. Create/load config file on startup.

08. Add activity to check/warn about file space & RAM usage in startup messages.

09. Add activity to check/warn about RSI Launcher &/or SC install location (i.e. if it's found to be anywhere in the user's OS profile, for instance).

10. Add activity to check the Firewall & Windows Defender Antivirus for exceptions (Create a backup regfile. Use regfile templates - this should be a generic template, as all we need are the locations).

11. Add activity to disable/enable Xbox Game Bar, Captures, & Game Mode (Create a backup regfile. Use a regfile template for each).

12. Add activity to enable/disable hardware-accelerated gpu-scheduling and prioritize launcher & SC (Create a backup regfile. Use a regfile template).

13. Add activity to check power profile settings for performance mode.

14. Add activity to check & offer to fix the Samsung+Win11 error (Create backup regfile & use regfile template).

15. Add activity to check for game input service Event ID 1000 errors in the Event Log. If found, warn that an EXCEPTION_ACCESS_VIOLATION error in the near future or recent past is all but certain, and provide details on general trouble-shooting (unplugging joysticks, disabling virtual joysticks, restarting, retrying, & re-plugging one at a time), disabling overlays, keeping the game installed on a separate drive from the Epic Launcher, checking USB cables, buying externally-powered USB hubs, reinstalling peripheral drivers, checking RAM for failures, & running DISM & SFC.

16. Add activity to check the pagefile - have options to set to fastest drive, and if there is sufficient memory on said drive, show option to set the pagefile usage trick (and regardless, show option to revert to OS standard, as well as option to set to OS-managed on fastest drive).

17. Add activity to clear/backup/restore bindings & settings. Problem: if we want this to really be useful, we'll also need to provide a merge operation that lists out conflicts and deleted sections.

18. Add activity to check for DXGI device hung explorer/dxgi.dll Event ID 1000 errors in the Event Log. Display results alongside button to set TdrLevel to 10 (and button to revert to 2).

19. Add activity to check for Win10 + Intel 12th-gen e-core issue (query GetLogicalProcessorInformation) and warn accordingly that games may stutter. Provide links to solution (and if in SC page, and on Intel 12th gen, offer to enable/disable affinity workaround for SC).

20. Add activity to check for and apply Windows Updates.

21. Add activity to download prerequisite libraries.

22. Add activity to check for potential interaction with overlays, Sonic Studio, Epic.

23. Add activity to display whether rsi services are down (poll the status updates site).

24. (Undecided) Add activity to automatically re-migrate install files elsewhere to avoid re-download.

25. (Undecided) Add activity to check & offer to run DSIM & SFC (With copius warnings).

26. (Undecided) Add activity to autorepair VS.NET & VC++ libraries.

27. (Research) - Check if AMD & nvidia use registration entries for configuration. Could be useful for things like enabling full dynamic range, disabling scaling override, increasing shader cache, etc.