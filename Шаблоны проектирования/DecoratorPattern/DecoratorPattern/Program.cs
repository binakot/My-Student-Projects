using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DecoratorPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            Test();
            Console.ReadLine();
        }

        public static void Test()
        {
            var pizzaWithCheese = new PizzaWithCheese(new Pizza(), 5);  // Пицца с сыром
            var pizzaWithChicken = new PizzaWithChicken(new Pizza(), 6);  // Пицца с курицей
            var pizzaWithChickenAndCheese = new PizzaWithChicken(pizzaWithCheese, 6);  // Пицца с сыром и курицей

            Console.WriteLine("Total for cheese pizza: " + pizzaWithCheese.GetPrice());
            Console.WriteLine("Total for chicken pizza: " + pizzaWithChicken.GetPrice());
            Console.WriteLine("Total for cheese + chicken pizza: " + pizzaWithChickenAndCheese.GetPrice());
        }       

        // Interface
        private interface IPizza
        {
            int GetPrice();
        }

        // Concrete Component
        private class Pizza : IPizza
        {
            public int GetPrice()
            {
                return 10;
            }
        }

        // Decorator 1
        private class PizzaWithCheese : IPizza
        {
            private IPizza _pizza;
            private int _priceofCheese;

            public PizzaWithCheese(IPizza pizza, int priceofCheese)
            {
                _pizza = pizza;
                _priceofCheese = priceofCheese;
            }

            public int GetPrice()
            {                
                return _pizza.GetPrice() + _priceofCheese;
            }
        }

        // Decorator 2
        private class PizzaWithChicken : IPizza
        {
            private IPizza _pizza;
            private int _priceofChicken;

            public PizzaWithChicken(IPizza pizza, int priceofChicken)
            {
                _pizza = pizza;
                _priceofChicken = priceofChicken;
            }

            public int GetPrice()
            {                
                return _pizza.GetPrice() + _priceofChicken;
            }
        }   
    }
}
