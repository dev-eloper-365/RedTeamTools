import os
import subprocess
from os import system, name
import sys

ask_path = raw_input("Enter Path : ")
subprocess.call(['wine', '/root/.wine/drive_c/Python27/Scripts/pyarmor.exe', 'pack', '-e', '--onefile --noconsole', ask_path])
print("\nDone !")

