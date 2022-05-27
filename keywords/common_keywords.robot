*** Keywords ***
Capture Page Screenshot With Unique Name
    ${uuid} =  uuid4
    Capture Page Screenshot  selenium-${uuid}.png