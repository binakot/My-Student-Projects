using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace WindowsFormsApplication1
{
    public class Link 
    {
        private int data;
        public Link next;

        public Link(int d) 
        {
            data = d;
        }

        public int getKey() 
        {
            return data;
        }           
    }

    public class SortedList 
    {
        private Link first;

        public SortedList() 
        {
            first = null;
        }

        public void insert(Link theLink)
        {
            int key = theLink.getKey();
            Link previous = null; 
            Link current = first;    
            
            while (current != null && key > current.getKey()) 
            { 
                previous = current;
                current = current.next; 
            }
            if (previous == null) 
                first = theLink; 
            else
                previous.next = theLink; 
            theLink.next = current; 
        }

        public void delete(int key)
        { 
            Link previous = null; 
            Link current = first;

            while (current != null && key != current.getKey()) 
            { 
                previous = current;
                current = current.next; 
            }    
            if (previous == null) 
                first = first.next;       
            else      
                previous.next = current.next; 
        }

        public Link find(int key) 
        {
            Link current = first; 
            while (current != null && current.getKey() <= key) 
            {
                if (current.getKey() == key)
                    return current;  
                current = current.next;
            }
            return null; 
        }

        public Int32 GetCount(int key)
        {
            Int32 Count = 1;
            Link current = first;
            while (current != null && current.getKey() <= key)
            {
                if (current.getKey() == key)
                    return Count;
                current = current.next;
                Count++;
            }
            return -1;
        }  
    }

    public class HashChain 
    {
        private SortedList[] HashArray;
        private int ArraySize;

        public HashChain(int size) 
        {
            ArraySize = size;
            HashArray = new SortedList[ArraySize];
            for (int i = 0; i < ArraySize; i++)
                HashArray[i] = new SortedList(); 
        } 

        public int HashFunc(int key) 
        {
            return key % ArraySize;
        }

        public void Insert(Link theLink) 
        {
            int key = theLink.getKey();
            int hashVal = HashFunc(key); 
            HashArray[hashVal].insert(theLink); 
        }

        public void Delete(int key) 
        {
            int hashVal = HashFunc(key);
            HashArray[hashVal].delete(key); 
        }

        public Link Find(int key) 
        {
            int hashVal = HashFunc(key);
            Link theLink = HashArray[hashVal].find(key);
            return theLink;
        }

        public Int32 FindCount(int key)
        {            
            int hashVal = HashFunc(key);
            return HashArray[hashVal].GetCount(key);
        } 
    }
}
