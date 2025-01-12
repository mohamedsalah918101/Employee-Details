# Employee Details App  

## Overview  

This Flutter application fetches employee data using the Dio package, handles errors with try-catch, parses JSON responses, maps them to a model, and caches the employee list locally using `shared_preferences`. It features a two-screen navigation system where users can view detailed information about a selected employee.  

## Features  

1. **Data Fetching**: Fetch employee data from an API using Dio.
2. **Error Handling**: Proper error handling using try-catch to ensure robustness.
3. **Navigation**: Navigate between two screens (list and details) with seamless data passing.
4. **Loading Indicator**: Display a loading indicator while data is being fetched.
5. **Data Caching**: Cache the employee list locally using `shared_preferences` and reload it on app restart.  

## Project Structure  

- **Models**: Contains the data model for employees.
- **Services**: Manages API requests and data handling using Dio.
- **Widgets**: Each widget is in a separate file to maintain code modularity and clarity.
- **Screens**: Two screens:
  - Employee List Screen: Displays the list of employees.
  - Employee Details Screen: Shows detailed information about a selected employee.  

## Getting Started  

### Prerequisites  

- Flutter SDK installed on your machine.
- Basic knowledge of Flutter development.

### Installation  

1. Clone the repository:
   ```bash
   git clone https://github.com/mohamedsalah918101/Employee-Details.git
   cd employee-data-fetcher
