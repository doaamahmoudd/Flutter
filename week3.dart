import 'dart:io';

void main()
{
  while(true)
  {
    print(" Welcome to the Pizza Ordering System \n 1. Order a Pizza \n 2. Exit");
    stdout.write("Enter your choice:");
    String choice=stdin.readLineSync()??'';

    if(choice=='2')
    {break;}
    else if(choice=='1')
    {
      stdout.write("choose a pizza type(margherita ,pepperoni ,veggie):");
      String ptype=stdin.readLineSync()??'';
      stdout.write("choose a size(small, medium, large):");
      String psize=stdin.readLineSync()??'';
      Size size = Size.Medium;
      switch(psize){
        case "small":
        size=Size.Small;
        break;
        case "medium":
        size=Size.Medium;
        break;
        case "large":
        size=Size.Large;
        break;
      }
      Pizza? pizza;
      switch(ptype){
        case "margherita":
        pizza=MargheritaPizza(size);
        break;
        case "pepperoni":
        pizza=PepperoniPizza(size);
        break;
        case "veggie":
        print("enter toppings:");
        List<String> toppings=[];
        toppings.add(stdin.readLineSync()??'');
        pizza=VeggiePizza(size, toppings);
        break;
      }
      stdout.write("enter customer ID:");
      String customerId=stdin.readLineSync()??'';
      if (pizza == null) {
        print("Error: No pizza selected!");
        return;
      }
      String orderId=DateTime.now().toString();
      
      Order order=Order(orderId,customerId,pizza);
      order.confirmOrder();
    }
  }
}
enum Size {Small, Medium, Large}

abstract class Pizza
{
  String name;
  Size size ;
  double price;
  List<String?> toppings;

  Pizza(this.name,this.price,this.size,[this.toppings=const[]]);

  double calculatePrice();
  @override
  String toString()
  {
    return "Type: $name \n Size: $size \n Price: ${calculatePrice()} \n toppings: ${toppings.join(' , ')}";
  }
  
}
class MargheritaPizza extends Pizza
{
  MargheritaPizza(Size size) :super("MarghritaPizza",150.0,size);

  @override
  double calculatePrice()
  {
    if(size==Size.Small){
      return price;}
    else if(size==Size.Medium){
      return price+20.0;}
    else if(size==Size.Large){
      return price+40.0;
    }
    return price;
  }
  }

  class PepperoniPizza extends Pizza
  {
    PepperoniPizza(Size size):super("PepperoniPizza",190,size,["extra Pepperoni"]);

    @override
    double calculatePrice()
    {
      if (toppings.contains("extra Pepperoni"))
      {return price+50;}
      else{return price;}
    }
  }

  class VeggiePizza extends Pizza
  {
    VeggiePizza(Size size,List<String> toppings):super("VeggiePizza",180,size,toppings);

    @override
    double calculatePrice()
    {
      return price+(toppings.length * 5);
    }
  }

  class Order
  {
    String orderId;
    String customerId;
    Pizza pizza;
    double totalPrice;

    Order(this.orderId,this.customerId,this.pizza): totalPrice = pizza.calculatePrice();
    
    void _payOrder()
    {
      print("Total Price: $totalPrice");
    }
    void confirmOrder()
    {
      _payOrder();
      print("order confirmed..");
    }
    @override
    String toString()
    {
      return "order ID: $orderId \n customer ID: $customerId \n pizza type:$pizza \n total price: $totalPrice";
    }
    
  }



