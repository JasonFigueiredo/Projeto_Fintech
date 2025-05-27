<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="jakarta.tags.core" %> <%@ taglib prefix="fmt"
uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Detalhes da Conta Digital</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
    />
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
    <%@include file="../Header.jsp" %>

    <div class="container mt-5">
      <div class="row">
        <div class="col-md-12">
          <div class="card">
            <div
              class="card-header d-flex justify-content-between align-items-center"
            >
              <h3 class="mb-0">Detalhes da Conta Digital</h3>
              <a
                href="${pageContext.request.contextPath}/digital-account"
                class="btn btn-secondary"
              >
                Voltar
              </a>
            </div>
            <div class="card-body">
              <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
              </c:if>

              <div class="row">
                <div class="col-md-6">
                  <div class="card mb-4">
                    <div class="card-header">
                      <h5 class="mb-0">Informações da Conta</h5>
                    </div>
                    <div class="card-body">
                      <dl class="row">
                        <dt class="col-sm-4">ID da Conta:</dt>
                        <dd class="col-sm-8">${account.id}</dd>

                        <dt class="col-sm-4">Nome:</dt>
                        <dd class="col-sm-8">${account.name}</dd>

                        <dt class="col-sm-4">Saldo Atual:</dt>
                        <dd class="col-sm-8">
                          <fmt:formatNumber
                            value="${account.balance}"
                            type="currency"
                            currencySymbol="R$"
                          />
                        </dd>
                      </dl>
                    </div>
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="card">
                    <div class="card-header">
                      <h5 class="mb-0">Ações</h5>
                    </div>
                    <div class="card-body">
                      <button
                        class="btn btn-primary mb-2 w-100"
                        data-bs-toggle="modal"
                        data-bs-target="#transferModal"
                      >
                        Realizar Transferência
                      </button>
                      <button
                        class="btn btn-success mb-2 w-100"
                        data-bs-toggle="modal"
                        data-bs-target="#depositModal"
                      >
                        Realizar Depósito
                      </button>
                      <button
                        class="btn btn-warning mb-2 w-100"
                        data-bs-toggle="modal"
                        data-bs-target="#withdrawModal"
                      >
                        Realizar Saque
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Histórico de Transações -->
              <div class="card mt-4">
                <div class="card-header">
                  <h5 class="mb-0">Histórico de Transações</h5>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>Data</th>
                          <th>Tipo</th>
                          <th>Valor</th>
                          <th>Descrição</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${transactions}" var="transaction">
                          <tr>
                            <td>
                              <fmt:formatDate
                                value="${transaction.transactionDate}"
                                pattern="dd/MM/yyyy HH:mm"
                              />
                            </td>
                            <td>${transaction.type}</td>
                            <td>
                              <fmt:formatNumber
                                value="${transaction.amount}"
                                type="currency"
                                currencySymbol="R$"
                              />
                            </td>
                            <td>${transaction.description}</td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal Transferência -->
    <div class="modal fade" id="transferModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Realizar Transferência</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            action="${pageContext.request.contextPath}/digital-account/${account.id}/transaction/transfer"
            method="post"
          >
            <div class="modal-body">
              <div class="mb-3">
                <label for="targetAccount" class="form-label"
                  >Conta de Destino</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="targetAccount"
                  name="targetAccountId"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="transferAmount" class="form-label">Valor</label>
                <input
                  type="number"
                  class="form-control"
                  id="transferAmount"
                  name="amount"
                  step="0.01"
                  min="0.01"
                  max="${account.balance}"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="transferDescription" class="form-label"
                  >Descrição</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="transferDescription"
                  name="description"
                  required
                />
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Cancelar
              </button>
              <button type="submit" class="btn btn-primary">Transferir</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modal Depósito -->
    <div class="modal fade" id="depositModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Realizar Depósito</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            action="${pageContext.request.contextPath}/digital-account/${account.id}/transaction/deposit"
            method="post"
          >
            <div class="modal-body">
              <div class="mb-3">
                <label for="depositAmount" class="form-label">Valor</label>
                <input
                  type="number"
                  class="form-control"
                  id="depositAmount"
                  name="amount"
                  step="0.01"
                  min="0.01"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="depositDescription" class="form-label"
                  >Descrição</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="depositDescription"
                  name="description"
                  required
                />
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Cancelar
              </button>
              <button type="submit" class="btn btn-primary">Depositar</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modal Saque -->
    <div class="modal fade" id="withdrawModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Realizar Saque</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            action="${pageContext.request.contextPath}/digital-account/${account.id}/transaction/withdraw"
            method="post"
          >
            <div class="modal-body">
              <div class="mb-3">
                <label for="withdrawAmount" class="form-label">Valor</label>
                <input
                  type="number"
                  class="form-control"
                  id="withdrawAmount"
                  name="amount"
                  step="0.01"
                  min="0.01"
                  max="${account.balance}"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="withdrawDescription" class="form-label"
                  >Descrição</label
                >
                <input
                  type="text"
                  class="form-control"
                  id="withdrawDescription"
                  name="description"
                  required
                />
              </div>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                Cancelar
              </button>
              <button type="submit" class="btn btn-primary">Sacar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
