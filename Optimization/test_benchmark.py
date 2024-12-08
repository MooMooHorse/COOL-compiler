from typing import Literal
import os
import subprocess
from pathlib import Path
import re
import csv


def _get_program_names(testing_dir: str):
    """
    Get a list of all .c files in the specified testing directory.

    :param testing_dir: Directory containing the .c files.
    :return: List of .c file names (with full paths).
    """
    return [str(file) for file in Path(testing_dir).glob("*.c")]


class DataPrinter:
    """
    Class to visualize and store benchmark data.
    """

    @staticmethod
    def save_to_csv(data, filename):
        """
        Save benchmark data to a CSV file.

        :param data: List of dictionaries containing benchmark data.
        :param filename: Name of the CSV file.
        """
        keys = data[0].keys()
        with open(filename, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=keys)
            writer.writeheader()
            writer.writerows(data)
        print(f"Data saved to {filename}")



class BenchmarkRunner:
    """
    Class to run benchmarks.

    Each benchmark can be run by:
        make <optimize-option> PROGRAM=<benchmark-path>

    This will generate a `result.ll` file in the current directory.

    If the source file is self-contained, then run:
        make run

    Otherwise, log the dumped statistics.

    The binary (`result`) will be executed to produce an `output.txt`
    under the current directory.

    The files `result.ll`, `result`, and `output.txt` are temporary
    and don't need to be retained.
    """

    @staticmethod
    def log_licm(optimize_option: str, program_path: str):
        """
        Fetch the trace dumped by the benchmark program for LICM statistics.

        :param optimize_option: The optimization option to use.
        :param program_name: Path to the benchmark program.
        :return: A tuple of (NumHoistedLoads, NumHoistedStore, NumCompHoisted).
        """
        program_name = os.path.splitext(os.path.basename(program_path))[0]
        # Build the make command
        cmd = ["make", optimize_option, f"PROGRAM={program_name}"]
        try:
            # Run the command
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            
            output = result.stderr.splitlines()
            
            # Variables to store the last occurrence of each statistic
            num_hoisted_loads = 0
            num_hoisted_stores = 0
            num_comp_hoisted = 0

            # Process each line and update the statistics
            for line in output:
                # print(line)
                if match := re.search(r"Hoisted loads:\s+(\d+)", line):
                    num_hoisted_loads = int(match.group(1))
                elif match := re.search(r"Hoisted stores:\s+(\d+)", line):
                    num_hoisted_stores = int(match.group(1))
                elif match := re.search(r"Hoisted computational instructions:\s+(\d+)", line):
                    num_comp_hoisted = int(match.group(1))

            return num_hoisted_loads, num_hoisted_stores, num_comp_hoisted


        except subprocess.CalledProcessError as e:
            print(f"Error running command: {e}")
            return None
        except AttributeError:
            print("Could not parse the output for LICM statistics.")
            return None


def main(test_dir: str):
    optimize_option = "optimize-real-licm"
    testing_dir = os.path.join(test_dir, "testing")
    
    # Get the list of programs
    program_names = _get_program_names(testing_dir)
    if not program_names:
        print("No .c files found in the provided directory.")
        return

    # Instantiate BenchmarkRunner and log statistics
    runner = BenchmarkRunner()
    data = []
    for program in program_names:
        print(f"Running benchmark for: {program}")
        stats = runner.log_licm(optimize_option, program)
        if stats:
            print(f"LICM Statistics for {program}: Loads={stats[0]}, Stores={stats[1]}, Computation={stats[2]}")
            if optimize_option == "optimize-real-licm":
                data.append({
                    "Program": os.path.basename(program),
                    "Hoisted Loads": stats[0],
                    "Hoisted Stores": stats[1],
                    "Hoisted Computation": stats[2],
                })
        else:
            print(f"Failed to fetch LICM statistics for {program}.")
    if data:
        printer = DataPrinter()
        printer.save_to_csv(data, "benchmark_results.csv")


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Usage: python benchmark_runner.py <test_dir>")
    else:
        main(sys.argv[1])
