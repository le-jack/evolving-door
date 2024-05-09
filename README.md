# evolving-door:
Continuously evolving project

# Current Features:
-   Python/Bash
-   Self Replication
-   Prioritizes: /etc > /var > /home > /var/tmp > /tmp
-   Randomized Name from a list of 3 currently
-   Appends 4 character string to the end of the file to alter the hash
-   Only works with sudo
-   Can check for another copy of itself
-   Spawns a script that spawns a script
-   Randomized append value to change the hash
-   Reverse shell
-   Spawns the other implant after 30 seconds
-   If the other implant is missing it will replicate another one

# Current Plans:
- While running:
- while not running check on running (?) 

# Future Plans:
- Week 2
    - Windows variant
        - Powershell
     
- Week 3
    - Network awareness
        - Sends arp tables 
        - Checks all interfaces
        - Finds all hosts within the subnet

- Week 4
    - Create a master dropper that remembers where all the implants are and on which hosts
    - More names closer to default applications within Linux/Windows
    - Redundancy for the master dropper
      - The ability for a spreader to become the master dropper (?) 

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
