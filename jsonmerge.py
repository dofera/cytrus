#!/usr/bin/env python3

import sys
import json
from natsort import natsorted

def llist(o) -> list:
    return o if isinstance(o, list) else [o]

def merge(a, b) -> list:
    for k in natsorted(a.keys() | b.keys()):
        if k in a and k in b:
            if isinstance(a[k], dict) and isinstance(b[k], dict):
                a[k] = merge(a[k], b[k])
            elif a[k] != b[k]:
                a[k] = natsorted(set(llist(a[k])) | set(llist(b[k])))
        elif k in b:
            a[k] = b[k]
    return a

def main():
    with open(sys.argv[1]) as f:
        a = json.load(f)

    with open(sys.argv[2]) as f:
        b = json.load(f)

    print(json.dumps(merge(a, b)))

if __name__ == '__main__':
    main()
