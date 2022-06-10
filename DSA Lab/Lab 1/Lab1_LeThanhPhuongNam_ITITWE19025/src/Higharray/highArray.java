package Higharray;
import java.util.Arrays;

// highArray.java
// demonstrates array class with high-level interface
// to run this program: C>java HighArrayApp
////////////////////////////////////////////////////////////////
class HighArray
   {
   private long[] a;                 // ref to array a
   private int nElems;               // number of data items
   //-----------------------------------------------------------
   public HighArray(int max)         // constructor
      {
      a = new long[max];                 // create the array
      nElems = 0;                        // no items yet
      }
   //-----------------------------------------------------------
   public boolean find(long searchKey)
      {                              // find specified value
      int j;
      for(j=0; j<nElems; j++)            // for each element,
         if(a[j] == searchKey)           // found item?
            break;                       // exit loop before end
      if(j == nElems)                    // gone to end?
         return false;                   // yes, can't find it
      else
         return true;                    // no, found it
      }  // end find()
   //-----------------------------------------------------------
   public void insert(long value)    // put element into array
      {
      a[nElems] = value;             // insert it
      nElems++;                      // increment size
      }
   //-----------------------------------------------------------
   public boolean delete(long value)
      {
      int j;
      for(j=0; j<nElems; j++)        // look for it
         if( value == a[j] )
            break;
      if(j==nElems)                  // can't find it
         return false;
      else                           // found it
         {
         for(int k=j; k<nElems; k++) // move higher ones down
            a[k] = a[k+1];
         nElems--;                   // decrement size
         return true;
         }
      }  // end delete()
   //-----------------------------------------------------------
   public void display()             // displays array contents
      {
      for(int j=0; j<nElems; j++)       // for each element,
         System.out.print(a[j] + " ");  // display it
      System.out.println("");
      }
 //-----------------------------------------------------------
   public long getMax() // get maximum value
   {

       if (nElems == 0)
           return -1;
       long lngMax = a[0];
       for (int j = 1; j < nElems; j++)
           if (lngMax < a[j])
               lngMax = a[j];
       return lngMax;
   }
   public long removeMax() // get maximum value
   {
       long max=-1;
       for(int i =0; i<nElems; i++) {
    	   if(a[i] >= max) {
    		   max = a[i];
    	   }
       }
   int j;
   for(j=0;j<nElems;j++) 
	   if(max == a[j])
		   break;
	   for(int k = j; k <nElems;k++)
		   a[k] = a[k+1];
	   nElems--;
	   return max;
   }
 //-----------------------------------------------------------
   public void noDups()

   {

   int len = nElems;
   int i = 0;
   int count = 0;
   int p=0;
   while(i < len)
   {
   for(int j=0; j<nElems;j++)
   {
   if(i != j && a[i] == a[j] && a[i] != -99)
   a[j] = -99;
   }
   i++;
   }
   for(int y=0; y<nElems;y++)
   {
   if(a[y]== -99)
   count++;
   while (p < count)
   {
   for (int k=0; k<nElems;k++)
   {
   if(a[k] == -99)
   {
   for(int h=k; h<nElems;h++)
   {
   a[h] = a[h+1];
   }
   len--;
   nElems --;

   }//end if

   }//end for

   p++;

   }
   }}
////////////////////////////////////////////////////////////////
   }  // end class HighArray
////////////////////////////////////////////////////////////////
class HighArrayApp
   {
   public static void main(String[] args)
      {
      int maxSize = 100;            // array size
      HighArray arr;                // reference to array
      arr = new HighArray(maxSize); // create the array

      arr.insert(77);               // insert 10 items
      arr.insert(99);
      arr.insert(44);
      arr.insert(55);
      arr.insert(22);
      arr.insert(88);
      arr.insert(11);
      arr.insert(00);
      arr.insert(66);
      arr.insert(33);
      arr.insert(33);
      arr.insert(77);
      arr.insert(66);

      arr.display();                // display items

      int searchKey = 35;           // search for item
      if( arr.find(searchKey) )
         System.out.println("Found " + searchKey);
      else
         System.out.println("Can't find " + searchKey);

      arr.delete(00);               // delete 3 items
      arr.delete(55);
      arr.delete(99);

      arr.display();                // display items again
      System.out.println("The maximum is: " + arr.getMax());
      
      System.out.println("The array after remove maximum value is: ");
      arr.removeMax();
      arr.display();
      System.out.println("The array after remove duplicates value is: ");
      arr.noDups();
      arr.delete(-99);
      arr.display();
      System.out.println("Le Thanh Phuong Nam _ITITWE19025");
      }  // end main()
   }  // end class HighArrayApp
