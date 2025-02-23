import argparse

import transpiler


def convert_file(src_fn: str, dest_fn: str = None):
    with open(src_fn, "r") as f:
        src = f.read()

    if dest_fn is None:
        dest_fn = src_fn

    with open(dest_fn, "w") as f:
        f.write(transpiler.convert(src))


parser = argparse.ArgumentParser()
parser.add_argument("source", type=str)
parser.add_argument("-o", type=str, default=None)
args = parser.parse_args()

source = args.source
dest = args.o

convert_file(source, dest)
