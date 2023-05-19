# README

This is a basic library application that enables users to manage their personal book collections. Each user needs to create an account, and upon logging in, they gain access to their own library.

Users can categorize books based on title, author, year of publication, and personal rating using a star system. Additionally, they have the option to upload cover images for the books.

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
