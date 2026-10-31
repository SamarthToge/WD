# VIT Semester Result System

Responsive Spring Boot + MySQL web application for preparing a one-semester VIT student result using four subjects:
- Data Structures and Algorithms
- Operating Systems
- Database Management Systems
- Object Oriented Programming

Marks formula: **Total = MSE (30) + ESE (70)**. Percentage is calculated from the total marks.

## Requirements
- Java 17+
- Maven 3.9+
- MySQL 8+

## Setup
1. Create the database:
```sql
CREATE DATABASE vit_result;
```
2. Edit `src/main/resources/application.properties` if your MySQL username/password differs.
3. Run:
```bash
mvn spring-boot:run
```
4. Open `http://localhost:8080/admin`.
5. Click **Seed Subjects**, add a student, and enter marks for all four subjects.
6. Open the student portal and search using the PRN.

## Formula
For each subject:
`Subject Total = MSE + ESE`

Semester percentage:
`(sum of subject totals / (number of subjects × 100)) × 100`

The app uses JPA/Hibernate to create/update tables automatically.
