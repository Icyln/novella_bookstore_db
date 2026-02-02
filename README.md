# Smart Library Management System

## System Overview
The Smart Library Management System (SLMS), also known as the SilentLibrary Project, is a Django-based web application designed to manage library operations efficiently. The system allows users to browse and borrow books, while administrators manage books and users through a secure admin dashboard. 

## Users
- **Admin (Librarian):** Manages books, users, and system data
- **User (Student):** Browses available books and borrows them

## Implemented Features
- User authentication (login and admin access)
- Book Create, Read, Update, and Delete (CRUD)
- Borrowing and return logic with basic business rules
- Admin dashboard for managing library data
- Responsive user interface using Bootstrap 5

## Setup
1. Install Python (3.10+) and Django
2. Clone the project repository
3. Create and activate a virtual environment
4. Install required dependencies
5. Run database migrations
6. Create an admin (superuser) account
7. Start the development server
8. Access the application via `http://127.0.0.1:8000/`

## Project Structure
- `core/` – Project configuration and settings
- `library/` – Main application logic
- `templates/` – HTML templates for user and admin interfaces
- `models.py` – Database models
- `views.py` – Request handling and business logic
- `manage.py` – Django management script

## License
This project is developed for educational purposes as part of a software training program.
