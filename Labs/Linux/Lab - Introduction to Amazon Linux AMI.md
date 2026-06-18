**Task 1: Exercise - Explore the Linux man pages**

I will use a bash terminal to view the Linux standard help system. This system is generally referred to as the manual pages (or man pages).

To open the manual pages for the man program, enter the following command in the PuTTY terminal window, and press Enter:

```
man man
```
<img width="659" height="421" alt="image" src="https://github.com/user-attachments/assets/3a4fd7de-06b3-416f-ba4a-9c069e92b2a6" />

To identify the major sections of the man pages, look for the headers in the terminal (as the following figure shows).

Note: You can move in the man pages by pressing the up and down arrow keys.

The following are a few important man page headers. (This list is not all inclusive.):

- NAME
- SYNOPSIS
- DESCRIPTION
- OVERVIEW
- EXAMPLES
- FILES
- OPTIONS
- SEE ALSO

<img width="659" height="420" alt="image" src="https://github.com/user-attachments/assets/afbc8195-bb0c-4b1d-8cc2-b316645137ba" />

To exit the man pages, enter q

**Task 2: Run familiar commands**

Running a few commands to gain some general knowledge of the system and session that I am are using.

1. From the terminal, enter whoami. Press Enter to display your current username.
2. Enter hostname and press Enter to display the computer’s host name.
3. Enter uptime -p and press Enter to display the uptime of the system in an easily readable format.

   <img width="659" height="418" alt="image" src="https://github.com/user-attachments/assets/c89628b0-9dae-4284-bfad-26578a233ff3" />

4. From the terminal, enter who -H -a and press Enter to display information about the users who are logged in and some additional information.

<img width="661" height="133" alt="image" src="https://github.com/user-attachments/assets/92c6ae67-2e94-4fd4-a324-609a7fbb325d" />

5. Enter ```TZ=America/New_York date``` and press Enter. Then enter ```TZ=America/Los_Angeles date```
These commands identify the date and time of alternate locations in the world.

<img width="659" height="84" alt="image" src="https://github.com/user-attachments/assets/aee2ec61-c934-4559-8f18-2123d17114ae" />

6. Some professions use the Julian date to conduct business. The Julian format continues consecutively instead of restarting the date at 1 at the beginning of each month. For example, in the Gregorian calendar format, the day after January 31 is February 1. However, in the Julian format, the day after January 31 is February 32 instead of February 1. You can check this information by entering cal -j in the terminal to see the Julian dates for your current month.   

<img width="661" height="161" alt="image" src="https://github.com/user-attachments/assets/e8ddd336-367e-429d-b0f0-9ab7c4c8876d" />

7. Enter id ec2-user into the terminal, and press Enter to see your unique ID and group information about your specific user.

   <img width="717" height="86" alt="image" src="https://github.com/user-attachments/assets/f7641c2a-5f18-4c89-8fa1-b3653171e431" />

**Task 3: Improve workflow through history and search**
Attempt to ease the overall workload by reusing commands through search techniques, manual visualization of the bash history log, and reuse of the last command.

8. View the current bash history. Enter history and press ENTER. In the output, check if the commands that are shown are the commands that you used in task 2.

   <img width="717" height="419" alt="image" src="https://github.com/user-attachments/assets/80ba6bb1-5e02-48c6-969a-12bebe2e5125" />

9. To search your previous history, press CTRL+R to bring up a reverse history search. In the reverse history search feature of the terminal, enter TZ and press Tab. This step brings up an old use of the date command that you can edit. Using your arrow buttons, you can now edit the command inline.

<img width="716" height="233" alt="image" src="https://github.com/user-attachments/assets/e1960acb-c916-4284-ad55-547191eef949" />

10. Enter date into the terminal, and press Enter. Enter !! and press Enter. This step gives you the ability to to rerun the most recent command.

    <img width="716" height="135" alt="image" src="https://github.com/user-attachments/assets/4ab52893-4f0e-4c56-ae0d-fc99b59095b4" />
