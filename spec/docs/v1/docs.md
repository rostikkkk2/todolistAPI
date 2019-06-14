

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
              "email": "elmopfeffer@schmidtmacgyver.biz",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "tJoP9oXwrwP559PzNCEyMSFNjBeZKb5T6DlII+3gZa8gaELX9YQuo6Tq4teP17mhX6KtSDHOFtIB8wziyKk0Nw==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA1MjYyMjUsInVzZXJfaWQiOjEsInVpZCI6Ijc3YjEwMDFmLThkY2YtNDk4OS1iYzdmLTI4OTliN2VlY2VmOCIsImV4cCI6MTU2MDUyNjIyNSwicnVpZCI6Ijc3ZmQyN2ZmLWVmMDgtNDMwYS05YzJhLThkYzljMjBlNTg5NyJ9.-q_xv119S-0-9s37Qj_FakJAAv9LZqqQm3j7ZaPiJeA",
              "access_expires_at": "2019-06-14T18:30:25.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA1MjYyMjUsInVpZCI6Ijc3ZmQyN2ZmLWVmMDgtNDMwYS05YzJhLThkYzljMjBlNTg5NyIsImV4cCI6MTU2MTEyNzQyNX0.Xn335E4_Et1tCHgk-QYTx5AzUJJ4ypkebdXZ958ekNA",
              "refresh_expires_at": "2019-06-21T17:30:25.000+03:00"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=burton%40kunde.io&password=test

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
              "name": "sit"
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
                  "name": "sit"
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
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ]
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
              "name": "quibusdam"
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
                  "name": "quibusdam"
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
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ]
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
              "name": "doloremque"
            }

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/projects/5"
                  },
                  "detail": "Not found"
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
                    "pointer": "/api/v1/projects/8"
                  },
                  "detail": "Not found"
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

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            body=omnis

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "comment",
                "attributes": {
                  "body": "omnis",
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
                    "pointer": "data/attributes/body"
                  },
                  "detail": [
                    "can't be blank"
                  ]
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
                    "pointer": "/api/v1/comments/4"
                  },
                  "detail": "Not found"
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
                  "name": "iusto",
                  "deadline": "2019-06-15T00:00:00.000Z",
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
                  "name": "accusamus",
                  "deadline": "2019-06-15T00:00:00.000Z",
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
                    "pointer": "/api/v1/complete/4"
                  },
                  "detail": "Not found"
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
                  "name": "est",
                  "deadline": "2019-06-15T00:00:00.000Z",
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
                  "name": "quaerat",
                  "deadline": "2019-06-15T00:00:00.000Z",
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
                    "pointer": "/api/v1/position/5"
                  },
                  "detail": "Not found"
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
              "name": "quasi"
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
                  "name": "quasi",
                  "deadline": "2019-06-15T14:30:25.260Z",
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
                    "pointer": "/api/v1/projects/3/tasks"
                  },
                  "detail": "Not found"
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
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ]
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
              "name": "quisquam",
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
                  "name": "quisquam",
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
                    "pointer": "/api/v1/tasks/4"
                  },
                  "detail": "Not found"
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
                    "pointer": "data/attributes/name"
                  },
                  "detail": [
                    "can't be blank"
                  ]
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
                    "pointer": "/api/v1/tasks/7"
                  },
                  "detail": "Not found"
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
              "email": "willie@quitzonwhite.biz",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 1,
              "email": "willie@quitzonwhite.biz",
              "password_digest": "$2a$04$SrKGqqM4qXd4suaJsxJD4Oix79A7Bi2S1UXPKpnq7HmC7/2I6clhG",
              "created_at": "2019-06-14T14:30:25.694Z",
              "updated_at": "2019-06-14T14:30:25.694Z"
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
                    "pointer": "data/attributes/password"
                  },
                  "detail": [
                    "can't be blank"
                  ]
                },
                {
                  "source": {
                    "pointer": "data/attributes/email"
                  },
                  "detail": [
                    "can't be blank"
                  ]
                }
              ]
            }
