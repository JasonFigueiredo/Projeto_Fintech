<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="jakarta.tags.core" %> <%@ taglib prefix="fmt"
uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Cartões de Crédito</title>
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
              <h3 class="mb-0">Meus Cartões de Crédito</h3>
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#newCardModal"
              >
                Novo Cartão
              </button>
            </div>
            <div class="card-body">
              <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
              </c:if>

              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nome</th>
                      <th>Bandeira</th>
                      <th>Limite</th>
                      <th>Data de Fechamento</th>
                      <th>Data de Vencimento</th>
                      <th>Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${cards}" var="card">
                      <tr>
                        <td>${card.id}</td>
                        <td>${card.name}</td>
                        <td>${card.brand}</td>
                        <td>
                          <fmt:formatNumber
                            value="${card.limit}"
                            type="currency"
                            currencySymbol="R$"
                          />
                        </td>
                        <td>${card.closingDate}</td>
                        <td>${card.expirationDate}</td>
                        <td>
                          <a
                            href="${pageContext.request.contextPath}/credit-card/${card.id}"
                            class="btn btn-info btn-sm"
                            >Detalhes</a
                          >
                          <button
                            class="btn btn-warning btn-sm"
                            onclick="editCard(${card.id}, '${card.name}', ${card.limit}, '${card.brand}', ${card.expirationDate}, ${card.closingDate})"
                          >
                            Editar
                          </button>
                          <button
                            class="btn btn-danger btn-sm"
                            onclick="deleteCard(${card.id})"
                          >
                            Excluir
                          </button>
                        </td>
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

    <!-- Modal Novo Cartão -->
    <div class="modal fade" id="newCardModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Novo Cartão de Crédito</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            action="${pageContext.request.contextPath}/credit-card"
            method="post"
          >
            <input type="hidden" name="action" value="create" />
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Nome do Cartão</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="brand" class="form-label">Bandeira</label>
                <select class="form-select" id="brand" name="brand" required>
                  <option value="VISA">Visa</option>
                  <option value="MASTERCARD">Mastercard</option>
                  <option value="AMEX">American Express</option>
                  <option value="ELO">Elo</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="limit" class="form-label">Limite</label>
                <input
                  type="number"
                  class="form-control"
                  id="limit"
                  name="limit"
                  step="0.01"
                  min="0"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="expirationDate" class="form-label"
                  >Dia de Vencimento</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="expirationDate"
                  name="expirationDate"
                  min="1"
                  max="31"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="closingDate" class="form-label"
                  >Dia de Fechamento</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="closingDate"
                  name="closingDate"
                  min="1"
                  max="31"
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
              <button type="submit" class="btn btn-primary">
                Criar Cartão
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modal Editar Cartão -->
    <div class="modal fade" id="editCardModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Editar Cartão de Crédito</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            id="editCardForm"
            action="${pageContext.request.contextPath}/credit-card"
            method="post"
          >
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="id" id="editId" />
            <div class="modal-body">
              <div class="mb-3">
                <label for="editName" class="form-label">Nome do Cartão</label>
                <input
                  type="text"
                  class="form-control"
                  id="editName"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="editBrand" class="form-label">Bandeira</label>
                <select
                  class="form-select"
                  id="editBrand"
                  name="brand"
                  required
                >
                  <option value="VISA">Visa</option>
                  <option value="MASTERCARD">Mastercard</option>
                  <option value="AMEX">American Express</option>
                  <option value="ELO">Elo</option>
                </select>
              </div>
              <div class="mb-3">
                <label for="editLimit" class="form-label">Limite</label>
                <input
                  type="number"
                  class="form-control"
                  id="editLimit"
                  name="limit"
                  step="0.01"
                  min="0"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="editExpirationDate" class="form-label"
                  >Dia de Vencimento</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="editExpirationDate"
                  name="expirationDate"
                  min="1"
                  max="31"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="editClosingDate" class="form-label"
                  >Dia de Fechamento</label
                >
                <input
                  type="number"
                  class="form-control"
                  id="editClosingDate"
                  name="closingDate"
                  min="1"
                  max="31"
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
              <button type="submit" class="btn btn-primary">
                Salvar Alterações
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <script>
      function editCard(id, name, limit, brand, expirationDate, closingDate) {
        document.getElementById('editId').value = id
        document.getElementById('editName').value = name
        document.getElementById('editLimit').value = limit
        document.getElementById('editBrand').value = brand
        document.getElementById('editExpirationDate').value = expirationDate
        document.getElementById('editClosingDate').value = closingDate
        new bootstrap.Modal(document.getElementById('editCardModal')).show()
      }

      function deleteCard(id) {
        if (confirm('Tem certeza que deseja excluir este cartão?')) {
          const form = document.createElement('form')
          form.method = 'POST'
          form.action = '${pageContext.request.contextPath}/credit-card'

          const actionInput = document.createElement('input')
          actionInput.type = 'hidden'
          actionInput.name = 'action'
          actionInput.value = 'delete'

          const idInput = document.createElement('input')
          idInput.type = 'hidden'
          idInput.name = 'id'
          idInput.value = id

          form.appendChild(actionInput)
          form.appendChild(idInput)
          document.body.appendChild(form)
          form.submit()
        }
      }
    </script>
  </body>
</html>
