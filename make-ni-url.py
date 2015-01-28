#!/usr/bin/env python

from sys import argv
import hashlib
from base64 import urlsafe_b64encode
from mimetypes import guess_type
from os.path import basename

def get_mimetype(filename):
    mt = guess_type(filename)[0]
    if mt:
        return mt
    else:
        return "application/javascript"

def makehash(filename):
    try:
        handle = file(filename, "r")
        sum = hashlib.sha256()
        # big files are probably unlikely, we'll be nice to memory still.
        reading = True
        while reading:            
            chunk = handle.read(1024) # arbitrary size
            sum.update(chunk)
            if chunk == '':
                reading = False
        digest = urlsafe_b64encode(sum.digest())
        uri = "ni:///sha256;" + digest + "?ct=" + get_mimetype(fname)
        print "{}\t{}".format(filename, uri)
    except IOError: # file doesnt exist?
        print "Skipping {}. File unreadable (e.g., does not exist or missing permissions)".format(filename)
    


if __name__ == "__main__":
    if len(argv) > 1:
        for fname in argv[1:]:
            makehash(fname)
    else:
        mn = basename(argv[0])
        print """Usage: {} files\n\n\tComputes the sha256 digest of the given file names and prints them in a ni URL.\n\tE.g., ``{} foo'' should print:\n\tfoo\tni:///sha256;SFg..cF9?ct=text/plain\n""".format(mn, mn)


