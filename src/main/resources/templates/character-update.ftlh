<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Update Character"}</title>
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
                <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
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

<div class="container mt-4">

    <#if character??>
    <a href="/characters/${character.characterId?c}" class="btn btn-outline-secondary mb-3">
        <i class="bi bi-arrow-left me-1"></i>Back to Details
    </a>

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-warning text-dark">
                    <h2 class="mb-0">
                        <i class="bi bi-pencil-square me-2"></i>${title!"Update Character"}
                    </h2>
                </div>
                <div class="card-body">
                    <form action="/characters/update/${character.characterId?c}" method="post">

                        <input type="hidden" name="characterId" value="${character.characterId?c}">

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name"
                                   value="${character.name}" required>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label fw-semibold">Description <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="description" name="description"
                                      rows="3" required>${character.description!""}</textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="role" class="form-label fw-semibold">Role</label>
                                <input type="text" class="form-control" id="role" name="role"
                                       value="${character.role!""}">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="universe" class="form-label fw-semibold">Universe</label>
                                <input type="text" class="form-control" id="universe" name="universe"
                                       value="${character.universe!""}">
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="age" class="form-label fw-semibold">Age</label>
                            <input type="number" class="form-control" id="age" name="age"
                                   step="0.1" min="0" value="${character.age}">
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-warning">
                                <i class="bi bi-save me-1"></i>Update Character
                            </button>
                            <a href="/characters/${character.characterId?c}" class="btn btn-outline-secondary">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <#else>
    <div class="alert alert-danger">
        <i class="bi bi-x-circle me-2"></i>Character not found.
    </div>
    <a href="/characters" class="btn btn-secondary">Back to List</a>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>