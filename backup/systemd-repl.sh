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

systemctl --user status borgmatic

systemctl --user status

systemctl --user list-timers --all

systemctl --user list-unit-files

systemctl --user list-units

journalctl --user

journalctl --user --unit borgmatic

journalctl --user-unit borgmatic

man systemd.time

man systemd.exec

systemctl --user stop borgmatic.timer

systemctl --user disable borgmatic.service

systemctl --user disable borgmatic.timer


systemctl get-default
# graphical.target                 

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
