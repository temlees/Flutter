void functionTest(){
  test1("홍길동");

  void innerFun(){
    print("hello");
  }
  innerFun();

  print("---매개변수와 반환타입---");
  print(add(1,2));

  print("---Optinal 매개변수---");
  print(add2(1,2,3));
  print(add2(1,2));


}

void test1(String name){
  print("hello ${name}");
}

String add(int a , int b){
  return "Sum : ${a+b}";
}

// 2개여도 가능
String add2(int a, int b, [int c =0]){
  int sum = a + b+ c;
  return "Sum2 : ${sum}";
}