# evolving-door:
Continuously evolving project

# Current Features:
-   Python/Bash
-   Self Replication
-   Prioritizes: /etc > /var > /home > /var/tmp > /tmp
-   Randomized Name from a list of 3 currently
-   Appends "ffff" to the end of the file to alter the md5sum

# Current Week Plans:
- Randomize the appended value
- Checks for another copy of itself and stops
- 

# Future Plans:
- Week 2
    - Dropper OS awareness
    - Windows variant
        - Powershell
     
- Week 3
    - Network awareness
        - Checks all interfaces
        - Finds all hosts within the subnet

- Week 4
    - Create a dropper
    - More names closer to default applications within Linux/Windows

- TBD
    - Remote replication via SMB or HTTP/HTTPS
    - Ability to mutate hash
    - In memory (?)
    - Automatically selects a C2 host on the network
  
  
  
# Tentative Idea for Evolving Door:
- Two Variants
    - Dropper
    - Spreader
    
- Both variants
    - Will replicate locally
    - Second replicant will check on the primary replicant to ensure that it is active

- Dropper will become a C2
    - Either ELF/EXE
    - Hosts spreader scripts
    - Keeps track of the secondary variants on the network

- Spreaders will look for uninfected boxes and report to C2
    - In memory with a back up
    - Neighbor boxes will heartbeat and activate the back up if the script in memory is off
    - Spreaders will continuously replicate until all boxes that within the network are infected
    - If spreaded remotely, spreaders will change its name twice
    - Family Tree kind of idea to track the movement of Evolving door using a flagging system
    - Point back to the original dropper
