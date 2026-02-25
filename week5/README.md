KRS Management System - Week 5 Assignment
Student Name: Rahma Lindungi Laowo

Student ID: 0520230007

Major: Information Systems, Jakarta International University

1. Chosen Option
   For this assignment, I have implemented Option B — Add One New Screen.

The application now features a KRS Preview Screen that acts as a summary and confirmation page before the data is finalized.

2. Main Logic Explanation
   The system focuses on data integrity and error prevention through the following logic:

Validation Flow (If-Else):

SKS Limit Check: The system ensures the total credits do not exceed 24 SKS. If a user tries to add more, a warning appears.

Duplicate Check: Each course selection is validated against the current list. Adding the same course twice is blocked to prevent data redundancy.

State Management:

The application strictly uses setState() to handle real-time UI updates, such as adding courses to the list and calculating the total SKS.

Navigation Logic:

The system uses Navigator.push to transition from the Input Form to the Preview Screen, carrying the selected data as parameters.

A Navigator.pop function is implemented on the Preview Screen to allow users to return and edit their selection, ensuring "User Control and Freedom".