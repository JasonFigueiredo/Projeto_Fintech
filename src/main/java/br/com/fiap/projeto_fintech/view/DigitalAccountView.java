package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.DigitalAccountDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.DigitalAccount;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class DigitalAccountView {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        DigitalAccountDao dao;

        System.out.println("Bem-vindo ao sistema de contas digitais!");

        try {
            dao = new DigitalAccountDao();
            int choice;
            do {
                System.out.println("\nEscolha uma opção:");
                System.out.println("1. Listar contas");
                System.out.println("2. Criar conta");
                System.out.println("3. Atualizar conta");
                System.out.println("4. Deletar conta");
                System.out.println("5. Pesquisar conta por ID");
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

    private static void list(DigitalAccountDao dao) throws SQLException {
        List<DigitalAccount> list = dao.list();
        for (DigitalAccount a : list) {
            System.out.println(a.getId() + ", " + a.getUserId() + ", " + a.getName() + ", " + a.getBalance());
        }
    }

    private static void create(Scanner scanner, DigitalAccountDao dao) {
        try {
            System.out.println("Digite o ID do usuário:");
            int userId = scanner.nextInt();
            scanner.nextLine();
            System.out.println("Digite o nome da conta:");
            String name = scanner.nextLine();
            System.out.println("Digite o saldo inicial:");
            double balance = scanner.nextDouble();

            DigitalAccount account = new DigitalAccount(0, userId, name, balance);
            dao.create(account);
            System.out.println("Conta criada com sucesso!");
        } catch (Exception e) {
            System.err.println("Erro ao criar conta: " + e.getMessage());
        }
    }

    private static void update(Scanner scanner, DigitalAccountDao dao) {
        try {
            System.out.println("Digite o ID da conta:");
            int id = scanner.nextInt();
            scanner.nextLine();

            DigitalAccount account = dao.search(id);

            System.out.println("Digite o novo nome da conta:");
            String name = scanner.nextLine();
            System.out.println("Digite o novo saldo:");
            double balance = scanner.nextDouble();

            account.setName(name);
            account.setBalance(balance);

            dao.update(account);
            System.out.println("Conta atualizada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void delete(Scanner scanner, DigitalAccountDao dao) {
        System.out.println("Digite o ID da conta a ser deletada:");
        int id = scanner.nextInt();
        try {
            dao.delete(id);
            System.out.println("Conta deletada com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void findById(Scanner scanner, DigitalAccountDao dao) {
        System.out.println("Digite o ID da conta:");
        int id = scanner.nextInt();
        try {
            DigitalAccount account = dao.search(id);
            System.out.println("Conta encontrada:");
            System.out.println(account.getId() + ", " + account.getUserId() + ", " + account.getName() + ", " + account.getBalance());
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }
}