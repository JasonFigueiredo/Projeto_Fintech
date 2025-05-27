package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.CreditCardDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.CreditCard;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/credit-card/*")
public class CreditCardServlet extends HttpServlet {
    private CreditCardDao dao;

    @Override
    public void init() throws ServletException {
        try {
            dao = new CreditCardDao();
        } catch (SQLException e) {
            throw new ServletException("Error initializing CreditCardDao", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // List all credit cards
                List<CreditCard> cards = dao.list();
                request.setAttribute("cards", cards);
                request.getRequestDispatcher("/WEB-INF/views/credit-cards.jsp")
                       .forward(request, response);
            } else {
                // Get specific credit card
                int id = Integer.parseInt(pathInfo.substring(1));
                CreditCard card = dao.search(id);
                request.setAttribute("card", card);
                request.getRequestDispatcher("/WEB-INF/views/credit-card-detail.jsp")
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
                createCard(request, response);
            } else if ("update".equals(action)) {
                updateCard(request, response);
            } else if ("delete".equals(action)) {
                deleteCard(request, response);
            }
        } catch (SQLException | NotFoundException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/error.jsp")
                   .forward(request, response);
        }
    }

    private void createCard(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String name = request.getParameter("name");
        double limit = Double.parseDouble(request.getParameter("limit"));
        String brand = request.getParameter("brand");
        int expirationDate = Integer.parseInt(request.getParameter("expirationDate"));
        int closingDate = Integer.parseInt(request.getParameter("closingDate"));

        CreditCard card = new CreditCard(userId, name, limit, brand, expirationDate, closingDate);
        dao.create(card);
        
        response.sendRedirect(request.getContextPath() + "/credit-card");
    }

    private void updateCard(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, NotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double limit = Double.parseDouble(request.getParameter("limit"));
        String brand = request.getParameter("brand");
        int expirationDate = Integer.parseInt(request.getParameter("expirationDate"));
        int closingDate = Integer.parseInt(request.getParameter("closingDate"));

        CreditCard card = dao.search(id);
        card.setName(name);
        card.setLimit(limit);
        card.setBrand(brand);
        card.setExpirationDate(expirationDate);
        card.setClosingDate(closingDate);
        dao.update(card);
        
        response.sendRedirect(request.getContextPath() + "/credit-card/" + id);
    }

    private void deleteCard(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, NotFoundException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect(request.getContextPath() + "/credit-card");
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