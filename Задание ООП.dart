void main() {
  Phone phone1 = Phone(89132533978, "iPhone10", 170);
  Phone phone2 = Phone.weightless(89831831983, "iPhone12");
  Phone phone3 = Phone.empty();

  print("${phone1.number} ${phone1.model} ${phone1.weight}");
  print("${phone2.number} ${phone2.model} ${phone2.weight}");
  print("${phone3.number} ${phone3.model} ${phone3.weight}");
  
  phone1.receiveCall("Антон");
  phone2.receiveCall("Женк");
  phone3.receiveCall("Неизвестен");

  phone1.receiveCall("Антон", phone1.getNumber());
  phone2.receiveCall("Женк", phone2.getNumber());
  phone3.receiveCall("Неизвестен", phone3.getNumber());

  phone3.sendMessage([89132533978, 89831831983, 88005553535]);
}

class Phone {
  int number = 0;
  String model = "undefined";
  double weight = 180;
  
  //Тут как-то не привеньтить другой конструктор нормально...
  factory Phone(int number, String model, double weight) {
    var result = Phone.weightless(number, model);
    result.weight = weight;
    return result;
  }
  Phone.weightless(this.number, this.model);
  Phone.empty();
  
  int getNumber() {
    return number;
  }
  
  //В дарте, как оказалось, нет перегрузок методов. По этому либо необязательный параметр, либо назвать по другому
  receiveCall(String name, [int? number]) {
    if (number == null) {
      print("Звонит $name");
    } else  {
      print("Звонит $name (+$number)");
    }
  }
  
  //Лучшая альтернатива аргументов переменной длины до которой я додумался
  sendMessage(List<int> numbers) {
    print("Сообщение отправлено на номера +${numbers.join(", +")}");
  }
}