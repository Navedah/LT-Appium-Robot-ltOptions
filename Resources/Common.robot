*** Settings ***
Library  AppiumLibrary

*** Variables ***

${platformName}         ios
${platformVersion}     15  # Set your default version
${deviceName}           iPhone.*
${visual}               True
${network}              True
${isRealMobile}         True
${LT_APP_ID}            'lt://proverbial-ios'
${LT_GRID_URL}          ''
#{TIMEOUT}              3000


*** Keywords ***

Open test app
    [Timeout]   ${TIMEOUT} 
    
    TRY
        ${REMOTE_URL}=    Set Variable If    '%{LT_GRID_URL}' == ''    mobile-hub.lambdatest.com    %{LT_GRID_URL}
    EXCEPT
        ${REMOTE_URL}=    Set Variable    mobile-hub.lambdatest.com
    END
    ${REMOTE_URL}=   Set Variable       https://XXXXXXXXXXX:XXXXXXXXXXXXXXX@${REMOTE_URL}/wd/hub
    &{LT_Options}    Create Dictionary
    ...    isRealMobile=true
    ...    deviceName=iPhone.*
    ...    w3c=true
    ...    platformName=ios
    ...    app=lt://proverbial-ios
    ...    build=Robot_RD_S4

    Log To Console  ${LT_Options}

    Open Application  ${REMOTE_URL}  &{LT_Options}
    

Close test app
    Close All Applications
