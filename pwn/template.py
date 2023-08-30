#!/bin/python

from pwn import *

target_remote = ('127.0.0.1', 1234)
target_bin = './bin'

def x():
    if args['REMOTE']:
        io = remote(target_remote[0], target_remote[1])
    else:
        io = process(target_bin)

    log.info("Example Exploit!")

    gdb.attach(io)
    
    io.interactive()



# Boilerplate
context.terminal = ["zellij", "action", "new-pane", "-f", '--']

if __name__ == '__main__':
    x()

