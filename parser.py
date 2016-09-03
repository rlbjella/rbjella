#!/usr/bin/env python3

import re

#file = open('listing.txt','r')

lines = [line.rstrip('\n') for line in open('aux/listing.txt')]

print(str(len(lines))+" animations found.")

files = []
anims = []
for l in lines:
	file,anim = l.split(":")
	files.extend(file)
	anims.extend(anim)
	print(file)
	print(anim)

print(str(len(files)))
print(str(len(anims)))
