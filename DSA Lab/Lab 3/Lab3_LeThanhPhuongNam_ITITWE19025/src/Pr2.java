import java.util.Stack;

public class Pr2{
	public static Integer implement(String express){
		char[] tokc = express.toCharArray();
		Stack<Integer> valS = new Stack<Integer>();
		Stack<Character> OperaS = new Stack<Character>();

		for(int i=0; i<tokc.length; i++){
			if (tokc[i] != ' '){
				if (tokc[i] >= '0' && tokc[i] <= '9'){
					StringBuffer bufs = new StringBuffer();
					while(i<tokc.length && (tokc[i]>='0' && tokc[i]<='9')){
						bufs.append(tokc[i++]);
					}
					valS.push(Integer.parseInt(bufs.toString()));
				}
				else if(tokc[i] == '(')
					OperaS.push(tokc[i]);
				else if(tokc[i] == ')'){
					while(OperaS.peek() != '(')
						valS.push(OperAp(OperaS.pop(), valS.pop(), valS.pop()));
					OperaS.pop();
				} 
				else if(tokc[i] == '+' || tokc[i] == '-' || tokc[i] == '*' || tokc[i] == '/'){
					while(!OperaS.empty() && checkB(tokc[i], OperaS.peek()))
						valS.push(OperAp(OperaS.pop(), valS.pop(), valS.pop()));
					OperaS.push(tokc[i]);
				}
			}
		}
		while(!OperaS.empty())
			valS.push(OperAp(OperaS.pop(), valS.pop(), valS.pop()));
		return valS.pop();
	}

	public static Boolean checkB(char firstop, char seop){
		if(seop == '(' || seop == ')')
			return false;
		if((firstop == '*' || firstop == '/') && (seop == '+' || seop == '-'))
			return false;
		else
			return true;
	}

	public static Integer OperAp(char op, int b, int a){
		switch(op) {
		case '+':
			return a+b;
		case '-':
			return a-b;
		case '*':
			return a*b;
		case '/':
			if (b==0)
				System.out.println("Could not be divided by 0!");
			return a/b;
		}
		return 0;
	}

	public static void main(String[] args){
		System.out.println("LE THANH PHUONG NAM_ITITWE19025");
		//print result in  infix-form arithmetic expression
		System.out.println("Infix-Form Arithmetic Expression: ");
		System.out.println("Result: " + implement(" ( 123 + 56 ) * ( 78 - 1 ) "));
	}
}
