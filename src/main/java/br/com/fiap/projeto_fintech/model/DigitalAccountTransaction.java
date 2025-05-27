package br.com.fiap.projeto_fintech.model;

import java.util.Date;

public class DigitalAccountTransaction {
    private int id;
    private int accountId;
    private String type;
    private double amount;
    private String description;
    private Date transactionDate;

    public DigitalAccountTransaction() {
    }

    public DigitalAccountTransaction(int accountId, String type, double amount, String description, Date transactionDate) {
        this.accountId = accountId;
        this.type = type;
        this.amount = amount;
        this.description = description;
        this.transactionDate = transactionDate;
    }

    public DigitalAccountTransaction(int id, int accountId, String type, double amount, String description, Date transactionDate) {
        this.id = id;
        this.accountId = accountId;
        this.type = type;
        this.amount = amount;
        this.description = description;
        this.transactionDate = transactionDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }
}
