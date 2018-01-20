using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication1
{
    public class HashTableWithDoubleHashing
    {
        private DataItem[] hashArray;
        private int arraySize;
        private DataItem bufItem;

        public HashTableWithDoubleHashing(int size)
        {
            arraySize = size;
            hashArray = new DataItem[arraySize];
            bufItem = new DataItem(-1);
        }

        public int hashFunc1(int key)
        {
            return key % arraySize;
        }

        public int hashFunc2(int key)
        {
            return 10 - key % 10;
        }

        public void insert(int key, DataItem item)
        {
            int hashVal = hashFunc1(key);
            int stepSize = hashFunc2(key);
            while (hashArray[hashVal] != null && hashArray[hashVal].getKey() != -1)
            {
                hashVal += stepSize;
                hashVal %= arraySize;
            }
            hashArray[hashVal] = item;
        }

        public DataItem delete(int key)
        {
            int hashVal = hashFunc1(key);
            int stepSize = hashFunc2(key);

            while (hashArray[hashVal] != null)
            {
                if (hashArray[hashVal].getKey() == key)
                {
                    DataItem temp = hashArray[hashVal];
                    hashArray[hashVal] = bufItem;
                    return temp;
                }
                hashVal += stepSize;
                hashVal %= arraySize;
            }
            return null;
        }

        public DataItem find(int key)
        {
            int hashVal = hashFunc1(key);
            int stepSize = hashFunc2(key);

            while (hashArray[hashVal] != null)
            {
                if (hashArray[hashVal].getKey() == key)
                    return hashArray[hashVal];
                hashVal += stepSize;
                hashVal %= arraySize;
            }
            return null;
        }

        public Int32 FindCount(int key)
        {
            int hashVal = hashFunc1(key);
            int stepSize = hashFunc2(key);
            Int32 Count = 0;

            while (hashArray[hashVal] != null)
            {
                if (hashArray[hashVal].getKey() == key)
                    return Count;
                hashVal += stepSize;
                Count++;
                hashVal %= arraySize;
            }
            return -1;
        }
    }      
}
