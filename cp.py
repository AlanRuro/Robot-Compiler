import csv
import numpy as np
import matplotlib.pyplot as plt

map_field = np.zeros(shape=(10, 10))
direction = 0
row = 0
column = 0
movement = {
    0: (0, 1),
    90: (-1, 0),
    180: (0, -1),
    270: (1, 0)
}

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
    map_field[row][column] = 3

def do_instruction(inst):
    verb, number = inst
    number = int(number)
    if verb == 'turn':
        change_direction(number)
    elif verb == 'mov':
        change_position(number)

def read_file():
    inst_list = []
    with open('instructions.asm') as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        for row in csv_reader:
            inst_list.append(row)
    return inst_list

def visualize_map():
    plt.imshow(map_field, cmap='viridis', origin='lower')
    plt.colorbar(ticks=[0, 1, 3], values=[0, 0.5, 3], label='Value')
    plt.title('Robot Path')
    plt.show()

def main():
    inst_list = read_file()
    for inst in inst_list:
        do_instruction(inst)
    visualize_map()

if __name__ == "__main__":
    main()
