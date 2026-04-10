<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Character</title>
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
                <li class="nav-item"><a class="nav-link active" href="/characters/new">Add Character</a></li>
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

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-0">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0"><i class="bi bi-plus-circle me-2"></i>Add New Character</h2>
                </div>
                <div class="card-body">
                    <p class="text-muted small mb-3"><span class="text-danger">*</span> All fields are required.</p>
                    <form action="/characters/save" method="post" class="needs-validation" novalidate>

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name"
                                   placeholder="Character name" required>
                            <div class="invalid-feedback">Please fill in the character name.</div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label fw-semibold">Description <span class="text-danger">*</span></label>
                            <textarea class="form-control" id="description" name="description"
                                      rows="3" placeholder="Brief description of the character" required></textarea>
                            <div class="invalid-feedback">Please fill in the description.</div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="role" class="form-label fw-semibold">Role <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="role" name="role"
                                       placeholder="e.g. Vanguard, Duelist, Strategist" required>
                                <div class="invalid-feedback">Please fill in the role.</div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="universe" class="form-label fw-semibold">Universe <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="universe" name="universe"
                                       placeholder="e.g. Marvel Rivals, Xmen" required>
                                <div class="invalid-feedback">Please fill in the universe.</div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="age" class="form-label fw-semibold">Age <span class="text-danger">*</span></label>
                            <input type="number" class="form-control" id="age" name="age"
                                   step="0.1" min="0" placeholder="0" required>
                            <div class="invalid-feedback">Please fill in the age.</div>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary">
                                <i class="bi bi-save me-1"></i>Save Character
                            </button>
                            <a href="/characters" class="btn btn-outline-secondary">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const form = document.querySelector('.needs-validation');
    form.addEventListener('submit', function(e) {
        if (!form.checkValidity()) {
            e.preventDefault();
            e.stopPropagation();
        }
        form.classList.add('was-validated');
    });
</script>
</body>
</html>