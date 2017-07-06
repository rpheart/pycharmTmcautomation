*** Settings ***
Documentation  keywords specific to the image library pages

*** Keywords ***
open image library
  go to ${image_library["menu"]}
  wait until element is visible  ${navigation_bar}
  select frame  ${iframes["top"]}
  select frame  ${iframes["ccmd"]}

upload file
  sleep  1
  wait until keyword succeeds  5x  1 sec  click element  ${image_library["button_add"]["add_button"]}
  select frame  ${iframes["image_library_add_iframe"]}
  ${file_path}=  catenate  SEPARATOR=  ${EXECDIR}  \\Emails\\UI\\Utils\\Resources\\puffin.jpg
  click element  ${image_library["button_add"]["browse_button"]}
  choose file  ${image_library["button_add"]["browse_button"]}  ${file_path}
  sleep  1
