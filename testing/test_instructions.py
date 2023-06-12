import unittest

class TestCPUProgram(unittest.TestCase):
    
    def test_do_instruction_1(self):
        input_instructions = 'Robot turn 270 degrees, move 3 blocks please'
        expected_output = 'turn, 270; mov, 3'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 1 completed.")
        
    def test_do_instruction_2(self):
        input_instructions = 'Robot turn 180 degrees please :'
        expected_output = 'turn, 180'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 2 completed.")
        
    def test_do_instruction_3(self):
        input_instructions = 'Robot turn 90 degrees  :'
        expected_output = 'Error'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 3 completed.")
        
    def test_do_instruction_4(self):
        input_instructions = 'Robot turn 360 degrees please:'
        expected_output = 'turn, 360'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 4 completed.")
        
    def test_do_instruction_5(self):
        input_instructions = 'Robot turn 70 degrees:'
        expected_output = 'Error'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 5 completed.")
        
    def test_do_instruction_6(self):
        input_instructions = 'Robot move 19 blocks please :'
        expected_output = 'Error'
        
        output_received = process_instructions(input_instructions)
        
        self.assertEqual(output_received, expected_output)
        print("Test 6 completed.")

def process_instructions(input_instructions):
    # Process the instructions
    tokens = input_instructions.split(',')
    output = []
    for token in tokens:
        instruction = token.strip()
        if instruction.startswith('Robot turn'):
            degrees = instruction.split('turn')[1].strip().split('degrees')[0].strip()
            output.append('turn, ' + degrees)
        elif instruction.startswith('move'):
            blocks = instruction.split('move')[1].strip().split('blocks')[0].strip()
            output.append('move, ' + blocks)
        else:
            output.append('Error')
    return '; '.join(output)

if __name__ == '__main__':
    unittest.main()