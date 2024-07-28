# README


# PostIt API

## Setup Instructions

1. Clone the repository:
   ```sh
   git clone <repository_url>
   cd <repository_directory>

2. Install all dependencies
   ```bundle install```

3. Setup the database
    ```rails db:create```
    ```rails db:migrate```

4. Start the server
    ```rails server```


# API Endpoints

## Users
- GET /api/v1/users: List all users
- POST /api/v1/users: Create a new user
Request body: { "user": { "username": "string", "password": "string" } }
- GET /api/v1/users/:id: Show a specific user
- PATCH /api/v1/users/:id: Update a specific user
Request body: { "user": { "username": "string", "password": "string" } }
- DELETE /api/v1/users/:id: Delete a specific user

## Posts
- GET /api/v1/posts: List all posts
- POST /api/v1/posts: Create a new post
Request body: { "post": { "content": "string", "user_id": "integer" } }
- GET /api/v1/posts/:id: Show a specific post
- PATCH /api/v1/posts/:id: Update a specific post
Request body: { "post": { "content": "string" } }
- DELETE /api/v1/posts/:id: Delete a specific post

# Authentication

All API requests require an Authorization header with a valid token:
```Authorization: Bearer <token>```


# Testing
Run tests with: 
```bundle exec rspec```

## Testing the API with curl (You can also test with postman)

### Testing with `curl`

1. Get User's Token:
```user = User.create(username: 'testuser', password: 'password')```
```puts user.token # Save this token```

2. Make API Request:
```curl -H "Authorization: Bearer <user_token>" http://localhost:3000/api/v1/users/<user_id>/posts```

Replace <user_token> with the token you got from the console and <user_id> with the user's ID.

#### Example using rails console
```user = User.create(username: 'testuser', password: 'password')
puts user.token # e.g., '12345abcde'
puts user.id # e.g., 1```


#### curl command example
```curl -H "Authorization: Bearer 12345abcde" http://localhost:3000/api/v1/users/1/posts```

You should get a response like so : 
```
[
    {
        "id": 2,
        "user_id": 6,
        "post": "This is a new post",
        "created_at": "2024-07-25T19:11:11.773Z",
        "updated_at": "2024-07-25T19:11:11.773Z"
    }
]
```
## Just make sure that you have your server running while make the resquests !
