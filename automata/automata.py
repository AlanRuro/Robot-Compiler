import os
import graphviz

def plot(val):
    script_dir = os.path.dirname(os.path.abspath(__file__)) 
    file_path = os.path.join(script_dir, 'automata.gv')
    g = graphviz.Digraph('G', filename=file_path)
    # Initial state
    g.attr('node', color='blue')
    g.node('S0')

    # g.attr('node', shape='square', color = 'black')
    # g.node('S4\n\n(current degrees + \ndegrees recieved) % 360')

    g.attr('node', shape='doublecircle', color = 'black')
    g.node('S9')

    g.attr('node', shape='circle', color = 'black')
    for pair in val:
        g.edge(str(pair[0]), str(pair[1]), label=pair[2])
    g.view()

def main():
    # Automata
    # Diego Partida Romero A01641113
    # Carlos Alberto Veryan Peña A01641147
    # Alan Antonio Ruelas Robles 

    automata = [
        ('S0', 'S1', 'MOV'),
        ('S1', 'S2', '0-9'),
        ('S2', 'S9', 'ε'),

        ('S0', 'S3', 'TURN'),
        ('S3', 'S4', 'dr (90, 180, 270, 360)'),
        ('S4', 'S5', 'cd (0)'),
        ('S4', 'S6', 'cd (90)'),
        ('S4', 'S7', 'cd (180)'),
        ('S4', 'S8', 'cd (270)'),

        ('S5', 'S9', 'ε'),
        ('S6', 'S9', 'ε'),
        ('S7', 'S9', 'ε'),
        ('S8', 'S9', 'ε'),

        ('S9', 'S0', 'ε'),

    ]

    plot(automata)

    print("- - - - - - - - - - - - - - - - - - - - - - ")
    print("Automata created successfully")

if __name__ == "__main__":
    main()
