package br.com.fiap.projeto_fintech.dao;

import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.factory.ConnectionFactory;
import br.com.fiap.projeto_fintech.model.DigitalAccount;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DigitalAccountDao {
    private Connection connection;

    public DigitalAccountDao() throws SQLException {
        connection = ConnectionFactory.getConnection();
    }

    private DigitalAccount parse(ResultSet result) throws SQLException {
        return new DigitalAccount(
                result.getInt("id"),
                result.getInt("user_id"),
                result.getString("name"),
                result.getDouble("balance")
        );
    }

    public void create(DigitalAccount account) throws SQLException {
        String sql = "INSERT INTO digital_account (id, user_id, name, balance) VALUES (seq_digital_account.nextval, ?, ?, ?)";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, account.getUserId());
            stm.setString(2, account.getName());
            stm.setDouble(3, account.getBalance());
            stm.executeUpdate();
        }
    }

    public DigitalAccount search(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM digital_account WHERE id = ?");
        stm.setInt(1, id);
        ResultSet result = stm.executeQuery();
        if (!result.next()) throw new NotFoundException("Conta digital não encontrada");
        return parse(result);
    }

    public List<DigitalAccount> list() throws SQLException {
        List<DigitalAccount> list = new ArrayList<>();
        PreparedStatement stm = connection.prepareStatement("SELECT * FROM digital_account");
        ResultSet result = stm.executeQuery();
        while (result.next()) {
            list.add(parse(result));
        }
        return list;
    }

    public void update(DigitalAccount account) throws SQLException {
        String sql = "UPDATE digital_account SET user_id = ?, name = ?, balance = ? WHERE id = ?";
        try (PreparedStatement stm = connection.prepareStatement(sql)) {
            stm.setInt(1, account.getUserId());
            stm.setString(2, account.getName());
            stm.setDouble(3, account.getBalance());
            stm.setInt(4, account.getId());
            stm.executeUpdate();
        }
    }

    public void delete(int id) throws SQLException, NotFoundException {
        PreparedStatement stm = connection.prepareStatement("DELETE FROM digital_account WHERE id = ?");
        stm.setInt(1, id);
        if (stm.executeUpdate() == 0) throw new NotFoundException("Conta digital não encontrada");
    }

    public void closeConnection() throws SQLException {
        connection.close();
    }
}
