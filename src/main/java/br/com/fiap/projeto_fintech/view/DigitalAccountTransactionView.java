package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.DigitalAccountTransactionDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.DigitalAccountTransaction;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

public class DigitalAccountTransactionView {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DigitalAccountTransactionDao dao;

        System.out.println("Bem-vindo ao sistema de transações da conta digital!");

        try {
            dao = new DigitalAccountTransactionDao();
            int choice;
            do {
                System.out.println("\nEscolha uma opção:");
                System.out.println("1. Listar transações");
                System.out.println("2. Criar transação");
                System.out.println("3. Atualizar transação");
                System.out.println("4. Deletar transação");
                System.out.println("5. Pesquisar transação por ID");
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

    private static void list(DigitalAccountTransactionDao dao) throws SQLException {
        List<DigitalAccountTransaction> list = dao.list();
        for (DigitalAccountTransaction t : list) {
            System.out.println(t.getId() + ", " + t.getAccountId() + ", " + t.getType() + ", " + t.getAmount() + ", " + t.getDescription() + ", " + t.getTransactionDate());
        }
    }

    private static void create(Scanner scanner, DigitalAccountTransactionDao dao) {
        try {
            System.out.println("Digite o ID da conta digital:");
            int accountId = scanner.nextInt();
            scanner.nextLine();

            System.out.println("Digite o tipo (entrada/saida):");
            String type = scanner.nextLine();

            System.out.println("Digite a descrição:");
            String description = scanner.nextLine();

            System.out.println("Digite o valor:");
            double amount = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a data da transação (yyyy-MM-dd):");
            String dateStr = scanner.nextLine();
            Date transactionDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            DigitalAccountTransaction t = new DigitalAccountTransaction(0, accountId, type, amount, description, transactionDate);
            dao.create(t);
            System.out.println("Transação criada com sucesso!");
        } catch (Exception e) {
            System.err.println("Erro ao criar transação: " + e.getMessage());
        }
    }

    private static void update(Scanner scanner, DigitalAccountTransactionDao dao) {
        try {
            System.out.println("Digite o ID da transação:");
            int id = scanner.nextInt();
            scanner.nextLine();

            DigitalAccountTransaction t = dao.search(id);

            System.out.println("Digite o novo tipo:");
            String type = scanner.nextLine();

            System.out.println("Digite a nova descrição:");
            String description = scanner.nextLine();

            System.out.println("Digite o novo valor:");
            double amount = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a nova data (yyyy-MM-dd):");
            String dateStr = scanner.nextLine();
            Date transactionDate = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);

            t.setType(type);
            t.setDescription(description);
            t.setAmount(amount);
            t.setTransactionDate(transactionDate);

            dao.update(t);
            System.out.println("Transação atualizada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println("Erro ao atualizar transação: " + e.getMessage());
        }
    }

    private static void delete(Scanner scanner, DigitalAccountTransactionDao dao) {
        System.out.println("Digite o ID da transação:");
        int id = scanner.nextInt();
        try {
            dao.delete(id);
            System.out.println("Transação deletada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void findById(Scanner scanner, DigitalAccountTransactionDao dao) {
        System.out.println("Digite o ID da transação:");
        int id = scanner.nextInt();
        try {
            DigitalAccountTransaction t = dao.search(id);
            System.out.println("Transação encontrada:");
            System.out.println(t.getId() + ", " + t.getAccountId() + ", " + t.getType() + ", " + t.getAmount() + ", " + t.getDescription() + ", " + t.getTransactionDate());
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }
}
