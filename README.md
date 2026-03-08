# Character CRUD API - Spring Boot Demo

A comprehensive RESTful API for managing Marvel Rivals character records, built with Spring Boot, Spring Data JPA, and PostgreSQL. This project demonstrates fundamental concepts for building APIs with Spring Boot.

## Table of Contents


- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [API Endpoints](#api-endpoints)
- [Key Spring Boot Concepts](#key-spring-boot-concepts)
- [Database Schema](#database-schema)
- [Video link]()

https://uncg-my.sharepoint.com/:v:/g/personal/g_vulli_uncg_edu/IQDlL7pMveRHQJ_IBEXAgo48AbWuhcXMNi_cB9HXyxIL7gA?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=uqbqMT
---

## What is This Project?

This is a **CRUD API (Create, Read, Update, Delete)** that manages **Marvel Rivals characters**. It demonstrates:

- How to build a REST API with Spring Boot
- How to connect to a PostgreSQL database using JPA
- How to structure a Spring Boot application with layers (Controller, Service, Repository)
- How to handle HTTP requests and responses
- How to perform database operations

**CRUD stands for:**

- **Create** - Add new characters
- **Read** - Retrieve character records
- **Update** - Modify existing characters
- **Delete** - Remove characters

---

## Technology Stack

| Technology | Version | Purpose |
|-----------|--------|--------|
| Java | 25 | Programming language |
| Spring Boot | 4.0.3 | Framework for building the application |
| Spring Data JPA | Latest | ORM layer for database access |
| Hibernate | Latest | JPA implementation |
| PostgreSQL | Latest | Relational database |
| Maven | Latest | Build and dependency management |

### Java - Spring ORM with JPA and Hibernate

ORM (Object Relational Mapping) allows us to interact with relational databases using object-oriented programming.

JPA (Jakarta Persistence API) defines the standard for ORM in Java.

Hibernate is the most common implementation of JPA.

Spring integrates Hibernate and JPA automatically, simplifying database operations.

### Key Dependencies Explained

**spring-boot-starter-data-jpa**

Provides Spring Data JPA for simplified database access through repositories.

**spring-boot-starter-webmvc**

Provides Spring Web MVC for building REST APIs.

**postgresql**

JDBC driver used to connect to PostgreSQL.

---

## Installation & Setup

### Prerequisites

Before you begin, ensure you have installed:

1. **Java 25 JDK**

Verify installation:

```bash
java -version
```

2. **Neon.tech PostgreSQL Database**

This project uses **Neon.tech**, a serverless PostgreSQL database.

Steps:

- Visit https://neon.tech
- Create a free account
- Create a new PostgreSQL project
- Copy the connection string

3. **Git**

Download from:

https://git-scm.com/

---

## Setup Instructions

### 1. Clone the Project

```bash
git clone <repository-url>
cd crud-api
```

### 2. Install Dependencies

**Windows**

```cmd
mvnw.cmd clean install
```

**Mac/Linux**

```bash
./mvnw clean install
```

This will:

- Download dependencies
- Compile the project
- Prepare the application for running

---

### 3. Database Configuration (Neon PostgreSQL)

Open:

```
src/main/resources/application.properties
```

Add your Neon database credentials:

```properties
spring.application.name=crud-api

spring.datasource.url=jdbc:postgresql://host:5432/dbname
spring.datasource.username=your_username
spring.datasource.password=your_password

spring.jpa.hibernate.ddl-auto=update

logging.level.org.hibernate.SQL=DEBUG
logging.level.org.hibernate.orm.jdbc.bind=TRACE
```

Replace:

- **host** with your Neon database host
- **dbname** with your database name
- **username/password** with your Neon credentials

---

### Stop Tracking Credentials

To prevent committing passwords:

```bash
git update-index --skip-worktree src/main/resources/application.properties
```

---

### Verify Setup

**Windows**

```cmd
mvnw.cmd compile
```

**Mac/Linux**

```bash
./mvnw compile
```

Expected output:

```
BUILD SUCCESS
```

---

## Running the Application

### Using Maven Wrapper

**Windows**

```cmd
mvnw.cmd spring-boot:run
```

**Mac/Linux**

```bash
./mvnw spring-boot:run
```

The API will start at:

```
http://localhost:8080
```

You should see:

```
Started CrudApiApplication in X seconds
```

---

## Project Architecture

### Folder Structure

```
src/main/java/com/csc340/crud_api/

CrudApiApplication.java
CharacterController.java
CharacterService.java
CharacterRepository.java
Character.java

src/main/resources/

application.properties
```

### Layered Architecture

```
HTTP Client
(Postman / EchoAPI / Browser)

↓

Controller Layer
Handles HTTP requests

↓

Service Layer
Business logic

↓

Repository Layer
Database access

↓

PostgreSQL Database
```

Benefits:

- Separation of concerns
- Easier debugging
- Clean architecture
- Easier maintenance

---

## API Endpoints

Base URL:

```
http://localhost:8080/characters
```

---

### 1. Get All Characters

```
GET /characters
```

Retrieve all characters in the database.

Example request:

```bash
curl http://localhost:8080/characters
```

Example response:

```json
[
 {
  "characterId": 1,
  "name": "Thor",
  "role": "Vanguard",
  "universe": "Marvel Rivals",
  "description": "God of Thunder",
  "age": 1500
 },
 {
  "characterId": 2,
  "name": "Loki",
  "role": "Strategist",
  "universe": "Marvel Rivals",
  "description": "God of Mischief",
  "age": 1000
 }
]
```

---

### 2. Get Character by ID

```
GET /characters/{id}
```

Example:

```bash
curl http://localhost:8080/characters/1
```

Response:

```
200 OK
```

If not found:

```
404 Not Found
```

---

### 3. Create a Character

```
POST /characters
```

Request body:

```json
{
 "name": "Iron Man",
 "role": "Duelist",
 "universe": "Marvel Rivals",
 "description": "Tech genius with advanced armor",
 "age": 48
}
```

Example request:

```bash
curl -X POST http://localhost:8080/characters \
-H "Content-Type: application/json" \
-d '{
"name":"Iron Man",
"role":"Duelist",
"universe":"Marvel Rivals",
"description":"Tech genius with advanced armor",
"age":48
}'
```

---

### 4. Update Character

```
PUT /characters/{id}
```

Example:

```bash
curl -X PUT http://localhost:8080/characters/1 \
-H "Content-Type: application/json" \
-d '{
"name":"Thor",
"role":"Vanguard",
"universe":"Marvel Rivals",
"description":"God of Thunder updated",
"age":1501
}'
```

If the ID does not exist:

```
404 Not Found
```

---

### 5. Delete Character

```
DELETE /characters/{id}
```

Example:

```bash
curl -X DELETE http://localhost:8080/characters/2
```

Response:

```
204 No Content
```

---

### 6. Filter Characters by Role

```
GET /characters/role/{role}
```

Example:

```bash
curl http://localhost:8080/characters/role/Strategist
```

Returns all characters with the role **Strategist**.

---

### 7. Search Characters by Name

```
GET /characters/search?name={name}
```

Example:

```bash
curl "http://localhost:8080/characters/search?name=Thor"
```

Returns characters whose names contain the substring.

---

## Key Spring Boot Concepts

### @RestController

```java
@RestController
@RequestMapping("/characters")
public class CharacterController { }
```

Marks the class as a REST controller.

---

### HTTP Mapping Annotations

- `@GetMapping` → Retrieve data
- `@PostMapping` → Create data
- `@PutMapping` → Update data
- `@DeleteMapping` → Delete data

---

### Service Layer

```java
@Service
public class CharacterService { }
```

Handles business logic.

---

### Repository Layer

```java
public interface CharacterRepository extends JpaRepository<Character, Long>
```

Handles database operations.

---

### Entity

```java
@Entity
@Table(name="characters")
public class Character { }
```

Maps the Java class to a database table.

---

## Database Schema

### CHARACTERS Table

| Column | Type | Description |
|------|------|-------------|
| character_id | SERIAL | Primary key |
| name | VARCHAR | Character name |
| description | VARCHAR | Character description |
| role | VARCHAR | Character role |
| universe | VARCHAR | Character universe |
| age | INTEGER | Character age |

### Example SQL

```sql
CREATE TABLE characters (
 character_id SERIAL PRIMARY KEY,
 name VARCHAR(255),
 description VARCHAR(255),
 role VARCHAR(100),
 universe VARCHAR(100),
 age INTEGER
);
```

---

## Testing the API

You can test endpoints using:

- Postman
- EchoAPI
- Bruno
- Insomnia

Example:

```
GET http://localhost:8080/characters
```

---

## Common Issues and Solutions

### Issue: Port 8080 already in use

Add to `application.properties`:

```properties
server.port=8081
```

---

### Issue: Database connection error

Solution:

- Verify Neon database connection string
- Check username/password
- Ensure internet access

---

### Issue: 404 Not Found

Possible causes:

- Endpoint URL is incorrect
- Application is not running
- Incorrect controller mapping

Example correct endpoint:

```
http://localhost:8080/characters/role/Strategist
```

---

### Issue: JSON parsing error

Ensure header:

```
Content-Type: application/json
```

Also verify the JSON format is valid.
