"""@package docstring
Documentation for CPU module.
More details.
"""

import csv
import numpy
import subprocess

map_field = numpy.zeros(shape=(10,10))
direction = 0
row = 0
column = 0
movement = {
    0: (0, 1),
    90: (-1, 0),
    180: (0, -1),
    270: (1, 0)
}

def print_trace(number_of_blocks):
    global map_field
    for i in range(1, number_of_blocks + 1):
        pass
    map_field[row][column] = 'X'

def change_direction(degrees):
    global direction
    direction = (direction + degrees) % 360

def change_position(number_of_blocks):
    global row, column
    num_of_blocks_in_x, num_of_blocks_in_y = movement[direction]
    for i in range(number_of_blocks):
        map_field[row][column] = 1
        row += num_of_blocks_in_x
        column += num_of_blocks_in_y
    map_field[row][column] = 4
    print(map_field)

def do_instruction(inst):
    verb, number = inst
    number = int(number)
    print(inst)
    if verb == 'turn':
        change_direction(number)
    elif verb == 'mov':
        change_position(number)

def read_file():
    inst_list = []
    with open('./cpu/src/instructions.asm') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            inst_list.append(row)
    return inst_list

def generate_file():
    command = "./compiler instructions.txt"
    result = subprocess.run(command, shell=True)
    if result.returncode != 0:
        print("Command execution failed!")

def main():
    generate_file()
    inst_list = read_file()
    for inst in inst_list:
        do_instruction(inst)

if __name__ == "__main__":
    main()