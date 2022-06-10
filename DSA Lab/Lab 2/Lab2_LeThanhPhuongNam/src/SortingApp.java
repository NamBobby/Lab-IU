public class SortingApp {
	public static void Implement(Array a) {
		long startTime, endTime;
		Array c1 = a.clone(); 
		Array c2 = a.clone(); 
		Array c3 = a.clone();
		
		System.out.println("Test case: " + a.getnElems());
		// --- bubble sort ---
		startTime = TimeUtils.now();
		c1.bubbleSort();
		endTime = TimeUtils.now();
		System.out.printf("Bubble Sort: %d ms\n", endTime - startTime);
		System.out.println();
		
		// --- selection sort ---
		startTime = TimeUtils.now();
		c2.selectionSort();
		endTime = TimeUtils.now();
		System.out.printf("Selection Sort: %d ms\n", endTime - startTime);
		System.out.println();
		
		// --- Insertion sort ---
		startTime = TimeUtils.now();
		c3.insertionSort();
		endTime = TimeUtils.now();
		System.out.printf("Insertion Sort: %d ms\n", endTime - startTime);
//		c3.display();
		System.out.println();
	}

	public static void main(String[] args) {
		int maxSize = 10000;
		Array a = new Array(maxSize);
		a.randomInit(maxSize);
		a.inverse();
		a.selectionSort();
		Implement(a);
		System.out.println("Le Thanh Phuong Nam_ITITWE19025");
		
	}
}
