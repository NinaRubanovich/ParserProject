# ParserProject
In this project, we are implementing a parser for a Python language using CFG with ANTLR.
# Expected Features for the Python Parser:
Deliverable #1

       -Arithmetic operators (+,-,*,/,%)
       -Assignment operators (=,+=,-=,*=,/=)
       
Deliverable #2

       -if/elif/else blocks
       -Conditional statements (<,<=,>,>=,==,!=,and,or,not)

Deliverable #3

       -while and for loops
       -Nested structures
       -Support for comments

Documentation
      
       -Report (Writing README.md on your GitHub repo., see “GitHub Repository Page section”)
       
# Team Members

        Allison Drainer
        Bina Gallagher
        Forrest Pritt
        Nina Rubanovich
# How to Use/Run the Parser
Install Python3 (https://www.python.org/downloads/)

Create a local folder and download PythonParser.g4 and Driver.py

Download the ANTLR complete JAR file from the ANTLR website (https://www.antlr.org/download/antlr-4.13.1-complete.jar) and store in your local folder

Create a Python virtual environment in your local folder by running "python3 -m venv ./venv" in a bash terminal

Activate your virtual environment by running "source /venv/bin/activate"

Install ANTLR by running "pip install antlr4-tools" and "pip install antlr4-python3-runtime"

Run the driver.py file to test your Python file by running "python driver.py <name of your .py file to parse>" OR "python3 driver.py <name of your .py file to parse>" depending on your Python version

Observe the Parse trees that are created by ANTLR for your Python expressions
