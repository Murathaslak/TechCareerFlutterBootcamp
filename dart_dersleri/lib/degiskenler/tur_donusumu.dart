void main(){
  //Sayısaldan sayısala dönüşüm
  int i = 42;
  double d = 67.89;

  print(i.toDouble());
  print(d.toInt());

  //Sayısaldan metine dönüşüm
  String str1 = i.toString();
  print(str1);
  String str2 = d.toString();
  print(str2);

  //Metinden sayısala dönüşüm
  String yazi = "34";
  int s1 = int.parse(yazi);
  print(s1);







}