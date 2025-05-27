package br.com.fiap.projeto_fintech.model;

import java.util.Date;

public class CreditCardExpense {
    private int id;
    private int creditCardId;
    private String description;
    private double amount;
    private Date expenseDate;

    public CreditCardExpense() {
    }

    public CreditCardExpense(int creditCardId, String description, double amount, Date expenseDate) {
        this.creditCardId = creditCardId;
        this.description = description;
        this.amount = amount;
        this.expenseDate = expenseDate;
    }

    public CreditCardExpense(int id, int creditCardId, String description, double amount, Date expenseDate) {
        this.id = id;
        this.creditCardId = creditCardId;
        this.description = description;
        this.amount = amount;
        this.expenseDate = expenseDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCreditCardId() {
        return creditCardId;
    }

    public void setCreditCardId(int creditCardId) {
        this.creditCardId = creditCardId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getExpenseDate() {
        return expenseDate;
    }

    public void setExpenseDate(Date expenseDate) {
        this.expenseDate = expenseDate;
    }
}
