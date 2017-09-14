# README #

Getting up and running with UI tests using [Robot Framework](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

## What is this repository for? ##
UI and API automation for The Message Cloud.

## How do I get set up? ##
Robot Framework is based on Python; we build on Python 2.7.x. To run Robot Framework, make sure you have Python installed. Python [can be downloaded and installed](https://www.python.org/downloads/) on Linux, Windows, and Mac OSX.
Once Python is installed you will need to add the Python27 and Python27/Scripts directories to the system PATH variable. This can be done with cmd.exe but is safer performed through the GUI.
```
$ SETX /M PATH "%PATH%;C:\Python27;C:\Python27\Scripts"
```
Once you have python you will need to download the module dependencies which can be found at the root of the project.
```
$ pip install -r requirements.txt
```
UI automation requires the use of a browser driver; each browser provides their own driver and can be found through google. These can't be checked into git as they can get quite large and we don't use git LFS (ideally we should to version control them AND our browsers). These drivers should be placed into a directory that exists on the system PATH.
* [chrome driver](https://sites.google.com/a/chromium.org/chromedriver/)
* [opera driver](https://github.com/operasoftware/operachromiumdriver/releases)
* [firefox driver](https://github.com/mozilla/geckodriver/releases)
* [ie driver](http://www.seleniumhq.org/download/)
* [edge driver](https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/)

### WTF is Pycharm? ###
Pycharm is a Python IDE that makes writing and running python code easier. Pycharm [can be downloaded and installed](https://www.jetbrains.com/pycharm/download/) on Linux, Windows, and Mac OSX. There is a settings.jar in the root directory of this project that can be used to import configurations that are useful for working on this project. For instance they include a right click menu "External Tools > pybotSuite" that can be used to run the Robot Framework tests without needing to use the cli.

### Running tests ###
You run tests by invoking [pybot](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases) and calling the source file you wish to run.
```
$ pybot Emails\UI\Smoke\C01_Email_Smoke_Test.robot
```
Tests are tagged for ease of running and can be run on tags using the -i flag.
```
$ pybot -i apiANDsmokeNOTxss Emails
```
Tests run on an environment based upon the definition of the ${env} variable found in the root Utils/ directory, but you can change it and any other variable from the cli with the -v flag.
```
$ pybot -i apiANDsmokeNOTxss -v env:qa -v browser:chrome Emails
```

## Contribution guidelines ##
* Writing tests /TODO
* Code review /TODO
* Other guidelines /TODO

## Who do I talk to? ##
Owners: Ramiro (ramiro.blanco@smartfocus.com)