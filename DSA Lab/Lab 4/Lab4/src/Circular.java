public class Circular {

    private NodeCreate first;
    private NodeCreate temp;
    private int size;
    public Circular gettemp;

    public Circular() {
        first = null;
        temp = null;
        size = 0;
    }

    public boolean isEmpty() {
        return first == null;
    }

    public void step() {
        temp = temp.next;
    }

    public NodeCreate gettemp() {
        return temp;
    }

    public NodeCreate getFirst() {
        return first;
    }

    public void insert(int x) {
        NodeCreate newNode = new NodeCreate(x);

        if (isEmpty()) {
            first = newNode;
            temp = first;
        } else {
            temp.next = newNode;
        }

        newNode.next = first;
        step();
        size++;
    }

    public boolean search(int x) {
        NodeCreate search = first;
        int y = 0;

        while (search.data != x && y < size) {
            search = search.next;
            y++;
        }

        if (search.data == x) {
            System.out.println("Found data: " + search.data);
            return true;
        } else {
            System.out.println("Found data: null");
            return false;
        }

    }

    public void delete(int x) {
        NodeCreate prev = first;
        NodeCreate curr = first.next;

        while (curr.data != x) {
            prev = curr;
            curr = curr.next;

        }

        if (size == 1) {
            first = null;
            size--;
        } else if (curr == first) {
            prev.next = curr.next;
            first = curr.next;
            size--;
        } else {
            prev.next = curr.next;
            size--;
        }

    }

    public void showimplement() {
        int x = 0;
        NodeCreate printer = first;

        while (x < size) {
            printer.displayNode();
            printer = printer.next;
            x++;
        }
        System.out.println("");

    }

    public static void main(String[] args) {
    	Circular a = new Circular();

        a.insert(0);
        a.insert(1);
        a.insert(2);
        a.insert(3);
        a.insert(4);
        a.insert(5);
        a.insert(6);
        
        a.showimplement();

        a.search(3);
        a.delete(5);
        a.delete(4);
        
        a.showimplement();
        
        System.out.println("Le Thanh Phuong Nam_ITITWE19025");

    }
}