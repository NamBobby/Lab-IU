public class Josephus {

    private int countPeo; 
    private int countNum; 
    private NodeCreate head;
    private NodeCreate tail;
    Circular circle;

    public Josephus() {
        circle = new Circular();
        countPeo = 0;
        countNum = 0;

    }

    public void setcountPeo(int n) {
        countPeo = n;

    }

    public int getcountPeo() {
        return countPeo;
    }

    public void setCountNum(int n) {
        countNum = n;
    }

    public int getCountNum() {
        return countNum;
    }

    public void addPeo() {
        for (int i = 1; i < countPeo; i++) {
            circle.insert(i);
        }
    }

    public void eliminate() {

        for (int i = 0; i < countNum; i++) {
            tail = head;
            head = head.next;
        }

        System.out.println("Number is eliminated : " + head.data);

    }

    public void implement() {
        tail = null;
        head = circle.getFirst();
        while (countPeo != 2) {

            eliminate();
            circle.delete(head.data);
            tail = tail.next;
            head = head.next;
            countPeo--;
            display();
        }

    }

    public void display() {
        System.out.print("Number is remaining :  ");
        circle.showimplement();
    }



public static void main(String[] args) {
    Josephus suicide = new Josephus();

    suicide.setcountPeo(8);
    suicide.addPeo();
    suicide.display();

    suicide.setCountNum(3);
    suicide.implement();
    
    System.out.println("Le Thanh Phuong Nam_ITITWE19025");

}


}