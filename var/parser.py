#!/usr/bin/env python3

import re

#file = open('listing.txt','r')

lines = [line.rstrip('\n') for line in open('aux/listing.txt')]

print(str(len(lines))+" anims found.")

# split anims from filenames
files = []
anims = []
for index in range(len(lines)):
	[file,anim]=lines[index].split()
	files.append(file)
	anims.append(anim)

# sort anims and files and make lowercase
for file in files:
	file = file.lower()
for anim in anims:
 	anim.lower()
files.sort()
anims.sort()

for i in range(len(lines)):
	if(anims[i] == anims[i-1]):
		print('duplicate '+files[i]+': ' +anims[i] + ' in ' + files[i-1])