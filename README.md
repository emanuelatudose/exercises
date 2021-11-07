# Exercise 1 - startup_namer

Build your first app and run on devices/emulators.

## Resources

- [Write your first Flutter app, part 1](https://flutter.dev/docs/get-started/codelab)

- [Write Your First Flutter App, part 2](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#0)


# Exercise 2 - Login and Dashboard

In the app, add a login screen as the first screen of app which has username, password fields and login button. Create another screen with name dashboard. On clicking login button, check and show error for null values. If username and password fields are not null, user should navigate to next screen (Dashboard).

# Exercise 3 - Bloc for Login

Modify the app to use BLoC for validating login details and login button click events.

# Exercise 4 - ToDo List with http

In the app, add ListView on dashboard screen. Use the http package to fetch a list of ToDos from the URL: http://jsonplaceholder.typicode.com/todos
Display all the Todos on this screen with the following fields: ID, title and completed. Use icons to represent the status of the todo (download the relevant icons).

# Exercise 5 - SQLite database integration

Update the app to save todos data in local database. Add a new ‘detail page screen’. On click of todo in list, navigate to detail page screen. Fetch the details for selected todo item from database and show on screen.