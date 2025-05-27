package br.com.fiap.projeto_fintech.model;

public class CreditCard {
    private int id;
    private int userId;
    private String name;
    private double limit;
    private String brand;
    private int expirationDate;
    private int closingDate;

    public CreditCard(int id, int userId, String name, double limit, String brand, int expirationDate, int closingDate) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.limit = limit;
        this.brand = brand;
        this.expirationDate = expirationDate;
        this.closingDate = closingDate;
    }

    public CreditCard(int userId, String name, double limit, String brand, int expirationDate, int closingDate) {
        this.userId = userId;
        this.name = name;
        this.limit = limit;
        this.brand = brand;
        this.expirationDate = expirationDate;
        this.closingDate = closingDate;
    }

    public CreditCard() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLimit() {
        return limit;
    }

    public void setLimit(double limit) {
        this.limit = limit;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(int expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getClosingDate() {
        return closingDate;
    }

    public void setClosingDate(int closingDate) {
        this.closingDate = closingDate;
    }
}
