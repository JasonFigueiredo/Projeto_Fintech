package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.DigitalAccountDao;
import br.com.fiap.projeto_fintech.dao.DigitalAccountTransactionDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.DigitalAccount;
import br.com.fiap.projeto_fintech.model.DigitalAccountTransaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@WebServlet("/digital-account/*/transaction")
public class TransactionServlet extends HttpServlet {
    private DigitalAccountDao accountDao;
    private DigitalAccountTransactionDao transactionDao;

    @Override
    public void init() throws ServletException {
        try {
            accountDao = new DigitalAccountDao();
            transactionDao = new DigitalAccountTransactionDao();
        } catch (SQLException e) {
            throw new ServletException("Error initializing DAOs", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String[] pathParts = pathInfo.split("/");
        int accountId = Integer.parseInt(pathParts[1]);
        String action = pathParts[3]; // deposit, withdraw, or transfer

        try {
            DigitalAccount account = accountDao.search(accountId);
            double amount = Double.parseDouble(request.getParameter("amount"));
            String description = request.getParameter("description");

            switch (action) {
                case "deposit":
                    handleDeposit(account, amount, description);
                    break;
                case "withdraw":
                    handleWithdraw(account, amount, description);
                    break;
                case "transfer":
                    int targetAccountId = Integer.parseInt(request.getParameter("targetAccountId"));
                    handleTransfer(account, targetAccountId, amount, description);
                    break;
                default:
                    throw new ServletException("Invalid action: " + action);
            }

            response.sendRedirect(request.getContextPath() + "/digital-account/" + accountId);
        } catch (SQLException | NotFoundException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp")
                   .forward(request, response);
        }
    }

    private void handleDeposit(DigitalAccount account, double amount, String description) 
            throws SQLException {
        // Create transaction record
        DigitalAccountTransaction transaction = new DigitalAccountTransaction(
            0, account.getId(), "DEPOSIT", amount, description, 
            Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant())
        );
        transactionDao.create(transaction);

        // Update account balance
        account.setBalance(account.getBalance() + amount);
        accountDao.update(account);
    }

    private void handleWithdraw(DigitalAccount account, double amount, String description) 
            throws SQLException {
        if (amount > account.getBalance()) {
            throw new SQLException("Saldo insuficiente para realizar o saque");
        }

        // Create transaction record
        DigitalAccountTransaction transaction = new DigitalAccountTransaction(
            0, account.getId(), "WITHDRAW", -amount, description, 
            Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant())
        );
        transactionDao.create(transaction);

        // Update account balance
        account.setBalance(account.getBalance() - amount);
        accountDao.update(account);
    }

    private void handleTransfer(DigitalAccount sourceAccount, int targetAccountId, 
                              double amount, String description) 
            throws SQLException, NotFoundException {
        if (amount > sourceAccount.getBalance()) {
            throw new SQLException("Saldo insuficiente para realizar a transferência");
        }

        DigitalAccount targetAccount = accountDao.search(targetAccountId);
        Date now = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());

        // Create transaction records for both accounts
        DigitalAccountTransaction sourceTransaction = new DigitalAccountTransaction(
            0, sourceAccount.getId(), "TRANSFER_OUT", -amount, 
            "Transferência para conta " + targetAccountId + ": " + description,
            now
        );
        transactionDao.create(sourceTransaction);

        DigitalAccountTransaction targetTransaction = new DigitalAccountTransaction(
            0, targetAccountId, "TRANSFER_IN", amount,
            "Transferência da conta " + sourceAccount.getId() + ": " + description,
            now
        );
        transactionDao.create(targetTransaction);

        // Update both account balances
        sourceAccount.setBalance(sourceAccount.getBalance() - amount);
        accountDao.update(sourceAccount);

        targetAccount.setBalance(targetAccount.getBalance() + amount);
        accountDao.update(targetAccount);
    }

    @Override
    public void destroy() {
        try {
            if (accountDao != null) {
                accountDao.closeConnection();
            }
            if (transactionDao != null) {
                transactionDao.closeConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 