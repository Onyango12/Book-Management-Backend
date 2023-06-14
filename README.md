# Book Recommendation API

This is a book recommendation API built using Ruby and Sinatra, with an ActiveRecord integration for interacting with a SQLite database.

## Features

- CRUD operations for books and recommendations
- One-to-many relationship between books and recommendations
- API routes for creating, reading, updating, and deleting books and recommendations
- Proper front-end state management using React

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/book-recommendation-api.git
 
2. Install the dependencies using Bundler:
    ```shell
    bundle install

3. Run the database migrations to set up the database:
    ```shell
    rake db:migrate
4. Start the application:
    ```shell
    rackup

5. The API will be accessible at http://localhost:9292.

6. Open a new terminal and change directory to client which is the front-end part.
    ```shell
    cd client

7. Once in the client directory, run npm install

    ```shell
    npm install

8. Then proceed with starting the server.
    ```shell
    npm start
## License

[MIT](https://choosealicense.com/licenses/mit/)

