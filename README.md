# AppointmentScheduler

VERSION: 2.0

DATE: 4/28/2021

DESCRIPTION:
This is  a java application for managing appointments. It features:
A login screen validates user credentials (username and password) and provides internationalization for French users.
A main screen displays calendar of appointments and allows filters to view appointments per week and per month. 
Appointment notifications to alert users of any appointments taking place within 15 minutes of login.
Appointments can be added, edited or deleted. Each appointment is assigned a customer.
Notification of any time conflicts with existing appointments assigned to a specific customer when adding or updating an appointment.
Customers can be added, edited or deleted. Deleting a customer also deletes all of its assigned appointments.
Generates reports for: total number of customer appointments by type and month, schedule for each contact in your list and total number of customer appointments by location.


AUTHOR:
Manuel Fuentes


TOOLS:
NetBeans 11.3
Java SE 11.0.10
JavaFX-SDK-11.0.2
MySQL-Connector-Java-8.0.22

*See Video Preview at https://www.youtube.com/watch?v=VhkCT4FABBY

INSTRUCTIONS:
1. Download and install JDK 11 (https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
2. Download and install JavaFX 11 (https://gluonhq.com/products/javafx/)
3. Unzip the downloaded QAM1 file 
4. Open Command Line (for Windows) or Terminal (for Mac OS) and change directory to the path of “QAM1/dist”
5. Copy/paste the following command substituting “path/to/javafx/lib” with the path of  javafx-sdk-11.0.?/lib
java --module-path [path/to/javafx/lib] --add-modules=javafx.controls --add-modules=javafx.base --add-modules=javafx.graphics --add-modules=javafx.media --add-modules=javafx.swing --add-modules=javafx.web --add-modules=javafx.fxml -jar QAM1.jar
6. You will need a MySQL server in which to import the database.sql file and edit the 'ipAddress', 'dbName', 'userName' and 'password' String variables in \src\DAO\DBConnection.java to match your database credentials
