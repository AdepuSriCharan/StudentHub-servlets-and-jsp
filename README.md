Introduction to the Web Application Project: 

This web application is designed as a user management system that facilitates user registration, authentication, and profile management. 
Developed using JavaServer Pages (JSP) and Java servlets, the application provides a secure and user-friendly environment for individuals to interact with their profiles, update information, and log in/out. The project is structured to incorporate both user and admin functionalities, ensuring a comprehensive user experience.

Project Structure and Technologies Used:

Java Servlets: 

The backend logic, including user authentication, registration, and database interactions, is implemented using Java servlets.

JavaServer Pages (JSP): 

Dynamic content generation is achieved through JSP, allowing seamless integration of Java code with HTML for creating interactive web pages.

HTML and CSS:   

The frontend is designed using HTML and CSS to ensure a visually appealing and responsive user interface.

MySQL Database: 

MySQL is used as the backend database to store user information securely.

JDBC (Java Database Connectivity): 

JDBC is employed for connecting and interacting with the MySQL database from Java servlets.

Session Management: 

HttpSession is utilized for managing user sessions, allowing users to stay authenticated throughout their interactions with the application.


Key Features and Functionality:

User Authentication:

Users log in using a username and password on the signin.jsp page.
Authentication is handled by the backend servlet (signin-servlet), which communicates with the MySQL database for secure access.

User Registration:

New users register on the signup.jsp page, providing necessary details such as Full Name, Date of Birth, Phone Number, Username, and Password.
The registration form communicates with the signup-servlet, which securely stores user data in the MySQL database.
User Profile Management:

Upon successful login, users are directed to the home.jsp page, displaying a personalized dashboard or welcome message.
The profile.jsp page allows users to view and update their profile information, with changes saved to the MySQL database using the update-servlet.
Logout:

The logout.jsp page seeks confirmation before users log out.
The logout-servlet handles the session invalidation and ensures a secure logout process.
Admin Access:

Admins can access additional features through the adminaccess.jsp page.
The "Database" button on the admin panel (admindatabase.jsp) provides access to information about all students stored in the MySQL database.
GitHub Repository Link:

A link to the project's GitHub repository is included, allowing users to explore the source code and possibly contribute.
Styling and User Interface:

The application features a visually consistent and appealing design with dark backgrounds, clear buttons, and organized content.
