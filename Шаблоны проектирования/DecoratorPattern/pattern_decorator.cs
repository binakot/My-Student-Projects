using System;
 
namespace Decorator
{
 
  class MainApp
  {
    static void Main()
    {
      // Create ConcreteComponent and two Decorators
      ConcreteComponent c = new ConcreteComponent();
      ConcreteDecoratorA d1 = new ConcreteDecoratorA();
      ConcreteDecoratorB d2 = new ConcreteDecoratorB();
 
      // Link decorators
      d1.SetComponent(c);
      d2.SetComponent(d1);
 
      d2.Operation();
 
      // Wait for user
      Console.Read();
    }
  }
 
  /// <summary>
  /// Component - компонент
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu>определяем интерфейс для объектов, на которые могут быть динамически 
  /// возложены дополнительные обязанности;</lu>
  /// </li>
  /// </remarks>
  abstract class Component
  {
    public abstract void Operation();
  }
 
  /// <summary>
  /// ConcreteComponent - конкретный компонент
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu>определяет объект, на который возлагается дополнительные обязанности</lu>
  /// </li>
  /// </remarks>
  class ConcreteComponent : Component
  {
    public override void Operation()
    {
      Console.WriteLine("ConcreteComponent.Operation()");
    }
  }
 
  /// <summary>
  /// Decorator - декоратор
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu>хранит ссылку на объект <see cref="Component"/> и определяет интерфейс,
  /// соответствующий интерфейсу <see cref="Component"/></lu>
  /// </li>
  /// </remarks>
  abstract class Decorator : Component
  {
    protected Component component;
 
    public void SetComponent(Component component)
    {
      this.component = component;
    }
 
    public override void Operation()
    {
      if (component != null)
      {
        component.Operation();
      }
    }
  }
 
  /// <summary>
  /// ConcreteDecorator - конкретный декоратор
  /// </summary>
  /// <remarks>
  /// <li>
  /// <lu>возглагает дополнительные обязанности на компонент.</lu>
  /// </li>
  /// </remarks>
  class ConcreteDecoratorA : Decorator
  {
    private string addedState;
 
    public override void Operation()
    {
      base.Operation();
      addedState = "New State";
      Console.WriteLine("ConcreteDecoratorA.Operation()");
    }
  }
 
  // "ConcreteDecoratorB"
 
  class ConcreteDecoratorB : Decorator
  {
    public override void Operation()
    {
      base.Operation();
      AddedBehavior();
      Console.WriteLine("ConcreteDecoratorB.Operation()");
    }
 
    void AddedBehavior()
    {
    }
  }
}