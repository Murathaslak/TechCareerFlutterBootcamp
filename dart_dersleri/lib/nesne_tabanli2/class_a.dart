import 'package:dart_dersleri/nesne_tabanli2/my_interface.dart';

//interface de tanımlı metotlar eklenmek zorunda kullanmasanda eklenecek
//kalıtım da kalıtım alır istersen kullan
class ClassA implements MyInterface{
  @override
  int degisken = 10;

  @override
  void metod1() {
    print("Metod 1 çalıştı");
  }

  @override
  String metod2() {
    return "Metod 2 çalıştı";
  }

}