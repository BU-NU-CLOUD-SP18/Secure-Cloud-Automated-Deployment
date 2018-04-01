These procedures will fix the problem and start the docker engine on kaizen.

1. delete the folder docker under /var/lib

2. go to cd /etc/sysconfig

3. vi docker (before editing copy docker docker.org)

4. see Line there you find OPTIONS='--selinux-disabled --log-driver=journald'

5. Remove --selinux-disabled should like OPTIONS='--log-driver=journald'

6. Now un-comment # setsebool -P docker_transition_unconfined 1 to setsebool -P docker_transition_unconfined 1

7. reboot the machine or you try only docker start to check for me it works :)


