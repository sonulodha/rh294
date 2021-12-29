#!/bin/bash
# help
# ansible-doc -l |grep yum
# ansible-doc yum_repository
# ansible-doc rpm_key

ansible all -m yum_repository -a 'file=external_repo name=baseos description="Base OS Repo" baseurl=http://classroom.example.com/content/rhel8.0/x86_64/dvd/BaseOS/ gpgcheck=yes gpgkey=http://classroom.example.com/content/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release enabled=yes state=present' -b
ansible all -m rpm_key -a 'key=http://classroom.example.com/content/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release  state=present' -b
ansible all -m yum_repository -a 'file=external_repo name=appstream description="AppStream Repo" baseurl=http://classroom.example.com/content/rhel8.0/x86_64/dvd/AppStream/ gpgcheck=yes gpgkey=http://classroom.example.com/content/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release enabled=yes state=present' -b
ansible all -m rpm_key -a 'key=http://classroom.example.com/content/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release  state=present' -b

# chmod +x yum-pack.sh
# ./yum-pack.sh