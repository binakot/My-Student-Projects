using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;

namespace GraphNS
{
    public class GraphClass
    {
        // Класс вершины графа
        public class GraphNode
        {
            // Номер вешины
            public Int32 index;
            // Координаты вершины
            public Point Location;
            // Связи
            public List<Int32> Links;
        }

        // Вершины графа
        private List<GraphNode> Nodes;
        // Количество вершин
        Int32 size;

        public Int32 Size
        {
            get {return size;}
        }

        public GraphClass()
        {
            Nodes = new List<GraphNode>();
            size = 0;
        }

        public GraphNode this[Int32 i]
        {
            get
            {                             
                foreach (GraphNode node in Nodes)
                    if (node.index == i) return node;
                return null;
            }            
        }
        // Добавляем вершину
        public void AddNode(Int32 x, Int32 y)
        {
            GraphNode node = new GraphNode();
            node.Location.X = x;
            node.Location.Y = y;
            size++;
            node.index = Size;
            node.Links = new List<int>();
            Nodes.Add(node);
        }
        // Добавляем связь
        public void AddLink(Int32 from, Int32 to)
        {
            Boolean notFound = true;

            foreach (Int32 link in this[from].Links) 
                if (link == to) 
                    notFound = false;
            if (notFound) 
                this[from].Links.Add(to);            
        }

        public List<Int32> UpperR(Int32 node)
        {
            if (this[node] != null)
            {
                if (this[node].Links.Count != 0)
                {
                    List<Int32> temp = new List<Int32>();
                    temp = this[node].Links;
                    temp.Sort();
                    return temp;
                }
            }
            return null;
        }

        public List<Int32> LowerR(Int32 node)
        {
            List<Int32> temp = new List<Int32>();
            if (this[node] != null)
            {
                for (Int32 i = 1; i <= size; i++)
                {
                    if (this[i] != null)
                        foreach (Int32 link in this[i].Links)
                        {
                            if (link == node) temp.Add(i);
                        }
                }
                temp.Sort();
                if (temp.Count != 0) return temp;
                else return null;
            }
            return null;
        }

        public List<Int32> LowerR(Int32 node, List<Int32> vis)
        {
            bool flag = true;
            List<Int32> temp = new List<Int32>();
            if (this[node] != null)
            {
                for (Int32 i = 1; i <= size; i++)
                {
                    flag = true;
                    foreach (Int32 visNode in vis)
                        if (visNode == i) flag = false;

                    if (flag)
                    if (this[i] != null)
                        foreach (Int32 link in this[i].Links)
                        {
                            if (link == node) temp.Add(i);
                        }
                }
                temp.Sort();
                if (temp.Count != 0) return temp;
                else return null;
            }
            return null;
        }
        // матрица смежности
        public Array GetMatrix()
        {
            Array array = Array.CreateInstance(typeof(Int32), size, size);
            for (Int32 i = 1; i <= size; i++)
            {
                foreach (Int32 j in this[i].Links)
                {
                    array.SetValue(1, i - 1, j - 1);
                }
            }
            return array;
        }
        // Дополнение
        public Array Addition()
        {
            Array array = GetMatrix();
            Int32 value;
            for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
                for (Int32 j = array.GetLowerBound(1); j <= array.GetUpperBound(1); j++)
                {
                    value = (Int32)array.GetValue(i, j);
                    array.SetValue(1 - value, i, j);
                }
            return array;
        }
        // Обратная
        public Array Inverse()
        {
            Array array1 = GetMatrix();
            Array array2 = GetMatrix();
            Int32 value;
            for (Int32 i = array1.GetLowerBound(0); i <= array1.GetUpperBound(0); i++)
                for (Int32 j = array1.GetLowerBound(1); j <= array1.GetUpperBound(1); j++)
                {
                    value = (Int32)array1.GetValue(i, j);
                    array2.SetValue(value, j, i);
                }
            return array2;
        }
        // Дублирующая
        public Array duplicate()
        {
            Array array = Inverse();
            Int32 value;
            for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
                for (Int32 j = array.GetLowerBound(1); j <= array.GetUpperBound(1); j++)
                {
                    value = (Int32)array.GetValue(i, j);
                    array.SetValue(1 - value, i, j);
                }
            return array;

        }
        // Степень
        public Array Power(Int32 pow)
        {
            if (pow > 1)
            {
                Array source = GetMatrix();
                Array powered;
                if (pow == 1) powered = GetMatrix();
                else powered = Power(pow - 1);
                Array power = GetMatrix();
                Int32[] temp = new Int32[size];
                for (Int32 i = source.GetLowerBound(0); i <= source.GetUpperBound(0); i++)
                    for (Int32 j = source.GetLowerBound(1); j <= source.GetUpperBound(1); j++)
                    {
                        for (Int32 k = 0; k <= size - 1; k++)
                        {
                            temp[k] = Math.Min((Int32)powered.GetValue(i, k), (Int32)source.GetValue(k, j));
                        }
                        power.SetValue(temp.Max(), i, j);
                    }
                return power;
            }
            else return GetMatrix();
        }
        // Проверка на рефлексивность
        public bool Reflexive
        {
            get
            {             
                Array array = GetMatrix();
                for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
                    if ((Int32)array.GetValue(i, i) != 1) return false;
                return true;
            }
        }
        // Проверка на антирефлексивность
        public bool AntiReflexive
        {
            get
            {
                Array array = Addition();
                for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
                    if ((Int32)array.GetValue(i, i) != 1) return false;
                return true;
            }
        }
        // Проверка на симметричность
        public bool Symmetric
        {
            get
            {
                Array array = Addition();
                for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
                    for (Int32 j = array.GetLowerBound(1); j <= array.GetUpperBound(1); j++)
                        if ((Int32)array.GetValue(i, j) != (Int32)array.GetValue(j, i)) return false;
                return true;
            }
        }
        // Проверка на транзитивность
        public bool Transitivity
        {
            get
            {
                Array source = GetMatrix();
                Array powered = Power(2);
                for (Int32 i = source.GetLowerBound(0); i <= source.GetUpperBound(0); i++)
                    for (Int32 j = source.GetLowerBound(1); j <= source.GetUpperBound(1); j++)
                    {
                        if ((Int32)source.GetValue(i, j) < (Int32)powered.GetValue(i, j)) return false;
                    }
                return true;
            }
        }
        // Проверка на ацикличность
        public bool Acyclic
        {
            get
            {
                Array powered;
                Array inversed = Inverse();
                for (Int32 k = 1; k <= size; k++)
                {
                    powered = Power(k);
                    for (Int32 i = inversed.GetLowerBound(0); i <= inversed.GetUpperBound(0); i++)
                        for (Int32 j = inversed.GetLowerBound(1); j <= inversed.GetUpperBound(1); j++)
                            if (Math.Min((Int32)powered.GetValue(i, j), (Int32)inversed.GetValue(i, j)) > 0)
                                return false;
                }
                return true;
            }
        }
        // Гомоморфизм в линейный порядок
        public Array Homomorphy()
        {
            Array array = Array.CreateInstance(typeof(Int32), size, size);            
            List<Int32> visited = new List<Int32>();
            Int32 count;
            Int32 step = 0;
            Int32 nodes = size;
            bool flag = true;
            while(nodes > 0)
            {
                count = 0;                
                foreach (GraphNode node in Nodes)
                {
                    flag = true;
                    foreach (Int32 vis in visited)
                    {
                        if (vis == node.index) flag = false;
                        array.SetValue(-1, step, vis - 1);
                    }
                    
                    if (flag)
                    {
                        if (LowerR(node.index,visited) == null)
                        {                            
                            array.SetValue(-1, step, count);
                            visited.Add(node.index);
                            nodes--;
                            break;
                        }                        
                    }
                    count++;
                }
                step++;
            }            
            return array;
        }
        // Проверка вершины на изолированность
        public bool CheckNode(Int32 Num)
        {
            Array array = GetMatrix();
            bool k = true;
            for (Int32 i = array.GetLowerBound(0); i <= array.GetUpperBound(0); i++)
            {
                if (i != Num)                
                    if ((Int32)array.GetValue(i, Num) == 1)
                        k = false;              
            }
            for (Int32 j = array.GetLowerBound(1); j <= array.GetUpperBound(1); j++)
            {
                if (j != Num)
                    if ((Int32)array.GetValue(Num, j) == 1)
                        k = false;
            }
            return k;
        }
        // Проверка графа на изолированные вершины
        public bool Isolation
        {
            get
            {
                bool k = false;
                for (Int32 i = 0; i < size; i++)
                {
                    if (CheckNode(i))
                        k = true;
                }
                return k;
            }
        }
        // Очистка графа
        public void Clear()
        {
            Nodes.Clear();
            size = 0;
        }
    }
}