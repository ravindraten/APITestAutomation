***Settings***
Library     RequestsLibrary 
Library     Collections

***variables***
${base_url}     https://jsonplaceholder.typicode.com
${posts_id}     1

***Test case***
Get_Post
    create session  mysess   ${base_url}
    ${response}=    get request     mysess      /posts/${posts_id}
    log to console  ${response.content}
    log to console  ${response.status_code}
    log to console  ${response.headers}
#validations
    ${status_code}=     convert to string     ${response.status_code}
    should be equal     ${status_code}          200

    ${body}=    convert to string   ${response.content}
    should contain  ${body}         1

    ${contentTypeValue}=    get from dictionary     ${response.headers}     Content-Type
    should contain     ${contentTypeValue}     application/json