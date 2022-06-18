void main(){
  //3,4,5
  for(var x=3;x<6;x++){
    print("x : $x");
  }
  print("----------------------------");
  //10 ile 20 arasında 5 er artan
  for(var y=10;y<=20;y+=5){
    print("y : $y");
  }
  print("----------------------------");
  //20 ile 10 arasında 5 er azalan
  for(var y=20;y>=10;y-=5){
    print("y : $y");
  }
  print("----------------------------");
  //123
  int sayac = 1;
  while(sayac <= 3){
    print("while : $sayac");
    sayac++;
  }
  print("----------------------------");
  //1 ile 5
  for(var i=1;i<=5;i++){
    print("Break : $i");
    if(i ==3){
      break;
    }
  }
  print("----------------------------");
  for(var i=1;i<=5;i++){
    if(i == 3){
      continue;
    }
    print("Continue : $i");
  }


}
