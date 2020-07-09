***Settings***
Library    RPA.Browser
Library    RPA.Salesforce
Library    Collections
# Resource   rpaProject/secrets.json
Library    RPA.Robocloud.Secrets.FileSecrets

***Variables***
${USERNAME}    s.ramraj@live.com
${PWD}         India@11
${BROWSER}     chrome
# ${RPA_SECRET_MANAGER}     RPA.Robocloud.Secrets.FileSecrets
# ${RPA_SECRET_FILE}    F://Projects//rpaProject//secrets.json

***Tasks***
Login To Salesforce
    Authorize Salesforce
    ${result}=    Salesforce Query    SELECT First_Name__c FROM Candidate__c WHERE Name = 'C-005'
    # ${type}=    Evaluate   type(${result})
    Log    ${result}
    ${test}=    Get Dictionary Values    ${result}
    # Log    ${test}[1]
    ${test1}=    Get Dictionary Values    ${test}[1][0]
    Log    ${test1}[0]
    # FOR    ${x}     IN    @{test}
    #     ${test1}=    Run Keyword If    '${x}'=='records'    Get From Dictionary    ${result}    ${x}
    #     Exit For Loop If    '${x}'=='records'
    # END
    # ${value}=    Get From Dictionary    ${result}    ${test}[1]
    # ${test1}=    Get Dictionary Keys    ${value}[0]
    # # ${test1}=    Get Dictionary Keys    ${value}[0]
    # ${actValue}=    Get From Dictionary    ${value}    ${test1}[0]
    # # Log    ${actValue}
    # # Open Browser    url=https://login.Salesforce.com    browser=${BROWSER}
    # # Input Text    id:username    ${USERNAME}
    # # Input Text    id:password    ${PWD}
    # # Click Button     Log In

*** Keywords ***
Authorize Salesforce
    ${secrets}=    Get Secret   salesforce
    # Log Many    ${secrets}
    Auth With Token
    ...        username=${secrets}[USERNAME]
    ...        password=${secrets}[PASSWORD]
    ...        api_token=${secrets}[API_TOKEN]
    # Set Suite Variables