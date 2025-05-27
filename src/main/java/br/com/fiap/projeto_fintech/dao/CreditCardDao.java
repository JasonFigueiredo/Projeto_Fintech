package br.com.fiap.projeto_fintech.dao;

import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.factory.ConnectionFactory;
import br.com.fiap.projeto_fintech.model.CreditCard;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CreditCardDao {
    private Connection connection;

    public CreditCardDao() throws SQLException {
        connection = ConnectionFactory.getConnection();
    }

    private CreditCard parseCreditCard(ResultSet result) throws SQLException {
        int id = result.getInt("id");
        int userId = result.getInt("user_id");
        String name = result.getString("name");
        double limit = result.getDouble("limit");
        String brand = result.getString("brand");
        int expirationDate = result.getInt("expiration_date");
        int closingDate = result.getInt("closing_date");

        return new CreditCard(id, userId, name, limit, brand, expirationDate, closingDate);
    }

    public void create(CreditCard card) throws SQLException {
        String sql = "INSERT INTO credit_card (id, user_id, name, limit, brand, expiration_date, closing_date) " +
                "VALUES (seq_credit_card.nextval, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, card.getUserId());
            stm.setString(2, card.getName());
            stm.setDouble(3, card.getLimit());
            stm.setString(4, card.getBrand());
            stm.setInt(5, card.getExpirationDate());
            stm.setInt(6, card.getClosingDate());
            stm.executeUpdate();
        }
    }

    public CreditCard search(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM credit_card WHERE id = ?");
        stm.setInt(1, id);
        ResultSet result = stm.executeQuery();
        if (!result.next()) {
            throw new NotFoundException("Credit Card not found");
        }

        return parseCreditCard(result);
    }

    public List<CreditCard> list() throws SQLException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM credit_card");
        ResultSet result = stm.executeQuery();
        List<CreditCard> list = new ArrayList<>();
        while (result.next()) {
            list.add(parseCreditCard(result));
        }
        return list;
    }

    public void update(CreditCard card) throws SQLException {
        String sql = "UPDATE credit_card SET user_id = ?, name = ?, limit = ?, brand = ?, expiration_date = ?, closing_date = ? WHERE id = ?";

        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, card.getUserId());
            stm.setString(2, card.getName());
            stm.setDouble(3, card.getLimit());
            stm.setString(4, card.getBrand());
            stm.setInt(5, card.getExpirationDate());
            stm.setInt(6, card.getClosingDate());
            stm.setInt(7, card.getId());
            stm.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("DELETE FROM credit_card WHERE id = ?");
        stm.setInt(1, id);
        int affectedRows = stm.executeUpdate();
        if (affectedRows == 0) {
            throw new NotFoundException("Credit Card not found");
        }
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }
}
