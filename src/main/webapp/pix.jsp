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
<%@include file="Header.jsp" %>

<div class="container d-flex justify-content-center" style="margin-top:90px;">
    <div class="card mx-auto" style="margin: 20px; width: 900px;">
        <div class="card-body">
            <!-- Saldo da Conta -->
            <div class="mb-4 text-center" style="margin-left: 100px; margin-right: 100px;">
                <div class="card text-white bg-success mb-3">
                    <div class="card-header">Saldo da Conta</div>
                    <div class="card-body">
                        <h5 class="card-title">R$ 12.500,00</h5>
                        <p class="card-text">Valor atual com juros: <strong>R$ 12.875,00</strong></p>
                    </div>
                </div>
            </div>

<!-- Formulário para inserir dados da pessoa para transferência Pix -->
            <div class="mb-4">
                <form id="pixDataForm" class="row g-3">
                    <div class="col-md-4">
                        <label for="nomePessoa" class="form-label">Nome:</label>
                        <input type="text" class="form-control" id="nomePessoa" name="nomePessoa" required>
                    </div>
                    <div class="col-md-4">
                        <label for="instituicaoBancaria" class="form-label">Instituição Bancária:</label>
                        <input type="text" class="form-control" id="instituicaoBancaria" name="instituicaoBancaria" required>
                    </div>
                    <div class="col-md-4">
                        <label for="chavePix" class="form-label">Chave Pix:</label>
                        <input type="text" class="form-control" id="chavePix" name="chavePix" required>
                    </div>
                    <div class="col-12 d-flex justify-content-center">
                        <button type="button" class="btn btn-outline-primary mt-2" id="confirmarTransferenciaBtn">Confirmar Transferência</button>
                    </div>
                </form>
            </div>

            <script>
                document.getElementById('confirmarTransferenciaBtn').addEventListener('click', function() {
                    var nome = document.getElementById('nomePessoa').value.trim();
                    var banco = document.getElementById('instituicaoBancaria').value.trim();
                    var chave = document.getElementById('chavePix').value.trim();
                    if(nome && banco && chave) {
                        var modal = new bootstrap.Modal(document.getElementById('transferModal'));
                        modal.show();
                    } else {
                        alert('Preencha todos os campos para continuar.');
                    }
                });
            </script>
            <div class="mb-4">
                <div class="card">
                    <div class="card-header">Transferências via Pix</div>
                    <table class="table table-striped mb-0">
                        <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Instituição Bancária</th>
                            <th>Chave Pix</th>
                            <th>Ação</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Lucas Silva</td>
                            <td>Banco do Brasil</td>
                            <td>lucas.silva@email.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Ana Souza</td>
                            <td>Caixa Econômica</td>
                            <td>11999998888</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>João Pereira</td>
                            <td>Bradesco</td>
                            <td>joao.pereira@pix.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Maria Oliveira</td>
                            <td>Itaú</td>
                            <td>maria.oliveira@email.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Pedro Santos</td>
                            <td>Santander</td>
                            <td>pedro.santos@pix.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Fernanda Lima</td>
                            <td>Banco Inter</td>
                            <td>fernanda.lima@email.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Rafael Costa</td>
                            <td>BTG Pactual</td>
                            <td>rafael.costa@pix.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Juliana Rocha</td>
                            <td>Banco Original</td>
                            <td>juliana.rocha@email.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Gabriel Martins</td>
                            <td>Neon</td>
                            <td>gabriel.martins@pix.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Patrícia Almeida</td>
                            <td>Banco Pan</td>
                            <td>patricia.almeida@email.com</td>
                            <td>
                                <button class="btn btn-primary btn-sm">Transferir</button>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <!-- Modal -->
                    <div class="modal fade" id="transferModal" tabindex="-1" aria-labelledby="transferModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="transferModalLabel">Transferir Valor</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="transferForm">
                                        <div class="mb-3">
                                            <label for="valorTransferencia" class="form-label">Valor</label>
                                            <input type="number" class="form-control" id="valorTransferencia" name="valor" min="0" step="0.01" required>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    <button type="submit" form="transferForm" class="btn btn-primary">Enviar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        // Seleciona todos os botões "Transferir"
                        document.querySelectorAll('.btn-primary.btn-sm').forEach(function(btn) {
                            btn.addEventListener('click', function() {
                                var modal = new bootstrap.Modal(document.getElementById('transferModal'));
                                modal.show();
                            });
                        });

                        // Exemplo de tratamento do envio do formulário
                        document.getElementById('transferForm').addEventListener('submit', function(e) {
                            e.preventDefault();
                            // Aqui você pode adicionar a lógica para enviar o valor
                            // Por enquanto, apenas fecha o modal
                            bootstrap.Modal.getInstance(document.getElementById('transferModal')).hide();
                            // Limpa o campo
                            document.getElementById('valorTransferencia').value = '';
                        });
                        function showSuccessMessage() {
                            // Cria o elemento da mensagem
                            var alertDiv = document.createElement('div');
                            alertDiv.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3';
                            alertDiv.style.zIndex = 1056; // acima do modal
                            alertDiv.role = 'alert';
                            alertDiv.innerHTML = 'Transferência realizada com sucesso!<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fechar"></button>';

                            document.body.appendChild(alertDiv);

                            // Remove automaticamente após 3 segundos
                            setTimeout(function() {
                                var alert = bootstrap.Alert.getOrCreateInstance(alertDiv);
                                alert.close();
                            }, 3000);
                        }

                        // Chama a função após o envio do formulário
                        document.getElementById('transferForm').addEventListener('submit', function() {
                            showSuccessMessage();
                        });
                    </script>

                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>