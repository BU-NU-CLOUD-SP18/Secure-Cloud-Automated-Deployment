These procedures will fix the problem and start the docker engine on kaizen.

RUN AS ROOT !!!

delete the folder docker under /var/lib
```
rm -rf /var/lib/docker
```


Then go to ```/etc/sysconfig``` copy ```docker``` to ```docker.org```
```
cp /etc/sysconfig/docker /etc/sysconfig/docker.org
```


Change line ```OPTIONS='--selinux-disabled --log-driver=journald'``` to ```OPTIONS='--log-driver=journald'```
```
sed 's/OPTIONS='--selinux-disabled --log-driver=journald'/OPTIONS='--log-driver=journald'/' /etc/sysconfig/docker
```


Then un-comment # setsebool -P docker_transition_unconfined 1 to setsebool -P docker_transition_unconfined 1
```
sed 's/# setsebool -P docker_transition_unconfined 1/ setsebool -P docker_transition_unconfined 1/' /etc/sysconfig/docker
```


reboot the machine or you try only docker start to check for me it works :)
```
reboot
```

