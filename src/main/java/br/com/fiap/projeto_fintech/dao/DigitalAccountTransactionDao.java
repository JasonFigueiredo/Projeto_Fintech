package br.com.fiap.projeto_fintech.dao;

import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.factory.ConnectionFactory;
import br.com.fiap.projeto_fintech.model.DigitalAccountTransaction;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DigitalAccountTransactionDao {
    private Connection connection;

    public DigitalAccountTransactionDao() throws SQLException {
        connection = ConnectionFactory.getConnection();
    }

    private DigitalAccountTransaction parse(ResultSet rs) throws SQLException {
        return new DigitalAccountTransaction(
                rs.getInt("id"),
                rs.getInt("account_id"),
                rs.getString("type"),
                rs.getDouble("amount"),
                rs.getString("description"),
                rs.getDate("transaction_date")
        );
    }

    public void create(DigitalAccountTransaction t) throws SQLException {
        String sql = "INSERT INTO digital_account_transaction (id, account_id, type, amount, description, transaction_date) VALUES (seq_digital_account_transaction.nextval, ?, ?, ?, ?, ?)";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, t.getAccountId());
            stm.setString(2, t.getType());
            stm.setDouble(3, t.getAmount());
            stm.setString(4, t.getDescription());
            stm.setDate(5, new java.sql.Date(t.getTransactionDate().getTime()));
            stm.executeUpdate();
        }
    }

    public DigitalAccountTransaction search(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM digital_account_transaction WHERE id = ?");
        stm.setInt(1, id);
        ResultSet rs = stm.executeQuery();
        if (!rs.next()) throw new NotFoundException("Transação não encontrada");
        return parse(rs);
    }

    public List<DigitalAccountTransaction> list() throws SQLException {
        List<DigitalAccountTransaction> list = new ArrayList<>();
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM digital_account_transaction");
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            list.add(parse(rs));
        }
        return list;
    }

    public void update(DigitalAccountTransaction t) throws SQLException {
        String sql = "UPDATE digital_account_transaction SET account_id = ?, type = ?, amount = ?, description = ?, transaction_date = ? WHERE id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, t.getAccountId());
            stm.setString(2, t.getType());
            stm.setDouble(3, t.getAmount());
            stm.setString(4, t.getDescription());
            stm.setDate(5, new java.sql.Date(t.getTransactionDate().getTime()));
            stm.setInt(6, t.getId());
            stm.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("DELETE FROM digital_account_transaction WHERE id = ?");
        stm.setInt(1, id);
        if (stm.executeUpdate() == 0) throw new NotFoundException("Transação não encontrada");
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }
}
