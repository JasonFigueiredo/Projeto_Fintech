<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Easy Bank - Controle Financeiro</title>
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
    <div class="card mx-auto" style="max-width: 500px; padding-left:100px; padding-right:100px;">
        <div class="card-body">
            <form method="post" action="cadastro.jsp" class="text-start">
                <div class="text-center mb-3">
                    <span><strong>Insira os dados para Cadastro</strong></span>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Nome de Usuário:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="cpf" class="form-label">CPF:</label>
                    <input type="text" class="form-control" id="cpf" name="cpf" maxlength="14" required oninput="formatAndValidateCPF()">
                    <div id="cpfInvalid" class="form-text text-danger" style="display:none;">CPF inválido.</div>
                </div>
                <script>
                    function formatAndValidateCPF() {
                        var cpfInput = document.getElementById('cpf');
                        var cpf = cpfInput.value.replace(/\D/g, '');
                        // Formata para 000.000.000-00
                        if (cpf.length > 3) cpf = cpf.replace(/^(\d{3})(\d)/, "$1.$2");
                        if (cpf.length > 7) cpf = cpf.replace(/^(\d{3})\.(\d{3})(\d)/, "$1.$2.$3");
                        if (cpf.length > 11) cpf = cpf.replace(/^(\d{3})\.(\d{3})\.(\d{3})(\d)/, "$1.$2.$3-$4");
                        cpfInput.value = cpf;

                        // Validação do CPF
                        var isValid = validateCPF(cpf.replace(/\D/g, ''));
                        document.getElementById('cpfInvalid').style.display = isValid || cpf.length < 14 ? 'none' : 'block';
                    }

                    function validateCPF(cpf) {
                        if (!cpf || cpf.length !== 11 || /^(\d)\1+$/.test(cpf)) return false;
                        var sum = 0, rest;
                        for (var i = 1; i <= 9; i++) sum += parseInt(cpf.substring(i-1, i)) * (11 - i);
                        rest = (sum * 10) % 11;
                        if ((rest === 10) || (rest === 11)) rest = 0;
                        if (rest !== parseInt(cpf.substring(9, 10))) return false;
                        sum = 0;
                        for (var i = 1; i <= 10; i++) sum += parseInt(cpf.substring(i-1, i)) * (12 - i);
                        rest = (sum * 10) % 11;
                        if ((rest === 10) || (rest === 11)) rest = 0;
                        if (rest !== parseInt(cpf.substring(10, 11))) return false;
                        return true;
                    }
                </script>
                <div class="mb-3">
                    <label for="email" class="form-label">Seu endereço de E-mail:</label>
                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Sua Senha:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3">
                    <label for="repeatPassword" class="form-label">Repetir Senha:</label>
                    <input type="password" class="form-control" id="repeatPassword" name="repeatPassword" required oninput="checkPasswordMatch()">
                    <div id="passwordMismatch" class="form-text text-danger" style="display:none;">As senhas não coincidem.</div>
                </div>
                <script>
                    function checkPasswordMatch() {
                        var password = document.getElementById('password').value;
                        var repeatPassword = document.getElementById('repeatPassword').value;
                        var mismatchDiv = document.getElementById('passwordMismatch');
                        if (repeatPassword && password !== repeatPassword) {
                            mismatchDiv.style.display = 'block';
                        } else {
                            mismatchDiv.style.display = 'none';
                        }
                    }
                    // Prevent form submission if passwords do not match
                    document.querySelector('form').addEventListener('submit', function(e) {
                        var password = document.getElementById('password').value;
                        var repeatPassword = document.getElementById('repeatPassword').value;
                        if (password !== repeatPassword) {
                            document.getElementById('passwordMismatch').style.display = 'block';
                            e.preventDefault();
                        }
                    });
                </script>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <div class="d-flex justify-content-center mb-3">
                    <button
                            type="submit"
                            class="btn btn-primary w-100"
                            style="background: linear-gradient(90deg, #90ee90, rgb(36,179,236)); border: none;"
                            id="loginBtn"
                            onclick="window.location.href='inicio.jsp'; return false;"
                            disabled
                    >
                        Fazer Login
                    </button>
                </div>
                <script>
                    function validateFields() {
                        var username = document.getElementById('username').value.trim();
                        var cpf = document.getElementById('cpf').value.trim();
                        var email = document.getElementById('email').value.trim();
                        var password = document.getElementById('password').value.trim();
                        var repeatPassword = document.getElementById('repeatPassword').value.trim();
                        var check = document.getElementById('exampleCheck1').checked;
                        var allFilled = username && cpf && email && password && repeatPassword && check && (password === repeatPassword);
                        document.getElementById('loginBtn').disabled = !allFilled;
                    }

                    document.getElementById('username').addEventListener('input', validateFields);
                    document.getElementById('cpf').addEventListener('input', validateFields);
                    document.getElementById('email').addEventListener('input', validateFields);
                    document.getElementById('password').addEventListener('input', validateFields);
                    document.getElementById('repeatPassword').addEventListener('input', validateFields);
                    document.getElementById('exampleCheck1').addEventListener('change', validateFields);
                </script>
                <div class="d-flex justify-content-center mb-3">
                    <button type="submit" class="btn btn-primary w-100"
                            style="background: linear-gradient(90deg, #24b3ec, rgb(144,238,144)); border: none;"
                            onclick="window.location.href='login.jsp'; return false;">
                        Cancelar Cadastro
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>