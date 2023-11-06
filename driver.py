import subprocess
import sys


# Check if the correct number of command line arguments is provided
if len(sys.argv) != 2:
    print("Usage: python [file_name] [input_file]")
    sys.exit(1)

# Define the command and its arguments
command = "antlr4-parse"
grammar_file = "PythonParser.g4"
start_rule = "start"
input_file = sys.argv[1]  # Get input file from command line argument

# Construct the full command
full_command = [command, grammar_file, start_rule, "-gui", "--input", input_file]

# Run the command using subprocess
try:
    subprocess.run(full_command, check=True)
except subprocess.CalledProcessError as e:
    print(f"Command failed with error code {e.returncode}")
except FileNotFoundError:
    print(f"Command not found: {command}")

