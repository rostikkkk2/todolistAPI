

# Group Authorize


## Authorize::Session [/session]


### Create a session [POST /api/v1/session]


+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/session`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "myrta@klocko.com",
              "password": "cQG1OtgyeE"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "BzKJbMb1o2hSeeH81ynb8/jAw4vTkRsn3OfFaZ6Tr6ObGjjv2B2wT/1/g6B3JSIz45+aqN4Uo+3icQ35PLUmFg==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA5NTM3MDgsInVzZXJfaWQiOjEsInVpZCI6Ijg3ZTcxZGQxLTAxNWQtNDdjNS1iZjhkLWI2Mjg2N2NhNGNmMCIsImV4cCI6MTU2MDk1MzcwOCwicnVpZCI6IjViMTZhNDA4LTQ0ZDEtNDI1OC05MzBiLWQ5OTViYzQzYjUyZiJ9.PFPxrGyGZHe-qiZDKACNg0B77_TZGoh-Hoff9FrHhfI",
              "access_expires_at": "2019-06-19T17:15:08.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NjA5NTM3MDgsInVpZCI6IjViMTZhNDA4LTQ0ZDEtNDI1OC05MzBiLWQ5OTViYzQzYjUyZiIsImV4cCI6MTU2MTU1NDkwOH0.XMNk4YbhbffIXAl7yYcLZDQy9Sc-K_G1OxOxphX7VwU",
              "refresh_expires_at": "2019-06-26T16:15:08.000+03:00"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/session`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=elvira.howell%40gerholdhuel.info&password=yB3EB5is0

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Not authorized"
            }

### Destroy a session [DELETE /api/v1/session/{id}]

+ Parameters
    + id: `3` (number, required)

+ Request when destroy a session
**DELETE**&nbsp;&nbsp;`/api/v1/session/3`

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
              "name": "nihil"
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
                  "name": "nihil"
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
              "name": "qui"
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
                  "name": "qui"
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
              "name": "laudantium"
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
**DELETE**&nbsp;&nbsp;`/api/v1/projects/7`

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
                    "pointer": "/api/v1/projects/7"
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

            body=distinctio

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "comment",
                "attributes": {
                  "body": "distinctio",
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
                  "name": "saepe",
                  "deadline": "2019-06-20T00:00:00.000Z",
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
                  "name": "et",
                  "deadline": "2019-06-20T00:00:00.000Z",
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
                  "name": "id",
                  "deadline": "2019-06-20T00:00:00.000Z",
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
                  "name": "quod",
                  "deadline": "2019-06-20T00:00:00.000Z",
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

+ Request return 422
**PUT**&nbsp;&nbsp;`/api/v1/position/11`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "position": "quis"
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "/api/v1/position/11"
                  },
                  "detail": "Wrong param position"
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
              "name": "accusantium",
              "deadline": "2019-06-20T16:15:08.609+03:00"
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
                  "name": "accusantium",
                  "deadline": "2019-06-20T13:15:08.609Z",
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
              "name": "ipsam",
              "deadline": "2019-06-24T00:00:00.000+03:00"
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
                  "name": "ipsam",
                  "deadline": "2019-06-23T21:00:00.000Z",
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


### Create a user [POST /api/v1/users]


+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "mickey@jaskolski.biz",
              "password": "xpPEcSENy3MI",
              "password_confirmation": "xpPEcSENy3MI"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 1,
              "email": "mickey@jaskolski.biz",
              "password_digest": "$2a$04$c86yDtohvq43PcYMlMmUpebsi/2L7X4p56YunLihTDVfQeJWFalum",
              "created_at": "2019-06-19T13:15:09.156Z",
              "updated_at": "2019-06-19T13:15:09.156Z"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/users`

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
