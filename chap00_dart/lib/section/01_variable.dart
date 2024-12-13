/*
*   변수명은 일반적으로 카멜케이스를 따른다.
*  타입 변수명 = 초기화 값;
*
*   var / 자료형
*
*   var - 변수의 타입을 명시하지 않고 선언 . 할당되는 값에 따라
*  타입이 결정된다. 타입이 고정되기 때문에 해당 변수에
*   다른 타입의 값을 할당할 수 있다.
*
*   하지만 Dart 는 강타입 언어이다.
*   타입에 대한 규칙이 엄격하다..
*   따라서  다른 타입 자료형들도 제공한다.
* -  int 정수 double 실수 ,  num(int, double 을 둘다 담을 수 있는 부모 클래스)
* -  bool
* -  String
*
* */

void variableTest(){

  var hello = "hi";
 // hello = 123; 이미 string 으로 할당 되었기 때문에 int 형으로 재할당 불가능
  hello = 123.toString();
  print(hello);

  //논리형
  bool wrong = false;
  print(wrong);

  //정수, 실수
  int num1  = 5;
  int num2 = 10;

  print(num1+num2);

  double num3 = 5.5;
  double num4 = 1.1;

  print(num3/num4);

  //String
  String name1 = "홍길동";
  String name2 = '유관순';

  //문자열 내에서의 변수 사용
  print("안녕하세요"+name1);
  print('안녕히세요 $name2');
  print('안녕하세요 ${name1 + name2}');

}