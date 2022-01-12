# kadry-re
Decompiling the HR database system, consisting of several programs.

The binary locations of the sub-blocks on the 2148 disk image are:

- Zone 0540 - the main program (КАДРЫ)
- Zone 0545 - questionnaire input (АНКЕТА)
- Zone 0553 - service block (service.pas)
- Zone 0560 - help for the service block and a few commands (school.pas)
- Zone 0565 - report generator
- Zone 0572 - ???
- Zone 1225 - database editing tool

The overlay mechanism expects the zone locations to be different, zone numbers "XORed" with 01000, i. e. 1540, 1545, etc., and 0225.
