package br.com.fiap.projeto_fintech.view;
import java.util.Scanner;

public class TestView {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n--- MENU PRINCIPAL ---");
            System.out.println("1. Gerenciar Cartões de Crédito");
            System.out.println("2. Gerenciar Despesas do Cartão de Crédito");
            System.out.println("3. Gerenciar Contas Digitais");
            System.out.println("4. Gerenciar Transações da Conta Digital");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opção: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    CreditCardView.main(new String[] {});
                    break;
                case 2:
                    CreditCardExpenseView.main(new String[] {});
                    break;
                case 3:
                    DigitalAccountView.main(new String[] {});
                    break;
                case 4:
                    DigitalAccountTransactionView.main(new String[] {});
                    break;
                case 0:
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("Opção inválida!");
            }
        } while (choice != 0);
    }
}
