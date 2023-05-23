# sql-challenge

The background describes a scenario where a data engineer is hired at Pewlett Hackard to work on a research project involving employee data from the 1980s and 1990s. The available data is stored in six CSV files. The task involves designing table schemas, importing the CSV files into a SQL database, and performing data analysis based on the provided information.

Data modeling is the initial step, which involves inspecting the CSV files and creating an Entity Relationship Diagram (ERD) to represent the tables and their relationships. The suggestion is to use a tool like QuickDBD to create the ERD.

Data engineering is the next phase, where table schemas are designed for each of the six CSV files. It includes specifying data types, primary keys, foreign keys, and other constraints. If a column does not have a unique identifier, a composite key involving two primary keys can be used to ensure uniqueness. The tables should be created in the correct order to handle the foreign keys, and the CSV files should be imported into their respective SQL tables.

Data analysis is the final step, where specific queries are executed to extract insights from the data. The provided analysis tasks include listing employee information such as employee number, last name, first name, sex, and salary, as well as filtering based on hire date, department, and employee name. Additionally, the task involves listing the frequency counts of employee last names in descending order to determine how many employees share each last name.
