# README #

Getting up and running with UI tests using [Robot Framework](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

## What is this repository for? ##
UI and API automation for The Message Cloud.

## How do I get set up? ##
Robot Framework is based on Python; we build on Python 2.7.x. To run Robot Framework, make sure you have Python, Git and the Google driver installed. Python [can be downloaded and installed](https://www.python.org/downloads/) on Linux, Windows, and Mac OSX.
Once Python is installed you will need to add the Python27 and Python27/Scripts directories to the system PATH variable. This can be done with cmd.exe but is safer performed through the GUI. In the Windows GUI, go to Windows start icon and search for 
"Edit the system environment variables". Select "Environmental variables" and under "System variables", open the Path option and add the Python folders mentioned above. To this path, you will also have to add C:\Program Files\Git\cmd and C:\Program\Files (x86)\Google
(if these are the folders where you have installed Git and the Google driver).
```
$ SETX /M PATH "%PATH%;C:\Python27;C:\Python27\Scripts"
```
Also download and install Pycharm. Once installed, go to bitbucket (https://bitbucket.org/), click on the square bitbucket icon at the top left, go to repositories, go to SmartFocus-TMC-Automate (if you do not see these repositories,
ask the repository admin to grant you access to it) and take the repository URL (it will be something like: https://{your bit bucket user name}@bitbucket.org/smartfocus1/smartfocus-tmc-automation.git). When you open Pycharm,
select "Check out from version control" > Git, and in the Git repository URL, enter the repository URL you copied from bitbucket. Test the connection, and if the connection is successful, clone the repository.


You'll also need to install "pip" (Python bash) to get things running, for this, go to www.pip-installer.org/en/latest/. Go to "instalation", right click get-pip.py and select to link as on desktop. Then open your command line and enter:

C:\Users\{your.user}\Desktop>python get-pip.py

Then you'll have to install the requirements, for which you will have to go to the root directory of the project. This directory can vary depending on the default directory you selected when you installed Pycharm. If you chose the default
directory, it will be something like: C:\Users\{your.user}\PycharmProjects\smartfocus-tmc-automation>. Once you are in this folder, you can fun the following command to download the module dependencies which can be found at the root of the project:

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
$ pybot Emails\UI\Smoke\smoke_test.robot
```
Tests are tagged for ease of running and can be run on tags using the -i flag.
```
$ pybot -i apiORuiANDsmokeNOTxss Emails
```
Tests run on an environment based upon the definition of the ${env} variable found in the root Utils/ directory, but you can change it and any other variable from the cli with the -v flag.
```
$ pybot -i apiORuiANDsmokeNOTxss -v env:qa -v browser:chrome Emails
```

## Contribution guidelines ##
* Writing tests /TODO
* Code review /TODO
* Other guidelines /TODO

## Who do I talk to? ##
Owners: Ramiro (ramiro.blanco@smartfocus.com)s: Ramiro (ramiro.blanco@smartfocus.com)