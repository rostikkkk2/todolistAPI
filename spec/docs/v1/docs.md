

# Group Authorize


## Authorize::Session [/session]


### Create a session [POST /api/v1/sign_in]


+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "damian@reichertjohnston.com",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "EXAWW7mQy0mQ41vk5Q7xnz7ve6U8V7gQVjm2nn8+hrAo0kTGJUwivWH9phmqc7Ia5oZ0SvCdYM/EoiuYsRxwow==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjAzNDg2MTAsInVzZXJfaWQiOjEsInVpZCI6IjA3ZWUyMGYwLTJmZDMtNGIxOC04YTk1LWZiODI0NWUxNTcyOCIsImV4cCI6MTU2MDM0ODYxMCwicnVpZCI6ImIzMzJkYmJlLTU1Y2UtNDc2Yi04NDcxLTJiYWI4OGFmNzlmYiJ9.F56nebNui1uGiRaGEr6avDwpf_bgDMgQXsLs0TRDa5E",
              "access_expires_at": "2019-06-12T17:10:10.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjAzNDg2MTAsInVpZCI6ImIzMzJkYmJlLTU1Y2UtNDc2Yi04NDcxLTJiYWI4OGFmNzlmYiIsImV4cCI6MTU2MDk0OTgxMH0.zSEo8u9YouLESG4xiteBJgODjCGLbbzl-r03nvY-pdQ",
              "refresh_expires_at": "2019-06-19T16:10:10.000+03:00"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=travis%40wisozk.com&password=test

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Not authorized"
            }

### Destroy a session [DELETE /api/v1/log_out]


+ Request when destroy a session
**DELETE**&nbsp;&nbsp;`/api/v1/log_out`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            "ok"

# Group Projects


## Projects [/projects]


### Create a project [POST /api/v1/projects]


+ Request create project
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "TodoList"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "project",
                "attributes": {
                  "name": "TodoList"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "1",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request create project with wrong params
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "name": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }

### Update a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request update project
**PUT**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "beatae"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "project",
                "attributes": {
                  "name": "beatae"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "3",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not update project 422
**PUT**&nbsp;&nbsp;`/api/v1/projects/3`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "name": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }

+ Request not update project
**PUT**&nbsp;&nbsp;`/api/v1/projects/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "todo"
            }

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "5"
                }
              ]
            }

### Destroy a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

+ Request not found
**DELETE**&nbsp;&nbsp;`/api/v1/projects/8`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "8"
                }
              ]
            }

# Group Task::Comments


## Task::Comments [task/comment]


### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/1/comments?id=1`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "body": "test comment"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "comment",
                "attributes": {
                  "body": "test comment",
                  "photo": {
                    "url": null,
                    "thumb": {
                      "url": null
                    }
                  }
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "1",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request not create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/2/comments?id=2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "body": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "body": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }

### Destroy a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request destroy comment
**DELETE**&nbsp;&nbsp;`/api/v1/comments/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

+ Request not destroy comment
**DELETE**&nbsp;&nbsp;`/api/v1/comments/4`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "4"
                }
              ]
            }

# Group Task::Complete


## Task::Complete [task/complete]


### Update a complete task [PATCH /api/v1/complete/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request when do complete task
**PATCH**&nbsp;&nbsp;`/api/v1/complete/1`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "quaerat",
                  "deadline": "2019-06-13T13:10:09.653Z",
                  "complete": true,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when do not complete task
**PATCH**&nbsp;&nbsp;`/api/v1/complete/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "rem",
                  "deadline": "2019-06-13T13:10:09.688Z",
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request fail complete task
**PATCH**&nbsp;&nbsp;`/api/v1/complete/4`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "4"
                }
              ]
            }

# Group Task::Position


## Task::Position [task/position]


### Update a position task [PUT /api/v1/position/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request task position up
**PUT**&nbsp;&nbsp;`/api/v1/position/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "position": "up"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "cum",
                  "deadline": "2019-06-13T13:10:09.820Z",
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request task position down
**PUT**&nbsp;&nbsp;`/api/v1/position/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "position": "down"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "praesentium",
                  "deadline": "2019-06-13T13:10:09.862Z",
                  "complete": false,
                  "position": 3
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request return 404
**PUT**&nbsp;&nbsp;`/api/v1/position/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "5"
                }
              ]
            }

# Group Tasks


## Tasks [/tasks]


### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `1` (number, required)

+ Request create task
**POST**&nbsp;&nbsp;`/api/v1/projects/1/tasks?id=1`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "et"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "et",
                  "deadline": "2019-06-13T13:10:10.324Z",
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "1",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/3/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": ""
                }
              ]
            }

+ Request not create task
**POST**&nbsp;&nbsp;`/api/v1/projects/3/tasks?id=3`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "name": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }

### Update a task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request update task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "sunt",
              "deadline": "2019-06-17T00:00:00.000+03:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "sunt",
                  "deadline": "2019-06-16T21:00:00.000Z",
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "4",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not update task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/4`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "4"
                }
              ]
            }

+ Request not update task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/4`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "name": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }

### Destroy a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request success destroy task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/5`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

+ Request failed destroy task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": "not_found",
                  "id": "7"
                }
              ]
            }

# Group Users


## Users [/users]


### Create a user [POST /api/v1/sign_up]


+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_up`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "teddykuvalis@bradtke.net",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 1,
              "email": "teddykuvalis@bradtke.net",
              "password_digest": "$2a$04$5/W/6NQQ/eMMV8EirGTgxenNyiMe1kREJat4zcIOoQ0nLLW3bxbY.",
              "created_at": "2019-06-12T13:10:10.535Z",
              "updated_at": "2019-06-12T13:10:10.535Z"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_up`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes"
                  },
                  "detail": {
                    "password": [
                      "can't be blank"
                    ],
                    "email": [
                      "can't be blank"
                    ]
                  }
                }
              ]
            }
