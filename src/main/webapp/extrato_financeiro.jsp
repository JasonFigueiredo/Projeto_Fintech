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
            <!-- Botões de Ação -->
            <div class="mb-4 d-flex justify-content-center gap-3">
                <button type="button" class="btn btn-success" onclick="window.location.href='pix.jsp'; return false;">Pix</button>
                <button type="button" class="btn btn-primary" onclick="window.location.href='deposito.jsp'; return false;">Depósito</button>
                <button type="button" class="btn btn-warning text-white" onclick="window.location.href='transferir.jsp'; return false;">Transferir</button>
                <button type="button" class="btn btn-danger" onclick="window.location.href='pagar.jsp'; return false;">Pagar</button>
            </div>
            <!-- Lista de Ativos -->
            <div class="mb-4 d-flex justify-content-center" style="margin-bottom: 1.5rem; display: flex; justify-content: center;">
                <button type="button" class="btn btn-close-white w-75" style="max-width: 600px; font-size: 15px; background-color: #0977e7; color: #ffffff;">
                    Agendamentos
                </button>
            </div>
            <div class="mb-4 d-flex justify-content-center" style="margin-bottom: 1.5rem; display: flex; justify-content: center;">
                <button type="button" class="btn btn-close-white w-75" style="max-width: 600px; font-size: 15px; background-color: #0977e7; color: #ffffff;">
                    Ajustar limites
                </button>
            </div>
            <!-- Lista de Ativos -->
            <div class="mb-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Recebimentos</div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Salário Mensal
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 2.500,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Pix - Transferência recebida
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 1.800,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        LinkedIn (MSFT) - 2 ações
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 1.200,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Pix - Transferência recebida
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 500,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Depósito bancário
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 1.000,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Rendimentos de ações
                                    </div>
                                    <span class="text-success">
                         <i class="bi bi-arrow-up-circle-fill me-1"></i>
                         +R$ 350,00
                        </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Descontos</div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Supermercado - Compras
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 2.000,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Restaurante - Jantar
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 2.400,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Conta de luz
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 400,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Transferência bancária
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 800,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Pix - Pagamento enviado
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 600,00
                        </span>
                                </li>
                                <li class="list-group-item d-flex align-items-center justify-content-between">
                                    <div>
                                        Transferência para outra conta
                                    </div>
                                    <span class="text-danger">
                         <i class="bi bi-arrow-down-circle-fill me-1"></i>
                         -R$ 550,00
                        </span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bolsas de Valores -->
            <div class="mb-4">
                <div class="card">
                    <div class="card-header">Movimentação da bolsa de Valores</div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                NYSE<br>
                                <small class="text-muted">Recebimento - 10/08/2024</small>
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 1.200,00
                             </span>
                        </li>

                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                NASDAQ<br>
                                <small class="text-muted">Descontos - 10/08/2024</small>
                            </div>
                            <span class="badge bg-danger">
                                <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                                -R$ 800,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                B3 Brasil<br>
                                <small class="text-muted">Recebimento - 10/07/2024</small>
                            </div>
                            <span class="badge bg-success">
                                <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                                +R$ 350,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                London Stock Exchange<br>
                                <small class="text-muted">Recebimento - 10/07/2024</small>
                            </div>
                            <span class="badge bg-success">
                                <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                                +R$ 500,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Euronext<br>
                                <small class="text-muted">Descontos - 10/06/2024</small>
                            </div>
                            <span class="badge bg-danger">
                                <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                                -R$ 200,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Hong Kong Exchange<br>
                                <small class="text-muted">Recebimento - 10/06/2024</small>
                            </div>
                            <span class="badge bg-success">
                                <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                                +R$ 700,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Shanghai Stock Exchange<br>
                                <small class="text-muted">Descontos - 10/06/2024</small>
                            </div>
                            <span class="badge bg-danger">
                                <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                                -R$ 150,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                TSX (Toronto)<br>
                                <small class="text-muted">Recebimento - 10/04/2024</small>
                            </div>
                            <span class="badge bg-success">
                                <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                                +R$ 400,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Deutsche Börse<br>
                                <small class="text-muted">Descontos - 10/04/2024</small>
                            </div>
                            <span class="badge bg-danger">
                                <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                                -R$ 100,00
                             </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                SIX Swiss Exchange<br>
                                <small class="text-muted">Recebimento - 10/04/2024</small>
                            </div>
                            <span class="badge bg-success">
                                <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                                +R$ 250,00
                             </span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


</body>

</html>