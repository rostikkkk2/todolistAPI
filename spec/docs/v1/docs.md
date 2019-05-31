

# Group Comments


## Comments [/comment]


### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `2989` (number, required)

+ Request create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/2989/comments`

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
                "id": "456",
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
                      "id": "2989",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request not create comment
**POST**&nbsp;&nbsp;`/api/v1/tasks/2990/comments`

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



### Destroy a comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `457` (number, required)

+ Request destroy comment
**DELETE**&nbsp;&nbsp;`/api/v1/comments/457`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

# Group Complete


## Complete [/complete]


### Update a complete task [PATCH /api/v1/complete/{id}]

+ Parameters
    + id: `2992` (number, required)

+ Request when do complete task
**PATCH**&nbsp;&nbsp;`/api/v1/complete/2992`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2992",
                "type": "task",
                "attributes": {
                  "name": "nihil",
                  "deadline": null,
                  "complete": true,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3130",
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
**PATCH**&nbsp;&nbsp;`/api/v1/complete/2993`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2993",
                "type": "task",
                "attributes": {
                  "name": "eos",
                  "deadline": null,
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3131",
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
**PATCH**&nbsp;&nbsp;`/api/v1/complete/2995`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



# Group Position


## Position [/position]


### Update a position task [PUT /api/v1/position/{id}]

+ Parameters
    + id: `2996` (number, required)

+ Request task position up
**PUT**&nbsp;&nbsp;`/api/v1/position/2996`

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
                "id": "2996",
                "type": "task",
                "attributes": {
                  "name": "et",
                  "deadline": null,
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3133",
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
**PUT**&nbsp;&nbsp;`/api/v1/position/2999`

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
                "id": "2999",
                "type": "task",
                "attributes": {
                  "name": "accusamus",
                  "deadline": null,
                  "complete": false,
                  "position": 3
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3134",
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
**PUT**&nbsp;&nbsp;`/api/v1/position/3002`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



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
                "id": "3136",
                "type": "project",
                "attributes": {
                  "name": "TodoList"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "3890",
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



### Update a project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `3137` (number, required)

+ Request update project
**PUT**&nbsp;&nbsp;`/api/v1/projects/3137`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "ea"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3137",
                "type": "project",
                "attributes": {
                  "name": "ea"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "3892",
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

+ Request not update project
**PUT**&nbsp;&nbsp;`/api/v1/projects/3139`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Destroy a project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `3139` (number, required)

+ Request delete project
**DELETE**&nbsp;&nbsp;`/api/v1/projects/3139`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

# Group Session


## Session [/session]


### Create a session [POST /api/v1/sign_in]


+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "email": "ushavon@bradtke.info",
              "password": "Password1"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "9YzYrN+YHbuAxbg4eqTO4B7cZ3EkIgyOA+yVSbuQvj7sRbGh1nAynyzxAdZbAG/5ox+ojYphvdFn5fzAnD7fSQ==",
              "access": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTkzMzkyMTAsInVzZXJfaWQiOjM4OTUsInVpZCI6ImZiZmFiNzRkLTBhNGEtNDRhMi04NWEzLTMzODc0OTI3NDU5NyIsImV4cCI6MTU1OTMzOTIxMCwicnVpZCI6ImJlYjg4ZjA1LTQwYjEtNGY0Yi05YTJkLWIwZjFkNjdiNjY1ZiJ9.jrOmUr03Pqn08yNy1_qTv_VNHrXKrx39w4leEdd3nYs",
              "access_expires_at": "2019-06-01T00:46:50.000+03:00",
              "refresh": "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTkzMzkyMTAsInVpZCI6ImJlYjg4ZjA1LTQwYjEtNGY0Yi05YTJkLWIwZjFkNjdiNjY1ZiIsImV4cCI6MTU1OTk0MDQxMH0.Kxwx9dqAjZHE5heN69Y3JktW7qeVJAoRRxxpbyGvWvc",
              "refresh_expires_at": "2019-06-07T23:46:50.000+03:00"
            }

+ Request create user by token
**POST**&nbsp;&nbsp;`/api/v1/sign_in`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            email=mirta%40schuster.info&password=test

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

# Group Tasks


## Tasks [/tasks]


### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `3140` (number, required)

+ Request create task
**POST**&nbsp;&nbsp;`/api/v1/projects/3140/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "aut"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3004",
                "type": "task",
                "attributes": {
                  "name": "aut",
                  "deadline": "2019-06-01T20:46:50.075Z",
                  "complete": false,
                  "position": 3004
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3140",
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
**POST**&nbsp;&nbsp;`/api/v1/projects/3142/tasks`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body



+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Update a task [PUT /api/v1/tasks/{id}]

+ Parameters
    + id: `3005` (number, required)

+ Request update task
**PUT**&nbsp;&nbsp;`/api/v1/tasks/3005`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": "molestiae",
              "deadline": "2019-06-03T00:00:00.000+03:00"
            }

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3005",
                "type": "task",
                "attributes": {
                  "name": "molestiae",
                  "deadline": "2019-06-02T21:00:00.000Z",
                  "complete": false,
                  "position": 1
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "3142",
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
**PUT**&nbsp;&nbsp;`/api/v1/tasks/3006`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "name": ""
            }

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Destroy a task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `3007` (number, required)

+ Request destroy task
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/3007`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 204

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
              "email": "chia@grimes.co",
              "password": "Password1",
              "password_confirmation": "Password1"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 3903,
              "email": "chia@grimes.co",
              "password_digest": "$2a$04$3f8w7p6Y3U2YyXhNRwhg4eOSDYYm6bLbIiOqMGvgYrs1KCTH1Srre",
              "created_at": "2019-05-31T20:46:50.167Z",
              "updated_at": "2019-05-31T20:46:50.167Z"
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
                "Password can't be blank",
                "Email can't be blank"
              ]
            }
