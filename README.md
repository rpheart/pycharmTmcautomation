# README #

Getting up and running with UI tests using [Robot Framework](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)

### What is this repository for? ###

* UI and API automation for The Message Cloud

### How do I get set up? ###

1. runs on [Python 2.7.x](https://www.python.org/downloads/)
2. the requirements.txt lists all of the packages needed to run any test
    ```
    $ pip install -r requirements.txt
    ```
3. you run tests by invoking [pybot](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases) and calling the source file you wish to run

    ```
    $ pybot Emails\UI\Smoke\C01_Email_Smoke_Test.robot
    ```

### Contribution guidelines ###

TODO:
* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Owners: Patrick (patrick.summers@smartfocus.com)