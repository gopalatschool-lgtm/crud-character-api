<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Character Details"}</title>
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
    <a href="/characters" class="btn btn-outline-secondary mb-3">
        <i class="bi bi-arrow-left me-1"></i>Back to List
    </a>

    <#if character??>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                    <h2 class="mb-0">${character.name}</h2>
                    <span class="badge bg-primary fs-6">${character.role!""}</span>
                </div>
                <div class="card-body">
                    <dl class="row mb-0">
                        <dt class="col-sm-3 text-muted">Character ID</dt>
                        <dd class="col-sm-9">${character.characterId?c}</dd>

                        <dt class="col-sm-3 text-muted">Name</dt>
                        <dd class="col-sm-9">${character.name}</dd>

                        <dt class="col-sm-3 text-muted">Description</dt>
                        <dd class="col-sm-9">${character.description!""}</dd>

                        <dt class="col-sm-3 text-muted">Role</dt>
                        <dd class="col-sm-9">
                            <a href="/characters/role/${character.role!""}" class="badge bg-primary text-decoration-none">
                                ${character.role!"N/A"}
                            </a>
                        </dd>

                        <dt class="col-sm-3 text-muted">Universe</dt>
                        <dd class="col-sm-9">
                            <span class="badge bg-secondary">${character.universe!"N/A"}</span>
                        </dd>

                        <dt class="col-sm-3 text-muted">Age</dt>
                        <dd class="col-sm-9">${character.age}</dd>
                    </dl>
                </div>
                <div class="card-footer bg-white border-top d-flex gap-2">
                    <a href="/characters/updateForm/${character.characterId?c}" class="btn btn-warning">
                        <i class="bi bi-pencil-square me-1"></i>Edit
                    </a>
                    <a href="/characters/delete/${character.characterId?c}"
                       class="btn btn-danger"
                       onclick="return confirm('Delete ${character.name}? This cannot be undone.')">
                        <i class="bi bi-trash me-1"></i>Delete
                    </a>
                </div>
            </div>
        </div>
    </div>
    <#else>
    <div class="alert alert-danger">
        <i class="bi bi-x-circle me-2"></i>Character not found. The ID may not exist.
    </div>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>