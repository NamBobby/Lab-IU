package chap01.basic;

import java.util.Scanner;

public class p06_calculator {
	public static void main(String[] args) {
		int numberFirst;
		int numberSecond;
		int result = 0;
		String calculate;
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Number First: ");
		numberFirst = sc.nextInt();	
		sc.nextLine();
		System.out.println("Number Second: ");
		numberSecond = sc.nextInt();
		sc.nextLine();
		System.out.println("Calculate: ");
		calculate = sc.nextLine();
		sc.close();
		
		switch (calculate) {
		case "+":
			result = numberFirst + numberSecond;
			break;
		case "-":
			result = numberFirst - numberSecond;
			break;
		case "*":
			result = numberFirst * numberSecond;
			break;
		case "/":
			result = numberFirst / numberSecond;
			break;
		case "%":
			result = numberFirst % numberSecond;
			break;

		default:
			System.out.println("Wrong!");
			break;
		}
			System.out.printf("%d %s %d = %d",numberFirst,calculate,numberSecond,result);
		
	}
}
