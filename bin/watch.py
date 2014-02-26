#!/bin/env python

if __name__ == '__main__':
	import httplib, sys
	arg = sys.argv
	h1 = httplib.HTTPConnection(arg[1], arg[2])
	h1.request('GET', '/')
	sys.exit(0)
