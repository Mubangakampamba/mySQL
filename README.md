# data cleaning
This project focuses on cleaning and transforming data using **Excel** and **MySQL** to improve usability for analysis.

## Objectives
- Identify and remove duplicates,if any.
- Formatting (capitalization, spacing, etc.).
- Convert data types for consistency.
- Remove or add columns.

## Project Workflow
### 1. **Data Import**
   - Open the dataset in Excel and review for improvements.
   - Load the raw dataset into MySQL.

### 2. **Data Cleaning Steps**
   - **Duplicates Removal**:  
     ```sql
     DELETE FROM table_name WHERE id NOT IN (
         SELECT MIN(id) FROM table_name GROUP BY column_name
     );
     ```
   - **Handling Missing Values** (Replacing nulls with average values):  
     ```sql
     UPDATE table_name SET column_name = (
         SELECT AVG(column_name) FROM table_name WHERE column_name IS NOT NULL
     ) WHERE column_name IS NULL;
     ```
   - **Text Standardization** (Removing extra spaces & capitalizing names in Excel):
     - Use `TRIM()` and `PROPER()` functions.
   - **Column Filtering** (Removing irrelevant columns in MySQL):
     ```sql
     ALTER TABLE table_name DROP COLUMN unwanted_column;
     ```

### 3. **Export Cleaned Data**
   - Use `SELECT INTO OUTFILE` in MySQL to export refined tables.
   - Save the cleaned Excel file as a **CSV** for further processing.

## Results
After cleaning, the dataset is:
- Free from duplicates.
- Standardized and structured.
- Optimized in terms of size and readability.

## How to Run
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/data_cleaning_project.git
