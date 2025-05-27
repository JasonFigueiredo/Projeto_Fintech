package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.DigitalAccountDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.DigitalAccount;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/digital-account/*")
public class DigitalAccountServlet extends HttpServlet {
    private DigitalAccountDao dao;

    @Override
    public void init() throws ServletException {
        try {
            dao = new DigitalAccountDao();
        } catch (SQLException e) {
            throw new ServletException("Error initializing DigitalAccountDao", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // List all accounts
                List<DigitalAccount> accounts = dao.list();
                request.setAttribute("accounts", accounts);
                request.getRequestDispatcher("/WEB-INF/views/digital-accounts.jsp")
                       .forward(request, response);
            } else {
                // Get specific account
                int id = Integer.parseInt(pathInfo.substring(1));
                DigitalAccount account = dao.search(id);
                request.setAttribute("account", account);
                request.getRequestDispatcher("/WEB-INF/views/digital-account-detail.jsp")
                       .forward(request, response);
            }
        } catch (SQLException | NotFoundException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp")
                   .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("create".equals(action)) {
                createAccount(request, response);
            } else if ("update".equals(action)) {
                updateAccount(request, response);
            } else if ("delete".equals(action)) {
                deleteAccount(request, response);
            }
        } catch (SQLException | NotFoundException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp")
                   .forward(request, response);
        }
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String name = request.getParameter("name");
        double balance = Double.parseDouble(request.getParameter("balance"));

        DigitalAccount account = new DigitalAccount(0, userId, name, balance);
        dao.create(account);
        
        response.sendRedirect(request.getContextPath() + "/digital-account");
    }

    private void updateAccount(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, NotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double balance = Double.parseDouble(request.getParameter("balance"));

        DigitalAccount account = dao.search(id);
        account.setName(name);
        account.setBalance(balance);
        dao.update(account);
        
        response.sendRedirect(request.getContextPath() + "/digital-account/" + id);
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, NotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect(request.getContextPath() + "/digital-account");
    }

    @Override
    public void destroy() {
        try {
            if (dao != null) {
                dao.closeConnection();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} 