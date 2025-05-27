<style>
    .navbar {
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        padding: 10px 15px;
        margin: 20px;
    }
    .navbar .navbar-brand {
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        margin: 0;
    }
    .navbar .container-fluid {
        position: relative;
    }
</style>
<nav class="navbar bg-body-tertiary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Easy Bank</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Guia de Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="inicio.jsp">Menu inicial</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="extrato_financeiro.jsp">Extrato financeiro</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Transferecias</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Investimentos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Sair</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Extras
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Sobre</a></li>
                            <li><a class="dropdown-item" href="#">Politica e Privacidade</a></li>
                            <li><a class="dropdown-item" href="#">Easy-Bank</a></li>
                            <li><a class="dropdown-item" href="#"></a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex mt-3" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</nav>