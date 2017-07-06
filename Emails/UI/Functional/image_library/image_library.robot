*** Settings ***
Documentation   will check the input of each of the blns values into the image library screen
Resource        ../../Utils/email_keywords.robot
Resource        ../../Utils/image_library.robot
Default Tags    ui  email  image_library
Suite Setup     run keywords
...             login
...             AND  go to ${system_page["email"]}
Suite Teardown  close all browsers

*** Test Cases ***
create_new_folder
  open image library
  wait until keyword succeeds  5x  1 sec  click element  ${image_library["button_add"]["create_new_folder"]}
  input text  xpath=//input[contains(@class, 'create-folder-input')]  auto generated
  click element  xpath=//div[2]/span[contains(text(),'Create') or ./text() = 'Create']
  wait until element is visible  //*[(@class="name ng-binding" and ./text()='auto generated')]

#add_image_with_custom_name
#  open image library
#  upload file
#  input text  name=name  auto_file
#  click element  ${image_library["button_add"]["start_upload_button"]}

search_for_content
  open image library
  wait until element is visible  ${generics["search_input"]}
  input text  ${generics["search_input"]}  auto generated
  click element  ${generics["search_button"]}
  wait until element is visible  //*[(@class="name ng-binding" and ./text()='auto generated')]
