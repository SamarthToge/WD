# Student Result Search System (WD)

### Project Code Directory: [**ResultSystem**](./ResultSystem)
Direct Link: [https://github.com/SamarthToge/WD/tree/main/ResultSystem](https://github.com/SamarthToge/WD/tree/main/ResultSystem)

---

## Overview
Student Result Search web application built with **Spring Boot**, **Thymeleaf**, and **MySQL**.
- Student enters PRN to retrieve semester result from MySQL.
- Admin portal to add students, seed subjects, and manage marks.

## Four Subjects
1. Data Structures and Algorithms
2. Operating Systems
3. Database Management Systems
4. Object Oriented Programming

## Marks Calculation
- **MSE** = 30 marks
- **ESE** = 70 marks
- **Subject Total** = MSE + ESE
- **Maximum Semester Marks** = 400
- **Percentage** = `(Obtained Marks / 400) × 100`

## Database Schema
- **students Table**: `id`, `prn`, `name`, `branch`, `semester`
- **subjects Table**: `id`, `name`
- **marks Table**: `id`, `student_id`, `subject_id`, `mse`, `ese`

## Quick Start
1. Create MySQL database:
   ```sql
   CREATE DATABASE vit_result;
   ```
2. Import tables and seed data using [`SQL for VIT Result SpringBoot.sql`](./SQL%20for%20VIT%20Result%20SpringBoot.sql) or [`ResultSystem/SQL for VIT Result SpringBoot.sql`](./ResultSystem/SQL%20for%20VIT%20Result%20SpringBoot.sql).
3. Configure credentials in [`ResultSystem/src/main/resources/application.properties`](./ResultSystem/src/main/resources/application.properties).
4. Run the application:
   ```bash
   cd ResultSystem
   mvn spring-boot:run
   ```
5. Access web portal at `http://localhost:8080/`.
