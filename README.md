# README

This project is a simple library application that allows the user to add and remove books from his personal library. Each user must create an account, and by logging in, he has access to his own library.

The user can classify books by different categories: title, author, year of publication, and opinion about the book (star system), as well as having the option of uploading an image of the cover.

 - Ruby version - `3.1.2`

 - Rails version - `7.0.2.3`

 - System dependencies
	 `bundle install`
	  `yarn install`

 - Configuration
		Image Upload - Cloudinary  - you need to create a .env file to store the key

 - Database
	PostgreSQL - psql (14.7)

 -  Database creation
	 `rails db:create`

 - Database initialization
	   `rails db:migrate`
	   `rails db:seed`

 - Launch  server
	Open a  **new tab**  in your terminal: `rails server`
	Open a  **second tab**  in your terminal: `yarn build --watch`
	Keep both tabs open. The server is running Open your browser and go to  `http://localhost:3000/`
