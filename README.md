![descarga](https://github.com/AlanRuro/Robot-Compiler/assets/66846209/23f2cebd-87bf-49c5-8f2d-aa454aa624ca)

<h1 align="center">Robot Compiler</h1>

<h4 align="center">
  Created by:
</h4>

<p align="center">
  Diego Partida Romero - A01641113<br>
  Carlos Alberto Veryan Peña - A01641147<br>
  Alan Antonio Ruelas Robles - A01641426
</p>

<h3 align="center">Students of Tecnológico de Monterrey Campus GDA</h3>

<h4 align="center">Implementation of Computational Methods (Gpo 601) - TC2037.601</h4>

<h4 align="center">June 11, 2023</h4>

---

## Table of Contents

- [About](#about)
- [Folders](#folders)
- [Installation](#installation)
- [Usage](#usage)

---

## About

Industry 4.0 encompasses intelligent manufacturing and the emergence of smart factories, which have recently extended their influence to the mechanical industry. This expansion is driven by the rapid advancement of technology and the growing demand for high-quality products with increased efficiency. Consequently, the role of robots has become crucial, highlighting the significance of robot programming languages. To address this challenge, the development and implementation of a robust robot language compiler are necessary.

---

## Folders

The repository contains the following folders:

- **compiler**: This folder includes the source code and utilities for the robot compiler.
- **cpu**: The cpu folder contains the implementation of the robot's central processing unit.
- **testing**: The testing folder includes test cases and scripts to ensure the accuracy and reliability of the robot compiler.

---

## Installation

To install the Robot Compiler, please follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/robot-compiler.git`
2. Navigate to the project directory: `cd robot-compiler`
3. Navigate to the src directory: `cd cpu/src`
4. Install the dependencies: `pip3 install numpy csv subprocess`

---

## Usage

To compile and run a robot program, follow these steps:

1. Insert the desired intructions for the robot in the `cpu/src/instructions.txt` file, or leave them as they are.
2. Navigate to the compiler directory: `cd compiler`
2. Remove the current C files for the executable and the executable itself: `make clean`
3. Remake the C files for the executable and the executable itself: `make all`
4. Navigate to the src directory: `cd ../cpu/src`
5. Run the python file: `python3 cpu.py`

---
