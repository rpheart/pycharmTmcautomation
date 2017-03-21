import subprocess

packages = [
    "numpy", "paramiko", "requests", "robotframework", "robotframework-lint", "robotframework-requests",
    "robotframework-selenium2library", "selenium"
]

for package in packages:
    subprocess.call("pip install --upgrade %s" % package)
