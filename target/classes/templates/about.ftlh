<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>body { background-color: #f8f9fa; }</style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="/characters">
            <i class="bi bi-people-fill me-2"></i>Character DB
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="/characters">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/characters/new">Add Character</a></li>
                <li class="nav-item"><a class="nav-link active" href="/about">About</a></li>
            </ul>
            <form class="d-flex" action="/characters/search" method="get">
                <input class="form-control me-2" type="search" name="name" placeholder="Search by name...">
                <button class="btn btn-outline-light" type="submit">
                    <i class="bi bi-search"></i>
                </button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-dark text-white">
                    <h2 class="mb-0"><i class="bi bi-info-circle me-2"></i>About Character Database</h2>
                </div>
                <div class="card-body">
                    <p class="lead">
                        Character Database is a full-stack web application built with
                        <strong>Spring Boot</strong>, <strong>FreeMarker</strong>, and
                        <strong>PostgreSQL (Neon)</strong>.
                    </p>
                    <hr>
                    <h5>Features</h5>
                    <ul>
                        <li>View all characters in an interactive gallery</li>
                        <li>View detailed information for each character</li>
                        <li>Add new characters with a form</li>
                        <li>Edit existing characters</li>
                        <li>Delete characters</li>
                        <li>Search characters by name</li>
                        <li>Filter characters by role</li>
                    </ul>
                    <hr>
                    <h5>Tech Stack</h5>
                    <ul>
                        <li><strong>Backend:</strong> Java 17, Spring Boot, Spring Data JPA</li>
                        <li><strong>Views:</strong> FreeMarker templates (.ftlh)</li>
                        <li><strong>Frontend:</strong> Bootstrap 5, Bootstrap Icons</li>
                        <li><strong>Database:</strong> PostgreSQL via Neon</li>
                    </ul>
                    <hr>
                    <p class="text-muted mb-0">CSC 340 — Assignment #4 MVC App</p>
                </div>
                <div class="card-footer">
                    <a href="/characters" class="btn btn-dark">
                        <i class="bi bi-arrow-left me-1"></i>Go to Gallery
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>