package br.com.fiap.projeto_fintech.dao;

import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.factory.ConnectionFactory;
import br.com.fiap.projeto_fintech.model.CreditCardExpense;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CreditCardExpenseDao {
    private Connection connection;

    public CreditCardExpenseDao() throws SQLException {
        connection = ConnectionFactory.getConnection();
    }

    private CreditCardExpense parse(ResultSet result) throws SQLException {
        int id = result.getInt("id");
        int creditCardId = result.getInt("credit_card_id");
        String description = result.getString("description");
        double amount = result.getDouble("amount");
        Date expenseDate = result.getDate("expense_date");

        return new CreditCardExpense(id, creditCardId, description, amount, expenseDate);
    }

    public void create(CreditCardExpense expense) throws SQLException {
        String sql = "INSERT INTO credit_card_expense (id, credit_card_id, description, amount, expense_date) " +
                "VALUES (seq_credit_card_expense.nextval, ?, ?, ?, ?)";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, expense.getCreditCardId());
            stm.setString(2, expense.getDescription());
            stm.setDouble(3, expense.getAmount());
            stm.setDate(4, new java.sql.Date(expense.getExpenseDate().getTime()));
            stm.executeUpdate();
        }
    }

    public CreditCardExpense search(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM credit_card_expense WHERE id = ?");
        stm.setInt(1, id);
        ResultSet result = stm.executeQuery();
        if (!result.next()) throw new NotFoundException("Gasto não encontrado");
        return parse(result);
    }

    public List<CreditCardExpense> list() throws SQLException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM credit_card_expense");
        ResultSet result = stm.executeQuery();
        List<CreditCardExpense> list = new ArrayList<>();
        while (result.next()) {
            list.add(parse(result));
        }
        return list;
    }

    public void update(CreditCardExpense expense) throws SQLException {
        String sql = "UPDATE credit_card_expense SET credit_card_id = ?, description = ?, amount = ?, expense_date = ? WHERE id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, expense.getCreditCardId());
            stm.setString(2, expense.getDescription());
            stm.setDouble(3, expense.getAmount());
            stm.setDate(4, new java.sql.Date(expense.getExpenseDate().getTime()));
            stm.setInt(5, expense.getId());
            stm.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("DELETE FROM credit_card_expense WHERE id = ?");
        stm.setInt(1, id);
        if (stm.executeUpdate() == 0) throw new NotFoundException("Gasto não encontrado");
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }
}
