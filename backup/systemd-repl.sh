# to get user logging:
# convert storage=auto to persistent in
# /etc/systemd/journald.conf
[Journal]
Storage=persistent

#
# systemd timer

# borgmatic example
wget https://projects.torsion.org/witten/borgmatic/raw/branch/master/sample/systemd/borgmatic.service

systemctl --user list-timers --no-pager --all


cd /home/abergman/projects/dotfiles/backup
systemctl --user enable `pwd`/borgmatic.timer
systemctl --user enable `pwd`/borgmatic.service

systemctl --user daemon-reload

systemd-analyze verify ~/.config/systemd/user/borgmatic.service

systemd-analyze verify ~/.config/systemd/user/borgmatic.timer

systemctl --user daemon-reload
systemctl --user start borgmatic.service

systemctl --user start borgmatic.timer

systemctl --user status borgmatic.timer
# || ● borgmatic.timer - Run borgmatic backup                          
# ||    Loaded: loaded (/home/abergman/projects/dotfiles/backup/borgmatic.timer; enabled; vendor preset: enabled)                         
# ||    Active: active (waiting) since Fri 2020-04-03 22:02:51 EDT; 12min ago                                                             
# || 
# || Apr 03 22:02:51 Gigabyte systemd[848]: Started Run borgmatic backup.                                                                 

systemctl --user status borgmatic
# || ● borgmatic.service - borgmatic backup                            
# ||    Loaded: loaded (/home/abergman/projects/dotfiles/backup/borgmatic.service; enabled; vendor preset: enabled)                       
# ||    Active: inactive (dead) since Tue 2020-03-31 18:07:57 EDT; 36min ago                                                              
# ||  Main PID: 2285 (code=exited, status=0/SUCCESS)                   
# || 
# || Mar 31 18:00:47 Gigabyte systemd[878]: Starting borgmatic backup...                                                                  
# || Mar 31 18:01:48 Gigabyte systemd-inhibit[2285]: Starting actions. 
# || Mar 31 18:07:57 Gigabyte systemd-inhibit[2285]: Completed actions.                                                                   
# || Mar 31 18:07:57 Gigabyte systemd[878]: Started borgmatic backup.  

systemctl --user status --no-pager

systemctl --user list-timers --all

systemctl --user list-unit-files


systemctl --user list-units

journalctl --user

journalctl --user --follow --unit borgmatic

journalctl --user --follow --unit borgmatic.timer

journalctl --user-unit borgmatic

man systemd.time

man systemd.exec

systemctl --user stop borgmatic.timer

systemctl --user disable borgmatic.service

systemctl --user disable borgmatic.timer


systemctl get-default
# graphical.target                 

systemctl --user get-default
# || default.target                   

systemctl --user list-unit-files --type=target
# || UNIT FILE                    STATE                                
# || basic.target                 static                               
# || bluetooth.target             static                               
# || busnames.target              static                               
# || default.target               static                               
# || exit.target                  static                               
# || graphical-session-pre.target static                               
# || graphical-session.target     static                               
# || paths.target                 static                               
# || printer.target               static                               
# || shutdown.target              static                               
# || smartcard.target             static                               
# || sockets.target               static                               
# || sound.target                 static                               
# || timers.target                static                               
# || 
# || 14 unit files listed.            

systemctl --user list-units --type target --all
# ||   UNIT                  LOAD      ACTIVE   SUB    DESCRIPTION                                                                        
# ||   basic.target          loaded    active   active Basic System                                                                       
# ||   default.target        loaded    active   active Default                                                                            
# || ● graphical.target      not-found inactive dead   graphical.target                                                                   
# || ● network-online.target not-found inactive dead   network-online.target                                                              
# ||   paths.target          loaded    active   active Paths                                                                              
# ||   shutdown.target       loaded    inactive dead   Shutdown                                                                           
# ||   sockets.target        loaded    active   active Sockets                                                                            
# ||   timers.target         loaded    active   active Timers                                                                             
# || 
# || LOAD   = Reflects whether the unit definition was properly loaded.                                                                   
# || ACTIVE = The high-level unit activation state, i.e. generalization of SUB.                                                           
# || SUB    = The low-level unit activation state, values depend on unit type.                                                            
# || 
# || 8 loaded units listed.           
# || To show all installed unit files use 'systemctl list-unit-files'. 
# || lines 1-16/16 (END)              

systemctl list-units --type target
# || UNIT                   LOAD   ACTIVE SUB    DESCRIPTION                                                                              
# || basic.target           loaded active active Basic System                                                                             
# || cryptsetup.target      loaded active active Encrypted Volumes                                                                        
# || getty.target           loaded active active Login Prompts                                                                            
# || graphical.target       loaded active active Graphical Interface                                                                      
# || local-fs-pre.target    loaded active active Local File Systems (Pre)                                                                 
# || local-fs.target        loaded active active Local File Systems                                                                       
# || multi-user.target      loaded active active Multi-User System                                                                        
# || network-online.target  loaded active active Network is Online                                                                        
# || network.target         loaded active active Network                                                                                  
# || nss-user-lookup.target loaded active active User and Group Name Lookups                                                              
# || paths.target           loaded active active Paths                                                                                    
# || remote-fs.target       loaded active active Remote File Systems                                                                      
# || slices.target          loaded active active Slices                                                                                   
# || sockets.target         loaded active active Sockets                                                                                  
# || sound.target           loaded active active Sound Card                                                                               
# || swap.target            loaded active active Swap                                                                                     
# || sysinit.target         loaded active active System Initialization                                                                    
# || time-sync.target       loaded active active System Time Synchronized                                                                 
# || timers.target          loaded active active Timers                                                                                   
# || 
# || LOAD   = Reflects whether the unit definition was properly loaded.                                                                   
# || ACTIVE = The high-level unit activation state, i.e. generalization of SUB.                                                           
# || SUB    = The low-level unit activation state, values depend on unit type.                                                            
# || 
# || 19 loaded units listed. Pass --all to see loaded but inactive units, too.                                                            
# || To show all installed unit files use 'systemctl list-unit-files'. 


du -sch /var/log/journal
# || 17M     /var/log/journal         
# || 17M     total                    

systemctl --user show-environment
# || DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus             
# || DERBY_HOME=/usr/lib/jvm/java-10-oracle/db                         
# || DESKTOP_SESSION=gnome            
# || DISPLAY=:0                       
# || GDMSESSION=gnome                 
# || GDM_LANG=en_US.utf8              
# || GNOME_DESKTOP_SESSION_ID=this-is-deprecated                       
# || GPG_AGENT_INFO=/run/user/1000/gnupg/S.gpg-agent:0:1               
# || GTK_MODULES=gail:atk-bridge      
# || HOME=/home/abergman              
# || J2REDIR=/usr/lib/jvm/java-10-oracle                               
# || J2SDKDIR=/usr/lib/jvm/java-10-oracle                              
# || JAVA_HOME=/usr/lib/jvm/java-10-oracle                             
# || JOURNAL_STREAM=8:19742           
# || LANG=en_US.utf8                  
# || LOGNAME=abergman                 
# || PATH=/home/abergman/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/lib/jvm/java-10-oracle/bin:/usr/lib/jvm/
# || PWD=/home/abergman               
# || QT_ACCESSIBILITY=1               
# || QT_LINUX_ACCESSIBILITY_ALWAYS_ON=1                                
# || QT_QPA_PLATFORMTHEME=qgnomeplatform                               
# || SESSION_MANAGER=local/Gigabyte:@/tmp/.ICE-unix/928,unix/Gigabyte:/tmp/.ICE-unix/928                                                  
# || SHELL=/bin/bash                  
# || SSH_AGENT_PID=991                
# || SSH_AUTH_SOCK=/run/user/1000/keyring/ssh                          
# || USER=abergman                    
# || USERNAME=abergman                
# || WINDOWPATH=1                     
# || XAUTHORITY=/run/user/1000/gdm/Xauthority                          
# || XDG_CURRENT_DESKTOP=GNOME        
# || XDG_DATA_DIRS=/usr/share/gnome:/usr/local/share/:/usr/share/      
# || XDG_MENU_PREFIX=gnome-           
# || XDG_RUNTIME_DIR=/run/user/1000   
# || XDG_SEAT=seat0                   
# || XDG_SESSION_DESKTOP=gnome        
# || XDG_SESSION_ID=1                 
# || XDG_SESSION_TYPE=x11             
# || XDG_VTNR=1                       


#
# borgmatic-weekly
cd /home/abergman/projects/dotfiles/backup
systemctl --user enable `pwd`/borgmatic-weekly.timer
systemctl --user enable `pwd`/borgmatic-weekly.service
systemctl --user daemon-reload
systemd-analyze verify borgmatic-weekly.service
systemd-analyze verify borgmatic-weekly.timer
systemctl --user start borgmatic-weekly.timer
systemctl --user status borgmatic-weekly.timer
systemctl --user status borgmatic-weekly
journalctl --user --follow --unit borgmatic-weekly
journalctl --user --follow --unit borgmatic-weekly.timer

#
# echo timer/service

cd /home/abergman/projects/dotfiles/backup
systemctl --user enable `pwd`/echo.timer
systemctl --user enable `pwd`/echo.service

systemd-analyze verify echo.timer
systemd-analyze verify echo.service

systemctl --user list-timers --no-pager --all

systemctl --user start echo.timer

systemctl --user status --no-pager echo.timer

journalctl --user --unit echo.timer

journalctl --user --unit echo

systemctl --user stop echo.timer

systemctl --user disable echo.timer
systemctl --user disable echo.service

#
# run
systemd-run --user --timer-property=AccuracySec=1ms --on-calendar='*:*:*/3' /home/abergman/.local/bin/hello-world.sh


# current boot
sudo journalctl --boot --pager-end

# previous boot
sudo journalctl --boot=-1  --pager-end

# show only critical errors
sudo journalctl -b -1 -p "emerg".."crit"                                                             
