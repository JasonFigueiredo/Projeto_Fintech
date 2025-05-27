<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(180deg, #90ee90, rgb(36, 179, 236));
            background-repeat: no-repeat;
            background-size: cover;
            min-height: 100vh;
        }
    </style>
</head>

<body>
<div class="container text-center my-3">
    <h1 class="display-1 fw-bold" style="margin-top:50px; color: #fff; text-shadow: 1px 1px 8px rgba(0,0,0,0.15);">
        Easy Bank</h1>
    <h2 class="fw-light" style="color: #fff; text-shadow: 1px 1px 8px rgba(0,0,0,0.12);"><strong>"Simplificando seu
        futuro financeiro"</strong></h2>
</div>
<div class="container d-flex justify-content-center" style="margin-top:50px;">
    <div class="card mx-auto" style="max-width: 500px; padding-left:50px; padding-right:50px;">
        <div class="card-body">
            <form method="post" action="login.jsp" class="text-start">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Seu endereço de E-mail:</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                           required>
                    <div id="emailHelp" class="form-text">Você não deve compartilhar essas informações</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Sua Senha:</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <div class="d-flex justify-content-center mb-3">
                    <button type="submit" class="btn btn-primary w-100"
                            style="background: linear-gradient(90deg, #90ee90, rgb(36,179,236)); border: none;"
                            id="loginBtn" disabled
                            onclick="window.location.href='inicio.jsp'; return false;">
                        Fazer Login
                    </button>
                </div>
                <script>
                    const emailInput = document.getElementById('exampleInputEmail1');
                    const passwordInput = document.getElementById('exampleInputPassword1');
                    const checkInput = document.getElementById('exampleCheck1');
                    const loginBtn = document.getElementById('loginBtn');

                    function validateFields() {
                        if (
                            emailInput.value.trim() !== '' &&
                            passwordInput.value.trim() !== '' &&
                            checkInput.checked
                        ) {
                            loginBtn.disabled = false;
                        } else {
                            loginBtn.disabled = true;
                        }
                    }

                    emailInput.addEventListener('input', validateFields);
                    passwordInput.addEventListener('input', validateFields);
                    checkInput.addEventListener('change', validateFields);
                </script>
                <div class="d-flex justify-content-center mb-3">
                    <button type="submit" class="btn btn-primary w-100"
                            style="background: linear-gradient(90deg, #24b3ec, rgb(144,238,144)); border: none;"
                            onclick="window.location.href='cadastro.jsp'; return false;">
                        Fazer Cadastro
                    </button>
                </div>
                <div class="text-center mb-3">
                    <span>Ou entre com:</span>
                </div>
                <div class="d-flex justify-content-center gap-2 mb-3">
                    <a href="https://accounts.google.com/" class="btn btn-light border" target="_blank">
                        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg"
                             alt="Google" width="20" height="20" style="vertical-align:middle; margin-right:6px;">
                        Google
                    </a>
                    <a href="https://appleid.apple.com/" class="btn btn-light border" target="_blank">
                        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg"
                             alt="Apple" width="20" height="20" style="vertical-align:middle; margin-right:6px;">
                        Apple
                    </a>
                    <a href="https://www.linkedin.com/" class="btn btn-light border" target="_blank">
                        <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg"
                             alt="LinkedIn" width="20" height="20" style="vertical-align:middle; margin-right:6px;">
                        LinkedIn
                    </a>
                </div>
                <div class="text-center">
                    <a href="#" class="link-light" style="text-decoration: underline;">Esqueceu minha
                        senha?</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>