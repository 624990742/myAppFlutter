
import 'dart:collection';

class Human {
  String name = '';
  double weight = 0;
  double height = 0;

  //  Human(String name,double weight,double height){
  //   this.name = name;
  //   this.weight = weight;
  //   this.height = height;
  // }

  // Human(this.name,this.weight,this.height);

  Human({required this.name, required this.weight, required this.height}); // 命名参数

  @override
  String info(){
    return "Human: name{${name},weight:${weight}kg,height:${height}cm}";
  }
}




class Student extends Human {
  final String school;


  // Student(String name,
  //     double weight,
  //     double height,
  //     {required this.school})
  //     : super(name, weight, height); // 必须调用父类的构造函数

  Student({required super.name, required super.weight, required super.height, required this.school});

  @override
  String info() {
    return '${super.info()}, 学校: $school';
  }
}

void printInfo(String name, int age, [String? city]) {
  print('Name: $name, Age: $age');
  if (city != null) {
    print('City: $city');
  }
}

void printProfile({required String name, String? job, int? age}) {
  print('Name: $name');
  if (job != null) {
    print('Job: $job');
  }
  if (age != null) {
    print('Age: $age');
  }
}


void greet({String name = 'Guest'}) {
  print('Hello, $name!');
}

void printDetails(String name,int? age,String? city) {
  print('Name: $name');
  if (age != null) {
    print('Age: $age');
  }
  if (city != null) {
    print('City: $city');
  }
}

// 综合使用位置参数和命名参数
void printUser({
  required String name, // 必填参数需标记 required
  String? job, // 可选命名参数
  int? age,
  bool? isStudent,
}) {
  print('Name: $name');
  if (job != null) {
    print('Job: $job');
  }
  if (age != null) {
    print('Age: $age');
  }
  if (isStudent != null) {
    print('Is Student: $isStudent');
  }
}


class Animal { void sound() => print("Animal sound"); }
class Dog extends Animal { @override void sound() => print("Woof"); }

class Processor<T> {
  void process(T item) => print(item.runtimeType); // 参数类型是T（逆变）
}

void main(){
  // Human toly = Human("捷特",70,180);
  // print("Human: name{${toly.name},weight:${toly.weight}kg,height:${toly.height}cm}");
  //  print(toly.info());

   // Human ls = Human("龙少",65,179);
  // print("Human: name{${ls.name},weight:${ls.weight}kg,height:${ls.height}cm}");
  // print(ls.info());

  // Human wy = Human("巫缨",65,179);
  // print(wy.info());
  // print("Human: name{${wy.name},weight:${wy.weight}kg,height:${wy.height}cm}");

  Student student = Student(
    name: "张三",
    weight: 60,
    height: 175,
    school: "XX学校",
  );
  print(student.info());

  printInfo('Alice', 30); // 只传必选参数，可选参数不传
  printInfo('Bob', 25, 'New York'); // 传必选参数和可选参数


  printProfile(name: 'Charlie'); // 只传必选参数
  printProfile(name: 'David', age: 30, job: 'Engineer'); // 任意顺序
  printProfile(job: 'Artist', name: 'Eve'); // 参数顺序无关


  printUser(name: 'Alice'); // 输出：Name: Alice
  printUser(name: 'Bob', job: 'Engineer'); // 输出：Name: Bob, Job: Engineer
  printUser(
    name: 'Charlie',
    job: 'Developer',
    age: 28,
    isStudent: false,
  );

  Queue<int> queue = Queue();
  queue.add(1);
  queue.add(2);
  print(queue.removeFirst()); // 输出 1
  print(queue.first); // 输出 2


  List<Dog> dogs = [Dog()];
  List<Animal> animals = dogs; // ✅ 协变允许



}

