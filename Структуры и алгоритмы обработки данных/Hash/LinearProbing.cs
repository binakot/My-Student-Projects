using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication1
{
    public class HashLinear 
    {
        private DataItem[] hashArray; 
        private int arraySize;
        private DataItem bufItem; 

        public HashLinear(int size) 
        {
            arraySize = size;
            hashArray = new DataItem[arraySize];
            bufItem = new DataItem(-1);
        }        

        public int hashFunction(int key) 
        {
            return key % arraySize; 
        }

        public void insert(DataItem item)
        {
            int key = item.getKey(); 
            int hashVal = hashFunction(key);    
            
            while (hashArray[hashVal] != null && hashArray[hashVal].getKey() != -1) 
            {
                ++hashVal; 
                hashVal %= arraySize;
            }
            hashArray[hashVal] = item; 
        }

        public DataItem delete(int key) 
        {
            int hashVal = hashFunction(key); 

            while (hashArray[hashVal] != null)
            { 
                if (hashArray[hashVal].getKey() == key) 
                {
                    DataItem temp = hashArray[hashVal];
                    hashArray[hashVal] = bufItem;
                    return temp;
                }
                ++hashVal;
                hashVal %= arraySize; 
            }
            return null;
        }

        public DataItem find(int key) 
        {
            int hashVal = hashFunction(key);

            while (hashArray[hashVal] != null)
            { 
                if (hashArray[hashVal].getKey() == key)
                    return hashArray[hashVal];
                ++hashVal;
                hashVal %= arraySize;
            }
            return null;
        }

        public Int32 FindCount(int key)
        {
            int hashVal = hashFunction(key);
            Int32 Count = 1;

            while (hashArray[hashVal] != null)
            {
                if (hashArray[hashVal].getKey() == key)
                    return Count;
                ++hashVal;
                Count++;
                hashVal %= arraySize;
            }
            return -1;
        }
    }

    public class DataItem 
    { 
        private int data; 

        public DataItem(int d) 
        {
            data = d;
        }

        public int getKey() 
        {
            return data;
        }
    }
}
