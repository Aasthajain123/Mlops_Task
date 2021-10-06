#Easy game in python

import random
import time

Passwordlist = ['abc123', '1234', '123456', 'QWERT', 'ASFDJKL;', '0102', '0', '100', '1000', '10000', '123', '2048', '1024', 'JSON', '1234567890']

ans = input('Enter an account name: ')
time.sleep(1)

print('Finding the password for it...')
time.sleep(1)
print(random.choice(Passwordlist)+ ' is the password')
