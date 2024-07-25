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


