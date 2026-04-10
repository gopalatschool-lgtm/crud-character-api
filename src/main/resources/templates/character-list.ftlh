<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!"Character Database"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; }
        .navbar-brand { font-weight: 700; letter-spacing: 1px; }
        .card { transition: transform 0.2s, box-shadow 0.2s; }
        .card:hover { transform: translateY(-4px); box-shadow: 0 8px 20px rgba(0,0,0,0.15) !important; }
    </style>
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
                <li class="nav-item"><a class="nav-link active" href="/characters">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/characters/new">Add Character</a></li>
                <li class="nav-item"><a class="nav-link" href="/about">About</a></li>
            </ul>
            <!-- Search by name -->
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

    <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
        <h1 class="h3 mb-0">${title!"All Characters"}</h1>
        <div class="d-flex gap-2 align-items-center flex-wrap">

            <!-- Search by ID -->
            <div class="input-group" style="width:210px;">
                <input type="number" class="form-control" id="idInput" placeholder="Search by ID..." min="1">
                <button class="btn btn-outline-secondary" onclick="searchById()">
                    <i class="bi bi-hash"></i>
                </button>
            </div>

            <!-- Filter by role -->
            <div class="input-group" style="width:210px;">
                <input type="text" class="form-control" id="roleInput" placeholder="Filter by role...">
                <button class="btn btn-outline-secondary" onclick="filterByRole()">
                    <i class="bi bi-funnel"></i>
                </button>
            </div>

            <!-- Filter by age -->
            <div class="input-group" style="width:210px;">
                <input type="number" class="form-control" id="ageInput" placeholder="Older than age...">
                <button class="btn btn-outline-secondary" onclick="filterByAge()">
                    <i class="bi bi-hourglass-split"></i>
                </button>
            </div>

            <a href="/characters/new" class="btn btn-primary">
                <i class="bi bi-plus-circle me-1"></i>Add New
            </a>
            <#if filterInfo??>
                <a href="/characters" class="btn btn-outline-secondary">
                    <i class="bi bi-x-circle me-1"></i>Clear
                </a>
            </#if>
        </div>
    </div>

    <#if filterInfo??>
        <div class="alert alert-info py-2">
            <i class="bi bi-info-circle me-1"></i>${filterInfo}
        </div>
    </#if>

    <#if characterList?has_content>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <#list characterList as character>
            <div class="col">
                <div class="card h-100 shadow-sm border-0">
                    <div class="card-header bg-dark text-white">
                        <h5 class="card-title mb-0">${character.name}</h5>
                    </div>
                    <div class="card-body">
                        <div class="mb-2">
                            <span class="badge bg-primary">${character.role!""}</span>
                            <span class="badge bg-secondary ms-1">${character.universe!""}</span>
                        </div>
                        <p class="card-text text-muted">${character.description!""}</p>
                        <p class="small text-muted mb-0"><i class="bi bi-calendar me-1"></i>Age: ${character.age}</p>
                    </div>
                    <div class="card-footer bg-white border-0 d-flex gap-2">
                        <a href="/characters/${character.characterId?c}" class="btn btn-sm btn-primary">
                            <i class="bi bi-eye me-1"></i>Details
                        </a>
                        <a href="/characters/updateForm/${character.characterId?c}" class="btn btn-sm btn-warning">
                            <i class="bi bi-pencil me-1"></i>Edit
                        </a>
                        <a href="/characters/delete/${character.characterId?c}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Delete ${character.name}? This cannot be undone.')">
                            <i class="bi bi-trash me-1"></i>Delete
                        </a>
                    </div>
                </div>
            </div>
            </#list>
        </div>
    <#else>
        <div class="alert alert-warning mt-4">
            <i class="bi bi-exclamation-triangle me-2"></i>No characters found.
            <a href="/characters/new" class="alert-link ms-2">Add one now!</a>
        </div>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function searchById() {
        const id = document.getElementById('idInput').value.trim();
        if (id) window.location.href = '/characters/' + encodeURIComponent(id);
    }
    document.getElementById('idInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') searchById();
    });

    function filterByRole() {
        const role = document.getElementById('roleInput').value.trim();
        if (role) window.location.href = '/characters/role/' + encodeURIComponent(role);
    }
    document.getElementById('roleInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') filterByRole();
    });

    function filterByAge() {
        const age = document.getElementById('ageInput').value.trim();
        if (age) window.location.href = '/characters/age/' + encodeURIComponent(age);
    }
    document.getElementById('ageInput').addEventListener('keypress', function(e) {
        if (e.key === 'Enter') filterByAge();
    });
</script>

</body>
</html>