#!/usr/bin/env python3

# convert.py
# Russell Bjella
# Rev. 1.0
# Procedure takes a number and a string identifying the unit of the number
# and converts to imperial if the given unit is metric and vice versa.
# 
# Revision history
# 1.0	2016/09/03	Initial revision
#
# USAGE
# % ./convert.py
#
# NOTES
# LIST OF SUPPORTED CONVERSIONS
#	METRIC TO ENGLISH
#	km -> mi
#	km -> ft
# 	m -> ft
# 	m -> mi
#	ENGLISH TO METRIC
#	mi -> km
# 	mi -> m
#	ft -> m
# 	ft -> km

import sys
import math

# Analyze inputs
if (len(sys.argv) < 3 or len(sys.argv) > 4):
	print("\n\tERROR: expected two or three input arguments.")
	print("\tUSAGE: ./convert.py 5.0 'km' 'ft'\n")
	quit()
scalar = sys.argv[1]
unit = sys.argv[2]
if (len(sys.argv) == 4):
	con = sys.argv[3]
# Create dict of default conversions and determine conversions if 3 inputs given
else:
	defaults = {'m':'ft','km':'mi','kg':'slug','n':'lb','s':'dy'}
	if (unit not in defaults.keys() and unit not in (defaults.values())):
		print('\n\tERROR: no set default conversion for given unit. Please provide a conversion.\n')
		quit()
	elif(unit in defaults.keys()):
		con = defaults[unit]
	elif(unit in defaults.(values)):
		for key in defaults.keys():
			if (unit == defaults[key]):
				con = key


# Create dicts of conversion multipliers
m_dict = {'km':0.001,'mi':0.000621371,'ft':3.28084}
kg_dict = {'g':1000,'slug':0.0685218,'lbm':2.20462}
s_dict = {'min':1/60,'hr':1/3600,'dy':1/86400,'yr':1/(86400*365.25)}
n_dict = {'lb':0.224809}
rps_dict = {'dps':180/math.pi,'rpm':0.5/math.pi}

# Create dict of metric base units and their conversion dictionary
base_units = {'m':m_dict,'kg':0,'s':0,'n':0,'j':0,'w':0}
print(base_units['m']['km'])