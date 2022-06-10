import java.util.Arrays;

public class Lab5 {

	public static int puzzle(int base, int limit) {
		if (base > limit)
			return -1;
		else if (base == limit)
			return 1;
		else
			return base * puzzle(base + 1, limit);
	}

	public static double Q4sum(int n) {
		if (n == 1)
			return 1;
		else
			return 1f/n + Q4sum(n - 1);
	}

	public static int Q5sum(int n) {
		if (n == 1)
			return 1;
		else
			return n + Q5sum(n - 1);
	}

	public static int findmin(int a[], int n) {
		if (n == 0)
			return a[0];
		else {
			int min = Math.min(a[n - 1], findmin(a, n - 1));
			return min;
		}
	}

	public static int findsum(int a[], int n) {
		if (n == 1)
			return a[0];
		else
			return a[n - 1] + findsum(a, n - 1);
	}

	public static int gcd(int p, int q) {
		if (q == 0)
			return p;
		else
			return gcd(q, p % q);
	}

	public static void main(String[] args) {

		int a[] = { -15, -1, 0, 68, -5, 24, 100};
		int n = a.length;
		
		System.out.println("Le Thanh Phuong Nam ITITWE19025");

		System.out.println("Question 3: ");
		System.out.println(puzzle(14, 10));
		System.out.println(puzzle(4, 7));
		System.out.println(puzzle(0, 0));
		
		System.out.println("Question 4: ");
		System.out.println(Q4sum(24));
		
		System.out.println("Question 5: ");
		System.out.println(Q5sum(25));
		
		System.out.println("Question 6:");
		System.out.println(findmin(a, n));
		
		System.out.println("Question 7: ");
		System.out.println(findsum(a, n));
		
		System.out.println("Question 8: ");
		System.out.println(gcd(24, 15));
	}
}
