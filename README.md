# FileManager

FileManager is a Ruby on Rails application that allows users to upload, manage, and share files publicly via unique short URLs. It features authentication, file management, and a clean, responsive UI.

Things you may want to cover:

* Features
  - User Authentication: Sign up, sign in, and sign out with Devise.
  - File Management:
    - Upload files with title, description, and file type.
    - Download uploaded files.
    - Share files publicly via short, unique URLs.
    - Delete uploaded files.
  - File Listing: Display files in a table with pagination and search (using DataTables).
  - Public File Sharing: Generate and copy public short URLs for easy sharing.

* Ruby version - 3.2.2
  
* Rails version - 7.x or higher

* Configuration
  - Clone the repository:
    `git@github.com:AdiAgarwal01/FileManagement.git`
    `cd FileManagement`
  - Install dependencies: Ensure you have Ruby installed and then run: `bundle install`
  - Set up the database: Run the following command to set up the database:
    `bin/rails db:create`
    `bin/rails db:migrate`
  - Start the server: `rails s`
