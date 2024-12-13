void classTest(){

  Human human = new Human.empty();
  print(human);


  Human2 human2 = new Human2("홍길동", 20);
  print(human2);
  print(human2.doHello());
  print (human2.name);

  Human2 human3 = new Human2("홍길동", 20);
  print(human3);
  print(human3.name);
  print(human3._name);
}

class Human{
  String name;
  int age;

  //다트에서는 동일한 이름을 가진 생성자를 만들 수 없고,
  //공식문서를 기준으로 매개변수를 받는 생성자를 권장한다.
  Human(this.name,this.age);

  //명명된 생성자
  //초기화 리스트 - 생성자가 시행되기 전에 클래스의 변수를 초기화하는 방법
  // : 뒤에 변수 초기화를 나열한다.
Human.empty()
  :name = '',
  age = 0;


String doHello(){
  return "안녕하세요 $name 입니다";
}

  @override
  String toString(){
  return "human{name : $name,age :$age}";
  }

/*
*   Dart 에서 private 접근제어자는
* 클래스 수준이 아니라 라이브러리 수준에서 작동된다,
* 같은 파일 내에서는 언더스코어라도 자유롭게 접근할 수 있다.
* 다른 파일일 시 접근이 불가능
* */

}
//_age _ 가 잇으면 private 인식한다 게터 세터 사용가능
class Human2{
  String _name;
  int _age;

  String doHello(){
    return "안녕하세요 $name 입니다";
  }

  @override
  String toString(){
    return "human{name : $name,age :$age}";
  }

  Human2(this._name,this._age);

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}