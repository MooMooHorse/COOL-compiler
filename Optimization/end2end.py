from typing import Literal
import os
import subprocess
from pathlib import Path
import re
import csv


def _get_program_paths(testing_dir: str):
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
    def save_to_csv(data, filename, fieldnames=None):
        """
        Save benchmark data to a CSV file.

        :param data: List of dictionaries containing benchmark data.
        :param filename: Name of the CSV file.
        """
        # if not fieldnames:
        #     fieldnames = [
        #         "Program",
        #         "Hoisted Loads", "Hoisted Stores", "Hoisted Computation",  # LICM
        #         "Instructions Removed", "Unreachable Blocks", "Constants Replaced"  # SCCP
        #     ]
        # else:
        #     fieldnames = fieldnames

        # initalize so all dicts have the same fields
        # for row in data:
        #     for field in fieldnames:
        #         row.setdefault(field, 0)

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

    @staticmethod
    def log_sccp(optimize_option: str, program_path: str):
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
            num_instructions_removed = 0
            num_blocks_unreachable = 0
            num_constants_replaced = 0

            # Process each line and update the statistics
            for line in output:
                # print(line)
                if match := re.search(r"Instructions removed:\s+(\d+)", line):
                    num_instructions_removed = int(match.group(1))
                elif match := re.search(r"Basic blocks made unreachable:\s+(\d+)", line):
                    num_blocks_unreachable = int(match.group(1))
                elif match := re.search(r"Instructions replaced with constants:\s+(\d+)", line):
                    num_constants_replaced = int(match.group(1))

            return num_instructions_removed, num_blocks_unreachable, num_constants_replaced


        except subprocess.CalledProcessError as e:
            print(f"Error running command: {e}")
            return None
        except AttributeError:
            print("Could not parse the output for LICM statistics.")
            return None

    @staticmethod
    def log_cse(optimize_option: str, program_path: str):
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
            num_removed = 0

            # Process each line and update the statistics
            for line in output:
                # print(line)
                if match := re.search(r"Instructions Removed:\s+(\d+)", line):
                    num_removed = int(match.group(1))

            return num_removed


        except subprocess.CalledProcessError as e:
            print(f"Error running command: {e}")
            return None
        except AttributeError:
            print("Could not parse the output for LICM statistics.")
            return None



class CorrectnessChecker:
    """
    Class to check the correctness of the programs.

    Each testing program can be run by:
        make <optimize-option> PROGRAM=<program-name> TEST_DIR="tests/correctness"

    This will generate a `result.ll` file in the current directory.

    If the source file is self-contained, then run:
        make run

    This will generate a result binary.

    Then we do:
        ./result
    and check the return value of the program.

    We store the return value in a variable and then run the un-optimized version of the program:

        make no-optimize PROGRAM=<program-name> TEST_DIR="tests/correctness"

    We then run `make run` and `./result` again, and compare the return values.
    If they match, the correctness is considered proven.
    """

    @staticmethod
    def check_correctness(optimize_option: str, program_path: str) -> bool:
        program_name = os.path.splitext(os.path.basename(program_path))[0]

        # Run the program with the given optimization option
        if not CorrectnessChecker._build_and_run(optimize_option, program_name):
            print(f"Failed to build or run the optimized version for {program_name} with {optimize_option}")
            return False
        
        # Get the return value from the optimized run
        optimized_return_value = CorrectnessChecker._get_return_value()

        # Now run the un-optimized version
        if not CorrectnessChecker._build_and_run("no-optimize", program_name):
            print(f"Failed to build or run the non-optimized version for {program_name}")
            return False
        
        # Get the return value from the non-optimized run
        non_optimized_return_value = CorrectnessChecker._get_return_value()

        # Compare both return values
        return optimized_return_value == non_optimized_return_value

    @staticmethod
    def _build_and_run(optimize_option: str, program_name: str) -> bool:
        # Build the program with the given optimization option
        build_cmd = ["make", optimize_option, f"PROGRAM={program_name}", "TEST_DIR=tests/correctness"]
        try:
            subprocess.run(build_cmd, capture_output=True, text=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Build failed with {optimize_option}: {e}")
            return False

        # Run 'make run' to produce and execute the result binary
        run_cmd = ["make", "run"]
        try:
            subprocess.run(run_cmd, capture_output=True, text=True, check=True)
        except subprocess.CalledProcessError as e:
            print(f"Failed to run the compiled program {program_name} with {optimize_option}: {e}")
            return False

        return True

    @staticmethod
    def _get_return_value() -> int:
        # Execute './result' and capture the return code
        exec_cmd = ["./result"]
        try:
            completed = subprocess.run(exec_cmd, capture_output=True, text=True)
            return completed.returncode
        except FileNotFoundError:
            print("Executable `./result` not found.")
            return -1
        except subprocess.CalledProcessError as e:
            print(f"Error executing `./result`: {e}")
            return -1


GREEN = "\033[92m"
RED = "\033[91m"
BLUE = "\033[94m"
RESET = "\033[0m"

def main(test_dir: str):
    optimize_options = ["optimize-real-licm", "optimize-real-sccp", "optimize-real-cse"]
    testing_dir = os.path.join(test_dir, "testing")
    correctness_dir = os.path.join(test_dir, "correctness")
    
    program_paths = _get_program_paths(correctness_dir)
    if not program_paths:
        print("No .c files found in the provided directory.")
        return

    checker = CorrectnessChecker()
    score = 0
    total_score = 0
    for optimize_option in optimize_options:
        for program in program_paths:
            print(f"Checking correctness for: {program}")
            if checker.check_correctness(optimize_option, program):
                print(f"{program} {optimize_option} : {GREEN}✓{RESET}")
                score += 1
            else:
                print(f"{program} {optimize_option} : {RED}✗{RESET}")
            total_score += 1

    # Get the list of programs
    program_paths = _get_program_paths(testing_dir)
    if not program_paths:
        print("No .c files found in the provided directory.")
        return
    # Instantiate BenchmarkRunner and log statistics
    runner = BenchmarkRunner()
    data = []

    final_statistics = {}
    for optimize_option in optimize_options:
        for program in program_paths:
            print(f"Running benchmark for: {program}")
            if optimize_option == "optimize-real-licm":
                stats = runner.log_licm(optimize_option, program)
                if stats:
                    print(f"LICM Statistics for {program}: Loads={stats[0]}, Stores={stats[1]}, Computation={stats[2]}")
                    data.append({
                        "Program": os.path.basename(program),
                        "Hoisted Loads": stats[0],
                        "Hoisted Stores": stats[1],
                        "Hoisted Computation": stats[2],
                    })
            elif optimize_option == "optimize-real-sccp":
                stats = runner.log_sccp(optimize_option, program)
                if stats:
                    print(f"SCCP Statistics for {program}: Removed={stats[0]}, Unreachable={stats[1]}, Constants={stats[2]}")
                    data.append({
                        "Program": os.path.basename(program),
                        "Instructions Removed": stats[0],
                        "Unreachable Blocks": stats[1],
                        "Constants Replaced": stats[2],
                    })
            elif optimize_option == "optimize-real-cse":
                stats = runner.log_cse(optimize_option, program)
                if stats:
                    print(f"CSE Statistics for {program}: Removed={stats}")
                    data.append({
                        "Program": os.path.basename(program),
                        "Instructions Removed": stats,
                    })
            else:
                continue
        if data:
            printer = DataPrinter()
            printer.save_to_csv(data, f"benchmark_{optimize_option[14:]}.csv")
            final_statistics[optimize_option] = data
        
        data = []
    
    print(f"Correctness score: {BLUE} {score}/{total_score} {BLUE}")

    print(f"the benchmark data are in the csv files: benchmark_licm.csv, benchmark_sccp.csv, benchmark_cse.csv in the current directory")

if __name__ == "__main__":
    """
        test directory is the directory consisting `benchmark` subdirectory and `testing` subdirectory
    """

    import sys

    if len(sys.argv) != 2:
        print("Usage: python benchmark_runner.py <test_dir>")
    else:
        main(sys.argv[1])
