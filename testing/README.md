# CPU Program Test Cases

This repository contains a set of test cases for a CPU program. The program processes instructions given to a robot and returns the corresponding output.

## Installation

To run the test cases, make sure you have Python installed on your system. You can download Python from the official website: [Python Downloads](https://www.python.org/downloads/)

The test cases use the `unittest` module, which is included in the Python standard library. No additional installation is required.

## Running the Tests

To run the test cases, follow these steps:

1. Save the code provided in a file, for example, `test_cpu_program.py`.
2. Open a terminal or command prompt.
3. Navigate to the directory where you saved the file.
4. Run the command `python test_cpu_program.py`.

The test cases will be executed, and the output will be displayed in the terminal. Each test case will indicate whether it passed or failed.

## Test Cases

The following test cases are included in the code:

### Test 1: test_do_instruction_1

This test case checks if the `process_instructions` function correctly converts the input instructions "Robot turn 270 degrees, move 3 blocks please" into the expected output "turn, 270; move, 3".

### Test 2: test_do_instruction_2

This test case checks if the `process_instructions` function correctly converts the input instructions "Robot turn 180 degrees please :" into the expected output "turn, 180".

### Test 3: test_do_instruction_3

This test case checks if the `process_instructions` function correctly handles the input instructions "Robot turn 90 degrees  :" and returns the expected output "Error".

### Test 4: test_do_instruction_4

This test case checks if the `process_instructions` function correctly converts the input instructions "Robot turn 360 degrees please:" into the expected output "turn, 360".

### Test 5: test_do_instruction_5

This test case checks if the `process_instructions` function correctly handles the input instructions "Robot turn 70 degrees:" and returns the expected output "Error".

### Test 6: test_do_instruction_6

This test case checks if the `process_instructions` function correctly handles the input instructions "Robot move 19 blocks please :" and returns the expected output "Error".

## Implementation Details

The `process_instructions` function takes a string of instructions as input and processes them to generate the corresponding output. It splits the input string into tokens using the comma as a delimiter and then analyzes each token to determine the appropriate action.

- If a token starts with "Robot turn", the function extracts the degrees from the token and appends it to the output in the format "turn, degrees".
- If a token starts with "move", the function extracts the number of blocks from the token and appends it to the output in the format "move, blocks".
- If the token does not match any of the above patterns, the function appends "Error" to the output.

Finally, the function joins all the output elements with a semicolon and returns the resulting string.

## Conclusion

The provided code contains a set of test cases for the `process_instructions` function. By running these tests, you can verify if the function produces the expected output for different input scenarios. This helps ensure the correctness of the CPU program's instruction processing logic.
