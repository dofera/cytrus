#!/usr/bin/env python3

import sys
import json

def llist(o) -> list:
    return o if type(o) is list else [o]

def merge(a, b) -> list:
    s = sorted(set(a.keys()) | set(b.keys()))

    for k in s:
        if k in a and k in b:
            if type(a[k]) is dict and type(b[k]) is dict:
                a[k] = merge(a[k], b[k])
            else:
                if a[k] != b[k]:
                    a[k] = sorted(set(llist(a[k])) | (set(llist(b[k]))))
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
