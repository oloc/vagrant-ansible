# vagrant-ansible
How to use Vagrant and Ansible

## Usage

Start all the machines:

    $ vagrant up

Show all the machines:

    $ vagrant status
    IP:           Ports:   Host:
    192.168.10.10 22=>2210 kiwi.oloc
    192.168.10.11 22=>2211 koala-01.oloc
    192.168.10.12 22=>2212 koala-02.oloc
    
    Current machine states:
    
    kiwi     running (virtualbox)
    koala-01 running (virtualbox)
    koala-02 running (virtualbox)


## Network ready

    $ vagrant up
    $ vagrant ssh kiwi
    vagrant@kiwi:~$ cat /etc/hosts
    127.0.0.1 kiwi.oloc kiwi
    127.0.0.1 localhost
    127.0.1.1 jessie.raw jessie
    192.168.10.10 kiwi.oloc kiwi
    192.168.10.11 koala-01.oloc koala-01
    192.168.10.12 koala-02.oloc koala-02

