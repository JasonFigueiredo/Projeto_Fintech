package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.CreditCardExpenseDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.CreditCardExpense;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class CreditCardExpenseView {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        CreditCardExpenseDao dao;

        System.out.println("Bem-vindo ao sistema de gerenciamento de despesas do cartão!");

        try {
            dao = new CreditCardExpenseDao();
            int choice;
            do {
                System.out.println("\nEscolha uma opção:");
                System.out.println("1. Listar despesas");
                System.out.println("2. Criar despesa");
                System.out.println("3. Atualizar despesa");
                System.out.println("4. Deletar despesa");
                System.out.println("5. Pesquisar despesa por ID");
                System.out.println("0. Sair");
                choice = scanner.nextInt();

                switch (choice) {
                    case 1:
                        list(dao);
                        break;
                    case 2:
                        create(scanner, dao);
                        break;
                    case 3:
                        update(scanner, dao);
                        break;
                    case 4:
                        delete(scanner, dao);
                        break;
                    case 5:
                        findById(scanner, dao);
                        break;
                    case 0:
                        System.out.println("Saindo...");
                        break;
                    default:
                        System.out.println("Opção inválida!");
                }
            } while (choice != 0);

            dao.closeConnection();

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void list(CreditCardExpenseDao dao) throws SQLException {
        List<CreditCardExpense> expenses = dao.list();
        for (CreditCardExpense expense : expenses) {
            System.out.println(expense.getId() + ", " + expense.getCreditCardId() + ", " + expense.getDescription() + ", " + expense.getAmount() + ", " + expense.getExpenseDate());
        }
    }

    private static void create(Scanner scanner, CreditCardExpenseDao dao) {
        try {
            System.out.println("Digite o ID do cartão de crédito:");
            int cardId = scanner.nextInt();
            scanner.nextLine();

            System.out.println("Digite a descrição da despesa:");
            String description = scanner.nextLine();

            System.out.println("Digite o valor:");
            double amount = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a data da despesa (yyyy-MM-dd):");
            String dateStr = scanner.nextLine();
            Date expenseDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            CreditCardExpense expense = new CreditCardExpense(0, cardId, description, amount, expenseDate);
            dao.create(expense);

            System.out.println("Despesa criada com sucesso!");
        } catch (Exception e) {
            System.err.println("Erro ao criar despesa: " + e.getMessage());
        }
    }

    private static void update(Scanner scanner, CreditCardExpenseDao dao) {
        try {
            System.out.println("Digite o ID da despesa:");
            int id = scanner.nextInt();
            scanner.nextLine();

            CreditCardExpense expense = dao.search(id);

            System.out.println("Digite a nova descrição:");
            String description = scanner.nextLine();

            System.out.println("Digite o novo valor:");
            double amount = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a nova data (yyyy-MM-dd):");
            String dateStr = scanner.nextLine();
            Date expenseDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            expense.setDescription(description);
            expense.setAmount(amount);
            expense.setExpenseDate(expenseDate);

            dao.update(expense);
            System.out.println("Despesa atualizada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println("Erro ao atualizar despesa: " + e.getMessage());
        }
    }

    private static void delete(Scanner scanner, CreditCardExpenseDao dao) {
        System.out.println("Digite o ID da despesa a ser deletada:");
        int id = scanner.nextInt();
        try {
            dao.delete(id);
            System.out.println("Despesa deletada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void findById(Scanner scanner, CreditCardExpenseDao dao) {
        System.out.println("Digite o ID da despesa:");
        int id = scanner.nextInt();
        try {
            CreditCardExpense expense = dao.search(id);
            System.out.println("Despesa encontrada:");
            System.out.println(expense.getId() + ", " + expense.getCreditCardId() + ", " + expense.getDescription() + ", " + expense.getAmount() + ", " + expense.getExpenseDate());
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }
}