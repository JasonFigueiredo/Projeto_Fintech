<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="jakarta.tags.core" %> <%@ taglib prefix="fmt"
uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Contas Digitais</title>
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
              <h3 class="mb-0">Minhas Contas Digitais</h3>
              <button
                type="button"
                class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#newAccountModal"
              >
                Nova Conta
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
                      <th>Saldo</th>
                      <th>Ações</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${accounts}" var="account">
                      <tr>
                        <td>${account.id}</td>
                        <td>${account.name}</td>
                        <td>
                          <fmt:formatNumber
                            value="${account.balance}"
                            type="currency"
                            currencySymbol="R$"
                          />
                        </td>
                        <td>
                          <a
                            href="${pageContext.request.contextPath}/digital-account/${account.id}"
                            class="btn btn-info btn-sm"
                            >Detalhes</a
                          >
                          <button
                            class="btn btn-warning btn-sm"
                            onclick="editAccount(${account.id}, '${account.name}', ${account.balance})"
                          >
                            Editar
                          </button>
                          <button
                            class="btn btn-danger btn-sm"
                            onclick="deleteAccount(${account.id})"
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

    <!-- Modal Nova Conta -->
    <div class="modal fade" id="newAccountModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Nova Conta Digital</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            action="${pageContext.request.contextPath}/digital-account"
            method="post"
          >
            <input type="hidden" name="action" value="create" />
            <div class="modal-body">
              <div class="mb-3">
                <label for="name" class="form-label">Nome da Conta</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="balance" class="form-label">Saldo Inicial</label>
                <input
                  type="number"
                  class="form-control"
                  id="balance"
                  name="balance"
                  step="0.01"
                  min="0"
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
              <button type="submit" class="btn btn-primary">Criar Conta</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Modal Editar Conta -->
    <div class="modal fade" id="editAccountModal" tabindex="-1">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Editar Conta Digital</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
            ></button>
          </div>
          <form
            id="editAccountForm"
            action="${pageContext.request.contextPath}/digital-account"
            method="post"
          >
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="id" id="editId" />
            <div class="modal-body">
              <div class="mb-3">
                <label for="editName" class="form-label">Nome da Conta</label>
                <input
                  type="text"
                  class="form-control"
                  id="editName"
                  name="name"
                  required
                />
              </div>
              <div class="mb-3">
                <label for="editBalance" class="form-label">Saldo</label>
                <input
                  type="number"
                  class="form-control"
                  id="editBalance"
                  name="balance"
                  step="0.01"
                  min="0"
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
      function editAccount(id, name, balance) {
        document.getElementById('editId').value = id
        document.getElementById('editName').value = name
        document.getElementById('editBalance').value = balance
        new bootstrap.Modal(document.getElementById('editAccountModal')).show()
      }

      function deleteAccount(id) {
        if (confirm('Tem certeza que deseja excluir esta conta?')) {
          const form = document.createElement('form')
          form.method = 'POST'
          form.action = '${pageContext.request.contextPath}/digital-account'

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
