package orderedarray;
// orderedArray.java
// demonstrates ordered array class
// to run this program: C>java OrderedApp
////////////////////////////////////////////////////////////////
class OrdArray
   {
   private long[] a;                 // ref to array a
   private int nElems;               // number of data items
   //-----------------------------------------------------------
   public OrdArray(int max)          // constructor
      {
      a = new long[max];             // create array
      nElems = 0;
      }
   //-----------------------------------------------------------
   public int size()
      { return nElems; }
   //-----------------------------------------------------------
   public int find(long searchKey)
      {
      int lowerBound = 0;
      int upperBound = nElems-1;
      int curIn;

      while(true)
         {
         curIn = (lowerBound + upperBound ) / 2;
         if(a[curIn]==searchKey)
            return curIn;              // found it
         else if(lowerBound > upperBound)
            return nElems;             // can't find it
         else                          // divide range
            {
            if(a[curIn] < searchKey)
               lowerBound = curIn + 1; // it's in upper half
            else
               upperBound = curIn - 1; // it's in lower half
            }  // end else divide range
         }  // end while
      }  // end find()
   //-----------------------------------------------------------
   public void insert(long value)    // put element into array
      {
      int j;
      for(j=0; j<nElems; j++)        // find where it goes
         if(a[j] > value)            // (linear search)
            break;
      for(int k=nElems; k>j; k--)    // move bigger ones up
         a[k] = a[k-1];
      a[j] = value;                  // insert it
      nElems++;                      // increment size
      }  // end insert()
   //-----------------------------------------------------------
   public boolean delete(long value)
      {
      int j = find(value);
      if(j==nElems)                  // can't find it
         return false;
      else                           // found it
         {
         for(int k=j; k<nElems; k++) // move bigger ones down
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
   public OrdArray merge(OrdArray inputArr) {

       OrdArray mergedArr = new OrdArray(this.size() + inputArr.size());
       int thisIndex = 0, inputIdex = 0, targetIndex = 0;

       while (thisIndex < this.size() && inputIdex < inputArr.size()) {
           if (this.a[thisIndex] > inputArr.a[inputIdex]) {
               mergedArr.a[targetIndex] = inputArr.a[inputIdex];
               inputIdex++;

           } else {
               mergedArr.a[targetIndex] = this.a[thisIndex];
               thisIndex++;
           }

           targetIndex++;
       }// end while

       if (thisIndex == this.size()) {
           while (inputIdex < inputArr.size()) {
               mergedArr.a[targetIndex] = inputArr.a[inputIdex];
               inputIdex++;
               targetIndex++;
           }
       } else {
           while (thisIndex < this.size()) {
               mergedArr.a[targetIndex] = this.a[thisIndex];
               thisIndex++;
               targetIndex++;
           }

       }// end if else
       mergedArr.nElems = targetIndex;
       return mergedArr;
   } 
  //-----------------------------------------------------------
   }  // end class OrdArray

////////////////////////////////////////////////////////////////
class OrderedApp
   {
   public static void main(String[] args)
      {
      int maxSize = 100;             // array size
      OrdArray arr, arr1, arr2;                  // reference to array
      arr = new OrdArray(maxSize);   // create the array
      arr1 = new OrdArray(maxSize);
      arr2 = new OrdArray(maxSize);
      
      arr1.insert(77);                // insert 10 items for array 1
      arr1.insert(99);
      arr1.insert(44);
      arr1.insert(55);
      arr1.insert(22);
      arr1.insert(88);
      arr1.insert(11);
      arr1.insert(00);
      arr1.insert(66);
      arr1.insert(33);
      
      arr2.insert(78);                // insert 10 items for array 2
      arr2.insert(98);
      arr2.insert(43);
      arr2.insert(54);
      arr2.insert(21);
      arr2.insert(87);
      arr2.insert(10);
      arr2.insert(1);
      arr2.insert(65);
      arr2.insert(32);

      int searchKey = 55;            // search for item
      if( arr1.find(searchKey) != arr1.size() )
         System.out.println("Found " + searchKey);
      else
         System.out.println("Can't find " + searchKey);

      arr1.display();                 // display items

      arr1.delete(00);                // delete 3 items
      arr1.delete(55);
      arr1.delete(99);

      arr1.display();                 // display items again
      arr2.display();
      arr = arr1.merge(arr2);
      arr.display();
      System.out.println("Le Thanh Phuong Nam _ITITWE19025");
      }  // end main()
   }  // end class OrderedApp
