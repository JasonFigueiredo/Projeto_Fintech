package br.com.fiap.projeto_fintech.view;

import br.com.fiap.projeto_fintech.dao.CreditCardDao;
import br.com.fiap.projeto_fintech.exception.NotFoundException;
import br.com.fiap.projeto_fintech.model.CreditCard;

import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

public class CreditCardView {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        CreditCardDao dao;

        System.out.println("Bem-vindo ao sistema de gerenciamento de cartões de crédito!");

        try {
            dao = new CreditCardDao();
            int choice;
            do {
                System.out.println("\nEscolha uma opção:");
                System.out.println("1. Listar cartões");
                System.out.println("2. Criar cartão");
                System.out.println("3. Atualizar cartão");
                System.out.println("4. Deletar cartão");
                System.out.println("5. Pesquisar cartão por ID");
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

    private static void list(CreditCardDao dao) throws SQLException {
        List<CreditCard> cards = dao.list();
        for (CreditCard card : cards) {
            System.out.println(card.getId() + ", " + card.getUserId() + ", " + card.getName() + ", " + card.getLimit() + ", " + card.getBrand() + ", " + card.getExpirationDate() + ", " + card.getClosingDate());
        }
    }

    private static void create(Scanner scanner, CreditCardDao dao) {
        try {
            System.out.println("Digite o ID do usuário:");
            int userId = scanner.nextInt();
            scanner.nextLine();

            System.out.println("Digite o nome do cartão:");
            String name = scanner.nextLine();

            System.out.println("Digite o limite:");
            double limit = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a bandeira:");
            String brand = scanner.nextLine();

            System.out.println("Digite o dia de expiração:");
            int expiration = scanner.nextInt();

            System.out.println("Digite dia de fechamento:");
            int closing = scanner.nextInt();

            CreditCard card = new CreditCard(0, userId, name, limit, brand, expiration, closing);
            dao.create(card);

            System.out.println("Cartão criado com sucesso!");

        } catch (Exception e) {
            System.err.println("Erro ao criar cartão: " + e.getMessage());
        }
    }

    private static void update(Scanner scanner, CreditCardDao dao) {
        try {
            System.out.println("Digite o ID do cartão:");
            int id = scanner.nextInt();
            scanner.nextLine();

            CreditCard card = dao.search(id);

            System.out.println("Digite o novo nome do cartão:");
            String name = scanner.nextLine();

            System.out.println("Digite o novo limite:");
            double limit = scanner.nextDouble();
            scanner.nextLine();

            System.out.println("Digite a nova bandeira:");
            String brand = scanner.nextLine();

            System.out.println("Digite a nova data de expiração (dd/MM):");
            int expiration = scanner.nextInt();

            System.out.println("Digite a nova data de fechamento (dd/MM):");
            int closing = scanner.nextInt();

            card.setName(name);
            card.setLimit(limit);
            card.setBrand(brand);
            card.setExpirationDate(expiration);
            card.setClosingDate(closing);

            dao.update(card);

            System.out.println("Cartão atualizado com sucesso!");

        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        } catch (Exception e) {
            System.err.println("Erro ao atualizar cartão: " + e.getMessage());
        }
    }

    private static void delete(Scanner scanner, CreditCardDao dao) {
        System.out.println("Digite o ID do cartão a ser deletado:");
        int id = scanner.nextInt();
        try {
            dao.delete(id);
            System.out.println("Cartão deletado com sucesso!");
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }

    private static void findById(Scanner scanner, CreditCardDao dao) {
        System.out.println("Digite o ID do cartão a ser pesquisado:");
        int id = scanner.nextInt();
        try {
            CreditCard card = dao.search(id);
            System.out.println("Cartão encontrado:");
            System.out.println(card.getId() + ", " + card.getUserId() + ", " + card.getName() + ", " + card.getLimit() + ", " + card.getBrand() + ", " + card.getExpirationDate() + ", " + card.getClosingDate());
        } catch (SQLException | NotFoundException e) {
            System.err.println(e.getMessage());
        }
    }
}
