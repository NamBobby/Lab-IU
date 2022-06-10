import java.util.Stack;

public class Pr1{
	public static String DconvertO(int deci){
		Stack<Integer> octalF = new Stack<>();
		String snum = new String();
		if(deci==0){
			octalF.push(0);
		}
		while(deci > 0){
			octalF.push(deci%8);
			deci/=8;
		}
		
		while(octalF.isEmpty()!= true){
			snum+=octalF.peek().toString();
			octalF.pop();
		}
		return snum;
	}
	
	public static <T> Stack<T> Concate(Stack<T> firstScon, Stack<T> seScon){
		Stack<T> firstS = (Stack<T>) firstScon.clone();
		Stack<T> seS = (Stack<T>) seScon.clone();
		Stack<T> temS = new Stack<T>();
		while(!seS.isEmpty()){
			temS.push(seS.peek());
			seS.pop();
		}
		while(!temS.isEmpty()){
			firstS.push(temS.peek());
			temS.pop();
		}
		return firstS;
	}
	
	public static <T> Boolean checkSB(Stack<T> firstS, Stack<T> seS){
		if(firstS.size() != seS.size())
			return false;
		while(!firstS.isEmpty()){
			if(!firstS.peek().equals(seS.peek()))
				return false;
			firstS.pop();
			seS.pop();
		} return true;
	}
	
	public static void main(String[] args){
		int deci=244;
		System.out.println("LE THANH PHUONG NAM_ITITWE19025");
		//Convert Decimal to Octal
		System.out.println("Decimal number convert to Octal number: " + DconvertO(deci));
		Stack<Integer> firstS = new Stack<Integer>();
		Stack<Integer> seS = new Stack<Integer>();
		//Input 2 stack value
		firstS.push(11);
		firstS.push(9);
		firstS.push(2);
		firstS.push(4);
		firstS.push(30);
		
		seS.push(60);
		seS.push(18);
		seS.push(3);
		seS.push(5);
		seS.push(10);
		//Concatenate
		System.out.println("Concatenate of 2 stack: ");
		Stack<Integer> stack = new Stack<Integer>();
		stack = Concate(firstS, seS);
		while(!stack.isEmpty()){
			System.out.print(stack.peek() + " ");
			stack.pop();
		}
		System.out.println();		
		//Check 2 stack Identical or not
		System.out.println("Stack Identical: "+ checkSB(firstS, seS));
		
	}
}
