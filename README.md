# Character CRUD MVC Application - Spring Boot Demo

A comprehensive MVC application for managing Marvel Rivals character records, built with Spring Boot, Spring Data JPA, PostgreSQL, and FreeMarker. This project demonstrates concepts for building both REST APIs and web interfaces with Spring Boot.

## Table of Contents

- [What is This Project?](#what-is-this-project)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [Running the Application](#running-the-application)
- [Project Architecture](#project-architecture)
- [API Endpoints](#api-endpoints)
- [Web UI Routes](#web-ui-routes)
- [Key Spring Boot Concepts](#key-spring-boot-concepts)
- [Database Schema](#database-schema)
- [Video Demo](#video-demo)

---
## Video Demo

[MVC Demo Video - UNCG OneDrive(Assignment 4)](https://uncg-my.sharepoint.com/:v:/g/personal/g_vulli_uncg_edu/IQA1sidP3Yq_SKMZJUkKouOHAX7rE84z_MKtcnATiQW1lK0?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=QEVXuK)

[Backend Demo Video - UNCG OneDrive](https://uncg-my.sharepoint.com/:v:/g/personal/g_vulli_uncg_edu/IQDlL7pMveRHQJ_IBEXAgo48AX1iFTjTuqI9JRLbfweW19E?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=PkHOli)

---

## What is This Project?

This is a **CRUD MVC Application** (Create, Read, Update, Delete) that manages **Marvel Rivals characters**. It demonstrates:

- How to build a REST API with Spring Boot
- How to build a web interface using Spring MVC
- How to connect to a PostgreSQL database using JPA
- How to structure a Spring Boot application with layers (Controller, Service, Repository)
- How to handle HTTP requests and responses
- How to render web pages with FreeMarker templates
- How to perform database operations

**CRUD** stands for:

- **C**reate - Add new character records
- **R**ead - Retrieve character records
- **U**pdate - Modify existing character records
- **D**elete - Remove character records

The application provides both a **REST API** for programmatic access and a **web interface** for user interaction.

---

## Technology Stack

| Technology          | Version | Purpose                                |
| ------------------- | ------- | -------------------------------------- |
| **Java**            | 25      | Programming language                   |
| **Spring Boot**     | 4.0.3   | Framework for building the application |
| **Spring MVC**      | Latest  | Web framework for handling requests    |
| **FreeMarker**      | Latest  | Template engine for web views          |
| **Spring Data JPA** | Latest  | ORM layer for database access          |
| **Hibernate**       | Latest  | JPA implementation                     |
| **PostgreSQL**      | Latest  | Relational database                    |
| **Maven**           | Latest  | Build and dependency management        |
| **Bootstrap 5**     | 5.3.2   | CSS framework for responsive UI        |

### Java - [Spring ORM with JPA and Hibernate](https://medium.com/@burakkocakeu/jpa-hibernate-and-spring-data-jpa-efa71feb82ac)
- We are using ORM (Object-Relational Mapping) to deal with databases. This is a technique that allows us to interact with a relational database using object-oriented programming principles.
- JPA (Jakarta Persistence, formerly Java Persistence API) is a specification that defines ORM standards in Java. It provides an abstraction layer for ORM frameworks to make concrete implementations.
- Hibernate: Hibernate is a popular ORM framework that implements JPA. It simplifies database operations by mapping Java objects to database tables and handling queries efficiently.
- Spring ORM allows seamless integration of Hibernate and JPA, making database interactions more manageable and reducing boilerplate code.

### Key Dependencies Explained

**spring-boot-starter-data-jpa**: Provides Spring Data JPA for simplified database access through repositories and automatic query generation.

**spring-boot-starter-web**: Provides Spring Web MVC for building both REST APIs and web applications with annotations like `@Controller`, `@GetMapping`, etc.

**spring-boot-starter-freemarker**: Provides FreeMarker template engine for rendering dynamic web pages.

**postgresql**: JDBC driver to connect to PostgreSQL database.

---

## Installation & Setup

### Prerequisites

Before you begin, ensure you have installed:

1. **Java 25 JDK**
   - Download from [Oracle Java](https://www.oracle.com/java/technologies/downloads/) or use a package manager
   - Verify installation: `java -version`

2. **Neon.tech PostgreSQL Database** (Cloud-based, Serverless)
   - This project uses [Neon.tech](https://neon.tech), a serverless PostgreSQL database in the cloud
   - You don't need to install PostgreSQL locally
   - Sign up for a free account at [Neon.tech](https://neon.tech)
   - You only need an internet connection to connect to the database

3. **Git** (optional, for cloning the project)
   - Download from [Git Official Site](https://git-scm.com/)

### About Maven Wrapper

 This project includes the **Maven Wrapper** (`mvnw` on Mac/Linux and `mvnw.cmd` on Windows). This means you **do not need to install Maven separately**. The wrapper automatically downloads the correct Maven version for you.

The Maven Wrapper is a handy tool that ensures everyone working on the project uses the same Maven version, reducing compatibility issues.

### Setup Instructions

1. **Clone or Download the Project**

   ```bash
   git clone <repository-url>
   cd crud-character-api
   ```

2. **Checkout the MVC Branch**

   ```bash
   git checkout feature-mvc
   ```

3. **Install Dependencies**

   The Maven Wrapper will automatically download dependencies from the `pom.xml` file:

   **On Windows**:

   ```cmd
   mvnw.cmd clean install
   ```

   **On Mac/Linux**:

   ```bash
   ./mvnw clean install
   ```

   This command:
   - `clean`: Removes previous build artifacts
   - `install`: Downloads all dependencies and compiles the project
   - First run may take a few minutes as Maven is downloaded

4. **Database Configuration (Neon.tech Serverless PostgreSQL)**

   #### Step 1: Get Your Neon.tech Connection String

   1. Navigate to [Neon.tech](https://neon.tech)
   2. Sign in to your account
   3. In your project dashboard, find your connection string
   4. It will look like: `postgresql://username:password@host:5432/dbname`

   #### Step 2: Stop Tracking `application.properties` Locally

   To prevent accidentally committing your database credentials to Git, use `git skip-worktree` to exclude your local copy:

   ```bash
   git update-index --skip-worktree src/main/resources/application.properties
   ```

   This tells Git to ignore any changes you make to this file locally. You can now safely edit the file without worrying about committing sensitive data.

   #### Step 3: Update Your Connection String

   Edit `src/main/resources/application.properties` and add your Neon.tech PostgreSQL connection string:

   ```properties
   spring.application.name=crud-character-api
   spring.datasource.url=jdbc:postgresql://host:5432/dbname
   spring.datasource.username=your_neon_username
   spring.datasource.password=your_neon_password
   spring.jpa.hibernate.ddl-auto=update

   spring.freemarker.suffix=.ftlh
   spring.freemarker.template-loader-path=classpath:/templates/

   #Log out sql queries
   logging.level.org.hibernate.SQL=DEBUG
   logging.level.org.hibernate.type.descriptor.sql.BasicBinder=TRACE
   logging.level.org.hibernate.orm.jdbc.bind=TRACE
   ```

   Replace with your actual Neon.tech credentials:
   - `host`: Your Neon.tech host (e.g., `some-cool-projectName-pooler.c-7.us-east-1.aws.neon.tech`)
   - `dbname`: Your database name (usually `neondb`)
   - `your_neon_username`: Your Neon.tech username
   - `your_neon_password`: Your Neon.tech password

   #### Example Connection String

   ```properties
   spring.datasource.url=jdbc:postgresql://ep-cool-cherry-ai9ih0ua-pooler.c-7.us-east-1.aws.neon.tech:5432/neondb
   spring.datasource.username=neondb_owner
   spring.datasource.password=your_password_here
   ```

   #### To Resume Tracking the File

   If you need to revert and track the file again:

   ```bash
   git update-index --no-skip-worktree src/main/resources/application.properties
   ```

   **Important Note**: This approach (using `git skip-worktree`) keeps credentials safe locally while the file can be tracked in Git. However, in production environments, database credentials should be managed using environment variables or cloud-based secret management services like AWS Secrets Manager or Azure Key Vault.

5. **Verify Setup**

   **On Windows (PowerShell)**:

   ```cmd
   mvnw.cmd compile
   ```

   **On Mac/Linux (Bash/zsh)**:

   ```bash
   ./mvnw compile
   ```

   If successful, you'll see `BUILD SUCCESS` at the end.

---

## Running the Application

### Using Maven Wrapper

**On Windows**:

```cmd
mvnw.cmd spring-boot:run
```

**On Mac/Linux**:

```bash
./mvnw spring-boot:run
```

The application will start on **http://localhost:8080**

You should see output like:

```
Started CrudCharacterApiApplication in 4.532 seconds
```

### Using Java (After Building)

Alternatively, after building the project, you can run the compiled JAR file:

```bash
java -jar target/crud-character-api-0.0.1-SNAPSHOT.jar
```

### Using VS Code GUI

1. **Open the Project**: Open the project folder in VS Code
2. **Install Extension**: Install the "Extension Pack for Java" (by Microsoft) if not already installed
3. **Run the Application**:
   - Go to the Explorer view (left sidebar)
   - Navigate to `src > main > java > com > csc340 > crud_api > CrudCharacterApiApplication.java`
   - Right-click on `CrudCharacterApiApplication.java`
   - Select **"Run Java"** or click the ▶️ **Run** button that appears above the class definition
4. **View Output**: The terminal will show the Spring Boot startup messages and confirm the application is running

### Using IntelliJ IDEA GUI

1. **Open the Project**: Open the project folder in IntelliJ IDEA (it will recognize it as a Maven project)
2. **Configure JDK**:
   - Go to **File → Project Structure → Project**
   - Set the Project SDK to Java 25
3. **Run the Application**:
   - Navigate to `src > main > java > com > csc340 > crud_api > CrudCharacterApiApplication.java` in the Project Explorer
   - Right-click on `CrudCharacterApiApplication.java`
   - Select **"Run 'CrudCharacterApiApplication.main()'"** or click the ▶️ **Run** button next to the class name
4. **View Output**: The Run window at the bottom will show Spring Boot startup messages and confirm the application is running

**Alternative: Using the Run Menu**:
- Go to **Run → Run...** and select `CrudCharacterApiApplication` from the list
- Or use the keyboard shortcut: **Shift+F10** (Windows) or **Ctrl+R** (Mac)

### Stopping the Application

Press `Ctrl+C` in your terminal to stop the running application. If using IDE GUI, click the ⏹️ **Stop** button in the Run/Debug toolbar.

---

## Project Architecture

### Folder Structure

```
src/main/java/com/csc340/crud_api/

CrudCharacterApiApplication.java      # Entry point of the application
CharacterController.java              # REST API controller for JSON responses
CharacterMvcController.java           # Web UI controller for HTML views
HomeController.java                   # Handles / and /about routes
CharacterService.java                 # Business logic layer
CharacterRepository.java              # Database access layer
Character.java                        # Entity/Model class

src/main/resources/

application.properties                # Configuration file
static/
    styles.css                        # Static CSS stylesheet
templates/                            # FreeMarker HTML templates
    character-list.ftlh               # Gallery of all characters
    character-details.ftlh            # Single character detail view
    character-create.ftlh             # Create new character form
    character-update.ftlh             # Update existing character form
    about.ftlh                        # About page
```

### Architectural Pattern: **MVC (Model-View-Controller)**

This project follows the MVC architectural pattern with layered architecture:

```
┌─────────────────────────────────────┐
│   HTTP Client (Browser/API Client)  │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Controller Layer                 │
│  (CharacterController &             │
│   CharacterMvcController)           │
│  - Handles HTTP requests            │
│  - API: Returns JSON responses      │
│  - UI: Returns view names & models  │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Service Layer                    │
│  (CharacterService)                 │
│  - Contains business logic          │
│  - Processes data from repositories │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Repository Layer                 │
│  (CharacterRepository)              │
│  - Communicates with database       │
│  - Performs CRUD operations         │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Model Layer                      │
│  (Character Entity)                 │
│  - Data representation              │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    View Layer                       │
│  (FreeMarker Templates)             │
│  - HTML rendering for web UI        │
└────────────────┬────────────────────┘
                 │
┌────────────────▼────────────────────┐
│    Database                         │
│  (PostgreSQL via Neon)              │
└─────────────────────────────────────┘
```

### Why This Architecture?

- **Separation of Concerns**: Each layer has a specific responsibility
- **Reusability**: Service layer logic can be reused by multiple controllers
- **Testability**: Each layer can be tested independently
- **Maintainability**: Changes in one layer don't require changes in others

---

## API Endpoints

All endpoints use the base URL: `http://localhost:8080/api/characters`

---

### 1. Get All Characters

```http
GET /api/characters
```

**Description**: Retrieve a list of all characters in the database.

**Parameters**: None

**Response**:

- **Status Code**: `200 OK`
- **Body**: Array of Character objects

#### Example Request

```bash
curl http://localhost:8080/api/characters
```

#### Example Response (Status: 200 OK)

```json
[
  {
    "characterId": 1,
    "name": "Angela",
    "description": "Melee Vanguard with strong resilience.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 300.0
  },
  {
    "characterId": 2,
    "name": "Captain America",
    "description": "Shield-wielding melee hero focused on defense and leadership.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 101.0
  }
]
```

---

### 2. Get Character by ID

```http
GET /api/characters/{id}
```

**Description**: Retrieve a single character by their ID.

**Path Parameters**:

- `id` (Long, required): The unique identifier of the character

**Response**:

- **Status Code**: `200 OK` (if found) or `404 Not Found` (if not found)
- **Body**: Character object

#### Example Request

```bash
curl http://localhost:8080/api/characters/1
```

#### Example Response (Status: 200 OK)

```json
{
  "characterId": 1,
  "name": "Angela",
  "description": "Melee Vanguard with strong resilience.",
  "role": "Vanguard",
  "universe": "Marvel Rivals",
  "age": 300.0
}
```

#### Example Response if not found (Status: 404 Not Found)

```
(Empty body)
```

---

### 3. Create a New Character

```http
POST /api/characters
```

**Description**: Create a new character record in the database.

**Request Body**: Character object with the following fields:

- `name` (String, required): Character's name
- `description` (String, required): Character's description
- `role` (String, optional): Character's role (Vanguard, Duelist, Strategist)
- `universe` (String, optional): Character's universe
- `age` (Double, optional): Character's age

**Response**:

- **Status Code**: `200 OK` (if created successfully)
- **Body**: Created Character object with assigned `characterId`

#### Example Request

```bash
curl -X POST http://localhost:8080/api/characters \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Thor",
    "description": "God of Thunder",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 1550
  }'
```

#### Example Response (Status: 200 OK)

```json
{
  "characterId": 11,
  "name": "Thor",
  "description": "God of Thunder",
  "role": "Vanguard",
  "universe": "Marvel Rivals",
  "age": 1550.0
}
```

---

### 4. Update a Character

```http
PUT /api/characters/{id}
```

**Description**: Update an existing character's information.

**Path Parameters**:

- `id` (Long, required): The ID of the character to update

**Request Body**: Character object with fields to update:

- `name` (String): Updated name
- `description` (String): Updated description
- `role` (String): Updated role
- `universe` (String): Updated universe
- `age` (Double): Updated age

**Response**:

- **Status Code**: `200 OK` (if updated successfully) or `404 Not Found` (if character not found)
- **Body**: Updated Character object

#### Example Request

```bash
curl -X PUT http://localhost:8080/api/characters/11 \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Thor",
    "description": "God of Thunder updated",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 1551
  }'
```

#### Example Response (Status: 200 OK)

```json
{
  "characterId": 11,
  "name": "Thor",
  "description": "God of Thunder updated",
  "role": "Vanguard",
  "universe": "Marvel Rivals",
  "age": 1551.0
}
```

---

### 5. Delete a Character

```http
DELETE /api/characters/{id}
```

**Description**: Delete an existing character record from the database.

**Path Parameters**:

- `id` (Long, required): The ID of the character to delete

**Response**:

- **Status Code**: `204 No Content` (successful deletion)
- **Body**: Empty

#### Example Request

```bash
curl -X DELETE http://localhost:8080/api/characters/11
```

#### Example Response (Status: 204 No Content)

```
(Empty body)
```

---

### 6. Filter Characters by Role

```http
GET /api/characters/role/{role}
```

**Description**: Retrieve all characters with a specific role.

**Path Parameters**:

- `role` (String, required): The role to filter by (Vanguard, Duelist, or Strategist)

**Response**:

- **Status Code**: `200 OK`
- **Body**: Array of Character objects

#### Example Request

```bash
curl http://localhost:8080/api/characters/role/Vanguard
```

#### Example Response (Status: 200 OK)

```json
[
  {
    "characterId": 1,
    "name": "Angela",
    "description": "Melee Vanguard with strong resilience.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 300.0
  },
  {
    "characterId": 2,
    "name": "Captain America",
    "description": "Shield-wielding melee hero focused on defense and leadership.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 101.0
  }
]
```

---

### 7. Search Characters by Name

```http
GET /api/characters/search?name={name}
```

**Description**: Search for characters by name (partial match supported, case-insensitive).

**Query Parameters**:

- `name` (String, required): The name or part of the name to search for

**Response**:

- **Status Code**: `200 OK`
- **Body**: Array of matched Character objects

#### Example Request

```bash
curl "http://localhost:8080/api/characters/search?name=dead"
```

#### Example Response (Status: 200 OK)

```json
[
  {
    "characterId": 4,
    "name": "Deadpool",
    "description": "Regenerative melee fighter with chaotic attacks.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 35.0
  }
]
```

---

### 8. Filter Characters by Age

```http
GET /api/characters/age/{age}
```

**Description**: Retrieve all characters older than the specified age value.

**Path Parameters**:

- `age` (Double, required): The minimum age threshold

**Response**:

- **Status Code**: `200 OK`
- **Body**: Array of Character objects older than the specified age

#### Example Request

```bash
curl http://localhost:8080/api/characters/age/1000
```

#### Example Response (Status: 200 OK)

```json
[
  {
    "characterId": 5,
    "name": "Groot",
    "description": "Melee tank capable of soaking damage and crowd control.",
    "role": "Vanguard",
    "universe": "Marvel Rivals",
    "age": 5000.0
  }
]
```

---

## Web UI Routes

The application also provides a web interface for user interaction. All web routes use the base URL: `http://localhost:8080/characters`

---

### 1. Home / View All Characters

```http
GET /
GET /characters
```

**Description**: Display a gallery of all characters as Bootstrap cards. Each card shows the character's name, role badge, universe badge, description, and action buttons for Details, Edit, and Delete.

**Response**: HTML gallery page showing all characters.

---

### 2. View Character Details

```http
GET /characters/{id}
```

**Description**: Display detailed information for a specific character.

**Path Parameters**:

- `id` (Long, required): The unique identifier of the character

**Response**: HTML page with full character details including characterId, name, description, role, universe, and age. Shows an error message if the ID does not exist.

---

### 3. Add New Character Form

```http
GET /characters/new
```

**Description**: Display a blank form to create a new character.

**Response**: HTML form page with input fields for name, description, role, universe, and age.

---

### 4. Save New Character

```http
POST /characters/save
```

**Description**: Process the create form submission and save the new character to the database.

**Form Data**:

- `name` (String, required): Character's name
- `description` (String, required): Character's description
- `role` (String, optional): Character's role
- `universe` (String, optional): Character's universe
- `age` (Double, optional): Character's age

**Response**: Redirect to the new character's details page.

---

### 5. Update Character Form

```http
GET /characters/updateForm/{id}
```

**Description**: Display the update form pre-populated with the existing character's current data from the database.

**Path Parameters**:

- `id` (Long, required): The ID of the character to update

**Response**: HTML form page with all fields pre-filled.

---

### 6. Save Updated Character

```http
POST /characters/update/{id}
```

**Description**: Process the update form submission and save the changes to the database.

**Path Parameters**:

- `id` (Long, required): The ID of the character to update

**Form Data**: Same fields as the create form.

**Response**: Redirect to the updated character's details page.

---

### 7. Delete Character

```http
GET /characters/delete/{id}
```

**Description**: Delete the character with the given ID from the database and redirect to the gallery.

**Path Parameters**:

- `id` (Long, required): The ID of the character to delete

**Response**: Redirect to the character gallery page.

---

### 8. Search Characters by Name  Extra Credit

```http
GET /characters/search?name={name}
```

**Description**: Search for characters by name and display matching results in the gallery view. The search bar is available in the navbar on every page of the application.

**Query Parameters**:

- `name` (String, required): The name or partial name to search for

**Response**: HTML gallery page showing only the matching characters with a filter info banner.

---

### 9. Filter Characters by Role  Extra Credit

```http
GET /characters/role/{role}
```

**Description**: Display characters filtered by role in the gallery view. The role filter input is available on the gallery page. Accepted values are Vanguard, Duelist, or Strategist.

**Path Parameters**:

- `role` (String, required): The role to filter by

**Response**: HTML gallery page showing only characters with the specified role with a filter info banner.

---

### 10. About Page

```http
GET /about
```

**Description**: Display information about the application, its features, and the technology stack used to build it.

**Response**: HTML page with project overview and tech stack details.

---

## Key Spring Boot Concepts

### What is Spring Boot?

Spring Boot is a framework that simplifies building production-ready Spring applications. It provides:

- Auto-configuration of Spring application based on jar dependencies
- Embedded web server (Tomcat) - no need to deploy WAR files
- Convention over configuration - sensible defaults
- Easy integration with databases and other services

### MVC (Model-View-Controller) Pattern

Spring MVC is a web framework that follows the MVC architectural pattern:

- **Model**: Represents the data (Character entity, service responses)
- **View**: The presentation layer (FreeMarker templates that render HTML)
- **Controller**: Handles user requests, processes them, and returns appropriate responses

```java
@Controller  // For web views
@RequestMapping("/characters")
public class CharacterMvcController {
  @GetMapping
  public String getAllCharacters(Model model) {
    model.addAttribute("characterList", service.getAllCharacters());
    return "character-list";  // Returns view name
  }
}

@RestController  // For API responses
@RequestMapping("/api/characters")
public class CharacterController {
  @GetMapping
  public List<Character> getAll() {
    return service.getAllCharacters();
  }
}
```

### @Controller vs @RestController

- `@Controller`: Returns view names (for web pages) and uses Model to pass data to FreeMarker templates
- `@RestController`: Returns data directly (JSON) - equivalent to `@Controller` + `@ResponseBody`

### FreeMarker Templates

FreeMarker is a server-side template engine for web applications:

```html
<#list characterList as character>
  <div class="card">
    <h5>${character.name}</h5>
    <p>${character.role}</p>
    <a href="/characters/${character.characterId?c}">View Details</a>
  </div>
</#list>
```

- `<#list collection as item>`: Iterates over collections
- `${variable}`: Displays variable content
- `<#if condition>`: Conditional rendering
- `${value!"default"}`: Shows a default value if null

### @Controller and @RequestMapping

```java
@Controller
@RequestMapping("/characters")         // Web UI controller
public class CharacterMvcController { }

@RestController
@RequestMapping("/api/characters")     // API controller
public class CharacterController { }
```

- `@Controller`: Handles web requests, returns view names for HTML rendering
- `@RestController`: Handles API requests, returns data (JSON) directly
- `@RequestMapping`: Defines the base URL path for all methods in the controller

### HTTP Mapping Annotations

- `@GetMapping`: Handles GET requests (retrieve data, show forms, delete in MVC)
- `@PostMapping`: Handles POST requests (create and update in MVC forms)
- `@PutMapping`: Handles PUT requests (update in REST API)
- `@DeleteMapping`: Handles DELETE requests (delete in REST API)

### @Service and Dependency Injection

```java
@Service
public class CharacterService {
  private final CharacterRepository repository;

  public CharacterService(CharacterRepository repository) {
    this.repository = repository;
  }
}
```

- `@Service`: Marks a class as a service component (business logic)
- Constructor injection: Dependencies are provided through the constructor (best practice)

### Spring Data JPA Repository

```java
public interface CharacterRepository extends JpaRepository<Character, Long> {
  List<Character> findByRole(String role);
  List<Character> findByNameContainingIgnoreCase(String name);
}
```

- `JpaRepository<Character, Long>`: Provides CRUD methods automatically
- Spring automatically generates implementations for custom finder methods
- `findByRole` generates a query like: `SELECT * FROM characters WHERE role = ?`

### @Entity and JPA Annotations

```java
@Entity
@Table(name = "characters")
public class Character {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long characterId;
}
```

- `@Entity`: Marks this class as a database table
- `@Table(name = "characters")`: Specifies the table name
- `@Id`: Marks the primary key field
- `@GeneratedValue`: Auto-generates IDs (database handles increment)

### ResponseEntity

```java
public ResponseEntity<Character> getCharacterById(@PathVariable Long id) {
  return service.getCharacterById(id)
      .map(ResponseEntity::ok)
      .orElse(ResponseEntity.notFound().build());
}
```

`ResponseEntity` provides full control over HTTP responses including:

- Status codes (200, 404, 201, etc.)
- Response headers
- Response body

---

## Database Schema

The application uses a single table to store character data:

### CHARACTERS Table

| Column         | Type             | Constraints | Description                         |
| -------------- | ---------------- | ----------- | ----------------------------------- |
| `character_id` | SERIAL           | PRIMARY KEY | Auto-incrementing unique identifier |
| `name`         | VARCHAR(255)     | NOT NULL    | Character's name                    |
| `description`  | VARCHAR(255)     | NOT NULL    | Character's description             |
| `role`         | VARCHAR(100)     | Can be NULL | Vanguard, Duelist, or Strategist    |
| `universe`     | VARCHAR(100)     | Can be NULL | e.g. Marvel Rivals, Xmen            |
| `age`          | DOUBLE PRECISION | Can be NULL | Character's age                     |

### SQL (for reference)

```sql
CREATE TABLE characters (
  character_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  role VARCHAR(100),
  universe VARCHAR(100),
  age DOUBLE PRECISION
);
```

**Note**: This schema is automatically created by Hibernate based on the entity class when `spring.jpa.hibernate.ddl-auto=update` is set in `application.properties`.

---

## Testing the API and Web UI

### Testing the REST API

#### Using Postman/Echo API/Bruno (GUI)

1. Create a new request
2. Select HTTP method (GET, POST, PUT, DELETE)
3. Enter URL (e.g., `http://localhost:8080/api/characters`)
4. If POST/PUT, go to "Body" tab → select "raw" and "JSON"
5. Enter JSON data and click "Send"

### Testing the Web Interface

#### Using a Web Browser

1. Open your web browser
2. Navigate to `http://localhost:8080/characters`
3. Use the web interface to:
   - View all characters in the gallery
   - Click a character card to view its details
   - Add new characters using the Add New button
   - Edit existing characters using the Edit button
   - Delete characters using the Delete button
   - Search by name using the navbar search bar
   - Filter by role using the role filter on the gallery page

The web interface provides a user-friendly way to interact with the character data without needing API tools.

---

## Common Issues and Solutions

### Issue: Ambiguous mapping error on startup

**Solution**: Make sure `CharacterController` uses `@RequestMapping("/api/characters")` and `CharacterMvcController` uses `@RequestMapping("/characters")`. They must not share the same path.

---

### Issue: WhiteLabel Error (404) when navigating to a page

**Solution**: Every page must be returned by a controller `@GetMapping`. Check that `CharacterMvcController` and `HomeController` have mappings for every link in your templates.

---

### Issue: Form submission not saving data correctly

**Solution**: Form input `name` attributes must match Character field names exactly — `name`, `description`, `role`, `universe`, `age`.

---

### Issue: FreeMarker template not found

**Solution**: Ensure all `.ftlh` files are in `src/main/resources/templates/` and `application.properties` includes:

```properties
spring.freemarker.suffix=.ftlh
spring.freemarker.template-loader-path=classpath:/templates/
```

---

### Issue: Port 8080 is already in use

**Solution**: Change the port in `application.properties`:

```properties
server.port=8081
```

Then access the application at `http://localhost:8081`

---

### Issue: Database connection refused

**Solution**:
- Ensure you have internet access to connect to Neon.tech (the database is cloud-based and always running)
- Verify your connection string is correct in `application.properties`
- Check that your username and password from Neon.tech are correct
- Make sure the host/endpoint is reachable (not blocked by a firewall)

---

### Issue: JSON parsing errors in POST/PUT requests

**Solution**:
- Ensure `Content-Type: application/json` header is set
- Verify JSON syntax is valid (use an online JSON validator)
- Check all required fields are included (`name` and `description` are required)

---




