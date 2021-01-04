***Settings***
Library     RequestsLibrary 
Library     Collections

***variables***
${base_url}     https://jsonplaceholder.typicode.com

***Test case***
Post_user
    create session  mysess   ${base_url}
    ${body}=    create dictionary  id=11       username=Delphine
    ${header}=  create dictionary  Content-Type="application/json;charset=utf-8"
    ${response}=    post request    mysess  /users  data=${body}    headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}

#validations
    ${status_code}=     convert to string     ${response.status_code}
    should be equal     ${status_code}          201

    ${res_body}=    convert to string   ${response.content}
    should contain  ${res_body}         Delphine

***Test case***
Get_Users
    create session  mysess   ${base_url}
    ${response}=    get request     mysess      /users/11

#validations
    ${status_code}=     convert to string     ${response.status_code}
    should be equal     ${status_code}          200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}         11

***Test case***
Get_Posts
    create session  mysess   ${base_url}
    ${response}=    get request     mysess      /users/10/posts

#validations
    ${status_code}=     convert to string     ${response.status_code}
    should be equal     ${status_code}          200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}         libero

*** Test Cases ***
Get_comments
    create session  mysess   ${base_url}
    ${response}=    get request     mysess      /posts/1/comments
    log to console  ${response.content}
#validations
    ${status_code}=     convert to string     ${response.status_code}
    should be equal     ${status_code}          200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}         .biz

    ${body}=    convert to string   ${response.content}
    should contain  ${body}         .com