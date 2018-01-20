using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using GraphNS;

namespace WindowsFormsApplication4
{
    public partial class Form1 : Form
    {
        // Подключаем графику
        private Graphics g;
        // Создаем граф
        private GraphClass graph = new GraphClass();
        // Флаги для рисование графа
        private Boolean mousedown = false;
        private Boolean wasmoved = false;
        private Boolean nodeFlag = false;
        private Boolean linkFlag = false;

        private Int32 lastNode;

        Point ptOriginal = new Point();
        Point ptLast = new Point();

        public Form1()
        {
            InitializeComponent();
            Bitmap img = new Bitmap(pictureGraph.Width, pictureGraph.Height);
            pictureGraph.Image = img;
            pictureGraph.BackColor = Color.White;
            g = Graphics.FromImage(pictureGraph.Image);
        }
        // Создание вершины
        private void DrawNode(Int32 index)
        {
            Pen p = new Pen(Color.Black); 
            g.DrawEllipse(p, graph[index].Location.X, graph[index].Location.Y, 20, 20);
            g.FillEllipse(Brushes.Orange, graph[index].Location.X + 1, graph[index].Location.Y + 1, 19, 19);

            String s = Convert.ToString(index);
            g.DrawString(s, this.Font, Brushes.Black, graph[index].Location.X+5, graph[index].Location.Y+5);

            pictureGraph.Refresh();
        }
        // Создание стрелки
        private void DrawLink(Int32 from, Int32 to)
        {
            Pen p = new Pen(Color.Black);            
            g.DrawLine(p, graph[from].Location.X + 10, graph[from].Location.Y + 10, graph[to].Location.X + 10, graph[to].Location.Y + 10);
            
            Int32 dx = graph[to].Location.X - graph[from].Location.X;
            Int32 dy = graph[to].Location.Y - graph[from].Location.Y;

            double kx = Math.Sign(dx);
            double ky = Math.Sign(dy);

            if (Math.Abs(dx)>Math.Abs(dy)) 
                ky = kx * dy/dx;
            else 
                kx = ky * dx/dy;

            double lx = (graph[to].Location.X + 10) - 10 * kx;
            double ly = (graph[to].Location.Y + 10) - 10 * ky;

            Int32 alength = 12;
            Int32 awidth = 3;            

            Point[] pts = new Point[3];
            pts[0].X = Convert.ToInt32(Math.Round(lx - alength * kx + awidth * ky));
            pts[0].Y = Convert.ToInt32(Math.Round(ly - alength * ky - awidth * kx));
            pts[1].X = Convert.ToInt32(Math.Round(lx));
            pts[1].Y = Convert.ToInt32(Math.Round(ly));
            pts[2].X = Convert.ToInt32(Math.Round(lx - alength * kx - awidth * ky));
            pts[2].Y = Convert.ToInt32(Math.Round(ly - alength * ky + awidth * kx));
            g.FillPolygon(Brushes.Black, pts);
            pictureGraph.Refresh();

            DrawNode(from);
            DrawNode(to);            
        }
        // Удаление стрелки
        private void EraseLink(Int32 from, Int32 to)
        {
            Pen p = new Pen(Color.White);
            g.DrawLine(p, graph[from].Location.X + 10, graph[from].Location.Y + 10, graph[to].Location.X + 10, graph[to].Location.Y + 10);

            Int32 dx = graph[to].Location.X - graph[from].Location.X;
            Int32 dy = graph[to].Location.Y - graph[from].Location.Y;

            double kx = Math.Sign(dx);
            double ky = Math.Sign(dy);
            if (Math.Abs(dx) > Math.Abs(dy)) ky = kx * dy / dx;
            else kx = ky * dx / dy;

            double lx = (graph[to].Location.X + 10) - 10 * kx;
            double ly = (graph[to].Location.Y + 10) - 10 * ky;

            Int32 alength = 12;
            Int32 awidth = 3;

            Point[] pts = new Point[3];
            pts[0].X = Convert.ToInt32(Math.Round(lx - alength * kx + awidth * ky));
            pts[0].Y = Convert.ToInt32(Math.Round(ly - alength * ky - awidth * kx));
            pts[1].X = Convert.ToInt32(Math.Round(lx));
            pts[1].Y = Convert.ToInt32(Math.Round(ly));
            pts[2].X = Convert.ToInt32(Math.Round(lx - alength * kx - awidth * ky));
            pts[2].Y = Convert.ToInt32(Math.Round(ly - alength * ky + awidth * kx));
            g.FillPolygon(Brushes.White, pts);
            pictureGraph.Refresh();                        
        }        
        // Перерисовка стрелок      
        public void DrawLinks(Int32 node)
        {
            if (graph[node].Links.Count == 0) DrawNode(node);
            else
                for (Int32 i = 1; i <= graph.Size; i++)
                {                    
                    foreach (Int32 link in graph[i].Links)
                    {
                        DrawLink(i, link);
                    }
                }
        }
        // Перерисовка графа
        private void DrawGraph()
        {            
            for (Int32 i = 1; i <= graph.Size; i++)
            {
                if (graph[i].Links.Count == 0) DrawNode(i);                
                foreach (Int32 link in graph[i].Links)
                {                    
                    DrawLink(i, link);
                }
            }
        }

        private void RubberLine(Point p1, Point p2)
        {
            p1 = PointToScreen(p1);
            p2 = PointToScreen(p2);
            ControlPaint.DrawReversibleLine(p1, p2, Color.Gray);
        }

        private void RubberLine(Int32 x1, Int32 y1, Int32 x2, Int32 y2)
        {
            Point p1 = new Point(x1, y1);
            Point p2 = new Point(x2, y2);
            p1 = PointToScreen(p1);
            p2 = PointToScreen(p2);
            ControlPaint.DrawReversibleLine(p1, p2, Color.Gray);
        }        

        private void RubberNode(Int32 x, Int32 y)
        {
            Point location = new Point(x, y);
            Rectangle rect = new Rectangle();
            location = PointToScreen(location);

            rect.X = location.X;
            rect.Y = location.Y;
            rect.Width = 20;
            rect.Height = 20;

            ControlPaint.DrawReversibleFrame(rect, Color.Gray, FrameStyle.Dashed);
        }        
        
        private void pictureGraph_MouseDown(object sender, MouseEventArgs e)
        {
            ptOriginal.X = e.X + 12;
            ptOriginal.Y = e.Y + 12;
            ptLast.X = -1;
            ptLast.Y = -1;
           
            mousedown = true;
            for (Int32 i = 1; i <= graph.Size; i++)
            {
                if ((e.X >= graph[i].Location.X - 20) && (e.X <= graph[i].Location.X + 40) &&
                    (e.Y >= graph[i].Location.Y - 20) && (e.Y <= graph[i].Location.Y + 40))
                {
                    lastNode = i;                    
                }
            }
            
            if ((e.Button == MouseButtons.Right) && (lastNode != 0))
            {
                g.FillRectangle(Brushes.White, graph[lastNode].Location.X, graph[lastNode].Location.Y, 21, 21);
                foreach (Int32 link in graph[lastNode].Links) EraseLink(lastNode, link);
                for (Int32 i = 1; i <= graph.Size; i++)
                {                    
                    foreach (Int32 link in graph[i].Links)
                    {
                        if (link == lastNode) EraseLink(i, lastNode);
                    }
                }
                pictureGraph.Refresh();

                nodeFlag = false;
                linkFlag = false;
            }
        }
        
        private void pictureGraph_MouseMove(object sender, MouseEventArgs e)
        {                        
            if (mousedown)
            {
                wasmoved = true;
                if (lastNode != 0)
                {
                    if (e.Button == MouseButtons.Left)
                    {
                        Point ptCurrent = new Point(e.X + 12, e.Y + 12);
                        if (ptLast.X != -1)
                        {
                            RubberLine(ptOriginal, ptLast);
                        }
                        ptLast = ptCurrent;
                        RubberLine(ptOriginal, ptCurrent);
                    }
                    if (e.Button == MouseButtons.Right)
                    {
                        if (nodeFlag) RubberNode(graph[lastNode].Location.X + 12, graph[lastNode].Location.Y + 12);
                        if (linkFlag)
                        {
                            foreach (Int32 link in graph[lastNode].Links)
                                RubberLine(graph[lastNode].Location.X + 22, graph[lastNode].Location.Y + 22, graph[link].Location.X + 22, graph[link].Location.Y + 22);
                            for (Int32 i = 1; i <= graph.Size; i++)
                            {
                                foreach (Int32 link in graph[i].Links)
                                {
                                    if (link == lastNode) RubberLine(graph[i].Location.X + 22, graph[i].Location.Y + 22, graph[lastNode].Location.X + 22, graph[lastNode].Location.Y + 22);
                                }
                            }
                        }

                        graph[lastNode].Location.X = e.X - 10;
                        graph[lastNode].Location.Y = e.Y - 10;
                        nodeFlag = true;
                        linkFlag = true;

                        RubberNode(graph[lastNode].Location.X + 12, graph[lastNode].Location.Y + 12);
                        foreach (Int32 link in graph[lastNode].Links)
                            RubberLine(graph[lastNode].Location.X + 22, graph[lastNode].Location.Y + 22, graph[link].Location.X + 22, graph[link].Location.Y + 22);
                        for (Int32 i = 1; i <= graph.Size; i++)
                        {
                            foreach (Int32 link in graph[i].Links)
                            {
                                if (link == lastNode) RubberLine(graph[i].Location.X + 22, graph[i].Location.Y + 22, graph[lastNode].Location.X + 22, graph[lastNode].Location.Y + 22);
                            }
                        }
                    }
                }
            }
        }    
        
        private void pictureGraph_MouseUp(object sender, MouseEventArgs e)
        {           
            if (e.Button == MouseButtons.Left)
            {
                if (ptLast.X != -1)
                {
                    RubberLine(ptOriginal, ptLast);
                }
                Boolean check = true;
                if ((mousedown) && (lastNode != 0))
                {
                    for (Int32 i = 1; i <= graph.Size; i++)
                    {
                        if ((e.X >= graph[i].Location.X - 20) && (e.X <= graph[i].Location.X + 40) &&
                            (e.Y >= graph[i].Location.Y - 20) && (e.Y <= graph[i].Location.Y + 40))
                        {
                            if (lastNode != i)
                            {
                                graph.AddLink(lastNode, i);
                                DrawLink(lastNode, i);
                            }
                            check = false;
                        }
                    }
                }
                if ((check) && (!wasmoved))
                {
                    graph.AddNode(e.X - 10, e.Y - 10);
                    DrawNode(graph.Size);
                    if (numericUpDown1.Minimum == 0) numericUpDown1.Minimum = 1;
                    numericUpDown1.Maximum = graph.Size;
                }
            }

            if ((e.Button == MouseButtons.Right) && (lastNode != 0))
            {                
                DrawGraph();
            }
            
            mousedown = false;
            wasmoved = false;
            nodeFlag = false;
            linkFlag = false;
            lastNode = 0;

            ptOriginal.X = -1;
            ptOriginal.Y = -1;
            ptLast.X = -1;
            ptLast.Y = -1;            
        }

        private void button_Clear_Click(object sender, EventArgs e)
        {
            graph.Clear();
            g.Clear(Color.White);
            pictureGraph.Refresh();
        }

        private void btnUpper_Click(object sender, EventArgs e)
        {            
            {
                richTextBox1.AppendText("*********************************************************\n");
                String str = "{";
                richTextBox1.AppendText("Верхнее сечение для вершины №" + numericUpDown1.Value + ":\n");
                if (graph.UpperR((int)numericUpDown1.Value) != null)
                {
                    foreach (Int32 node in graph.UpperR((int)numericUpDown1.Value))
                        str += Convert.ToString(node) + ", ";
                    str = str.Remove(str.Length - 2);
                }
                else str += "0";
                richTextBox1.AppendText(str + "}\n");
                richTextBox1.AppendText("*********************************************************\n");
            }
        }

        private void btnLower_Click(object sender, EventArgs e)
        {
            
            {
                richTextBox1.AppendText("*********************************************************\n");
                String str = "{";
                richTextBox1.AppendText("Нижнее сечение для вершины №" + numericUpDown1.Value + ":\n");
                if (graph.LowerR((int)numericUpDown1.Value) != null)
                {
                    foreach (Int32 node in graph.LowerR((int)numericUpDown1.Value))
                        str += Convert.ToString(node) + ", ";
                    str = str.Remove(str.Length - 2);
                }
                else str += "0";
                richTextBox1.AppendText(str + "}\n");
                richTextBox1.AppendText("*********************************************************\n");
            }
        }

        private void btnTextClear_Click(object sender, EventArgs e)
        {
            richTextBox1.Clear();            
        }

        private void btnAddition_Click(object sender, EventArgs e)
        {
            Array a = graph.Addition();
            richTextBox1.AppendText("*********************************************************\n");
            richTextBox1.AppendText("Дополнение:\n");
            for (Int32 i = a.GetLowerBound(0); i <= a.GetUpperBound(0); i++)
                for (Int32 j = a.GetLowerBound(1); j <= a.GetUpperBound(1); j++)
                {
                    richTextBox1.AppendText(a.GetValue(i, j) + " ");
                    if (j == a.GetUpperBound(1)) richTextBox1.AppendText("\n");
                }
            richTextBox1.AppendText("*********************************************************\n");
        }

        private void btnInverse_Click(object sender, EventArgs e)
        {
            Array a = graph.Inverse();
            richTextBox1.AppendText("*********************************************************\n");
            richTextBox1.AppendText("Обратное:\n");
            for (Int32 i = a.GetLowerBound(0); i <= a.GetUpperBound(0); i++)
                for (Int32 j = a.GetLowerBound(1); j <= a.GetUpperBound(1); j++)
                {
                    richTextBox1.AppendText(a.GetValue(i, j) + " ");
                    if (j == a.GetUpperBound(1)) richTextBox1.AppendText("\n");
                }
            richTextBox1.AppendText("*********************************************************\n");
        }

        private void btnDual_Click(object sender, EventArgs e)
        {
            Array a = graph.duplicate();
            richTextBox1.AppendText("*********************************************************\n");
            richTextBox1.AppendText("Двойственное:\n");
            for (Int32 i = a.GetLowerBound(0); i <= a.GetUpperBound(0); i++)
                for (Int32 j = a.GetLowerBound(1); j <= a.GetUpperBound(1); j++)
                {
                    richTextBox1.AppendText(a.GetValue(i, j) + " ");
                    if (j == a.GetUpperBound(1)) richTextBox1.AppendText("\n");
                }
            richTextBox1.AppendText("*********************************************************\n");
        }            

        private void btnOptions_Click(object sender, EventArgs e)
        {
            richTextBox1.AppendText("*********************************************************\n");
            richTextBox1.AppendText("Свойства отношения: \n");
            if (graph.Reflexive) richTextBox1.AppendText("Отношение рефлексивно\n");            
            if (graph.AntiReflexive) richTextBox1.AppendText("Отношение антирефлексивно\n");            
            if (graph.Symmetric) richTextBox1.AppendText("Отношение симметрично\n");
            else richTextBox1.AppendText("Отношение ассиметрично\n");
            if (graph.Transitivity) richTextBox1.AppendText("Отношение транзитивно\n");            
            if (graph.Acyclic) richTextBox1.AppendText("Отношение ациклично\n");
            else richTextBox1.AppendText("Отношение имеет циклы\n");
            richTextBox1.AppendText("*********************************************************\n");
        }

        private void btnHom_Click(object sender, EventArgs e)
        {
            if (graph.Acyclic)
            {
                if (!graph.Isolation)
                {
                    Array a = graph.Homomorphy();
                    richTextBox1.AppendText("*********************************************************\n");
                    String str = "{";
                    richTextBox1.AppendText("Гомоморфизм:\n");
                    for (Int32 i = a.GetLowerBound(0); i <= a.GetUpperBound(0); i++)
                        for (Int32 j = a.GetLowerBound(1); j <= a.GetUpperBound(1); j++)
                        {
                            if ((Int32)a.GetValue(i, j) == 0) str += Convert.ToString(j + 1) + ", ";
                            if (j == a.GetUpperBound(1))
                            {
                                if (str.Length > 2) str = str.Remove(str.Length - 2);
                                str += "}";
                                richTextBox1.AppendText(str + "\n");
                                str = "{";
                            }
                        }
                }
                else MessageBox.Show("Присутствуют изолированные вершины! Построение гомоморфизма невозможно", "Ошибка");
                richTextBox1.AppendText("*********************************************************\n");
            }
            else MessageBox.Show("Граф имеет циклы! Построение гомоморфизма невозможно", "Ошибка");
            richTextBox1.AppendText("*********************************************************\n");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Array a = graph.GetMatrix();

            dataGridView1.RowCount = a.GetUpperBound(0) + 1;
            dataGridView1.ColumnCount = a.GetUpperBound(1) + 1;            

            for (int i = 0; i < a.GetUpperBound(0) + 1; i++)
            for (int j = 0; j < a.GetUpperBound(1) + 1; j++)
            {
                dataGridView1.Rows[i].Cells[j].Value = a.GetValue(i,j);                             
            }            
        }        

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {
            richTextBox1.ScrollToCaret();            
        }
             
    }
}
