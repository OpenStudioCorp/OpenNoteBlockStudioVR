import json
import argparse
import sys
import pynbs as nbs

# setup the argument parser
parser = argparse.ArgumentParser(description='Converts a nbs file to a json file')
parser.add_argument('file', metavar='file', type=str, nargs='+',
                    help='The nbs file to convert')
args = parser.parse_args()

# Read the nbs file
stuff = nbs.read(args.file[0])

# list the stuff out for the program to use
header = stuff.header
notes = stuff.notes
layers = stuff.layers
instruments = stuff.instruments

print(header)
print(notes)
print(layers)
print(instruments)

# Create a dictionary with the data
data = {
    "layers": layers,
    "notes": notes,
    "instruments": instruments
}

# Write the data to a JSON file
with open("output.json", 'w') as outfile:
    json.dump(data, outfile)
