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

            <!-- Gráfico de Saldo (Exemplo com Chart.js) -->
            <div class="mb-4">
                <div class="card">
                    <div class="card-header">Evolução do Saldo</div>
                    <div class="card-body">
                        <canvas id="saldoChart" height="120"></canvas>
                    </div>
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                const ctx = document.getElementById('saldoChart').getContext('2d');
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'],
                        datasets: [{
                            label: 'Saldo',
                            data: [10000, 9500, 11000, 10500, 12000, 12875],
                            borderColor: 'rgba(36,179,236,1)',
                            backgroundColor: 'rgba(36,179,236,0.2)',
                            fill: true,
                            tension: 0.4
                        }]
                    },
                    options: {
                        plugins: {legend: {display: false}},
                        scales: {y: {beginAtZero: false}}
                    }
                });
            </script>

            <!-- Lista de Ativos -->
            <div class="mb-4">
                <div class="row">
                    <!-- Card 1 -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Meus Ativos</div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/google/google-original.svg"
                                         width="24" class="me-2"/>
                                    Google (GOOGL) - 5 ações
                                </li>
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/apple/apple-original.svg"
                                         width="24" class="me-2"/>
                                    Apple (AAPL) - 3 ações
                                </li>
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/linkedin/linkedin-original.svg"
                                         width="24" class="me-2"/>
                                    LinkedIn (MSFT) - 2 ações
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Card 2 -->
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header">Meus Ativos</div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazon/amazon-original.svg"
                                         width="24" class="me-2"/>
                                    Amazon (AMZN) - 4 ações
                                </li>
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/facebook/facebook-original.svg"
                                         width="24" class="me-2"/>
                                    Facebook (META) - 6 ações
                                </li>
                                <li class="list-group-item d-flex align-items-center">
                                    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/twitter/twitter-original.svg"
                                         width="24" class="me-2"/>
                                    Twitter (TWTR) - 1 ação
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bolsas de Valores -->
            <div class="mb-4">
                <div class="card">
                    <div class="card-header">Bolsas de Valores</div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                NYSE
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 1.200,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                NASDAQ
                            </div>
                            <span class="badge bg-danger">
                               <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                               -R$ 800,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                B3 Brasil
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 350,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                London Stock Exchange
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 500,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Euronext
                            </div>
                            <span class="badge bg-danger">
                               <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                               -R$ 200,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Hong Kong Exchange
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 700,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Shanghai Stock Exchange
                            </div>
                            <span class="badge bg-danger">
                               <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                               -R$ 150,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                TSX (Toronto)
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 400,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                Deutsche Börse
                            </div>
                            <span class="badge bg-danger">
                               <i class="bi bi-arrow-down-circle-fill text-danger me-1"></i>
                               -R$ 100,00
                              </span>
                        </li>
                        <li class="list-group-item d-flex align-items-center justify-content-between">
                            <div>
                                SIX Swiss Exchange
                            </div>
                            <span class="badge bg-success">
                               <i class="bi bi-arrow-up-circle-fill text-success me-1"></i>
                               +R$ 250,00
                              </span>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mb-4">
                <div class="card">
                    <div class="card-header">Minigráficos das Bolsas de Valores</div>
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col-md-3 mb-3">
                                <strong>NYSE</strong>
                                <canvas id="miniChart1" height="60"></canvas>
                            </div>
                            <div class="col-md-3 mb-3">
                                <strong>NASDAQ</strong>
                                <canvas id="miniChart2" height="60"></canvas>
                            </div>
                            <div class="col-md-3 mb-3">
                                <strong>B3 Brasil</strong>
                                <canvas id="miniChart3" height="60"></canvas>
                            </div>
                            <div class="col-md-3 mb-3">
                                <strong>London Stock Exchange</strong>
                                <canvas id="miniChart4" height="60"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function randomData() {
                    return Array.from({length: 8}, () => Math.floor(Math.random() * 1000) + 500);
                }
                const miniConfigs = [
                    {id: 'miniChart1', color: 'rgba(40,167,69,1)'},
                    {id: 'miniChart2', color: 'rgba(220,53,69,1)'},
                    {id: 'miniChart3', color: 'rgba(36,179,236,1)'},
                    {id: 'miniChart4', color: 'rgba(255,193,7,1)'}
                ];
                miniConfigs.forEach(cfg => {
                    new Chart(document.getElementById(cfg.id).getContext('2d'), {
                        type: 'line',
                        data: {
                            labels: Array(8).fill(''),
                            datasets: [{
                                data: randomData(),
                                borderColor: cfg.color,
                                backgroundColor: 'rgba(0,0,0,0)',
                                pointRadius: 0,
                                borderWidth: 2,
                                fill: false,
                                tension: 0.4
                            }]
                        },
                        options: {
                            plugins: {legend: {display: false}},
                            scales: {
                                x: {display: false},
                                y: {display: false}
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
</div>


</body>

</html>