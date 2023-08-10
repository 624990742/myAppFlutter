
//dart 语法复习

/* 一、入口说明
 * 1.当你的Dart程序运行时，它会从main函数开始执行。main函数是程序的入口点，这是程序开始执行的地方。
 * 2. List<String> args -> 列表<String> - 泛型，(List<String> args)：这是函数的参数列表，括号中的部分定义了函数参数的类型和名称。在这里，参数名是args，类型是List<String>。List<String>表示一个字符串列表，args是一个用于传递命令行参数的列表。
 * 在这个示例中，我们没有使用这个参数，但是在实际应用中，你可以通过args参数接收命令行传递的参数。
 *   {}：这是函数体，花括号内部是函数的实际代码块。在这个示例中，函数体内只有一行代码
 * 3.dart当中打印信息使用print函数
 * 函数方法解释：
 * 1、Dart语言的入口也是main函数，并且必须显示的进行定义；
 * 2、Dart的入口函数main是没有返回值的；
 * 3、传递给main的命令行参数，是通过List<String>完成的。
 * 从字面值就可以理解List是Dart中的集合类型。
 * 其中的每一个String都表示传递给main的一个参数；
 * 4、定义字符串的时候，可以使用单引号或双引号；
 * 5、每行语句必须使用分号结尾；
  main(List<String> args){
  print("hello world");
  String testStr = "测试";
}
 */

/**
 * 显示声明变量
 * 格式： 变量类型 变量名称 = 赋值;
 * 示例代码:
 *main(List<String> args){
    // var name = 'Bod'；
    String testStr = "测试";
    int testNum1 = 1;
    double testNum2 = 2;
    //拼接方式
    print('${testStr}, ${testNum1}, ${testNum2}');
    }
 */

/**
 * 类型推导
 * var/dynamic/const/final 变量名称 = 赋值;
 *

    main(List<String> args) {
    //1.var 声明常量
    var testNum0 = 20;
    testNum0 = 30;

    //2.final声明常量
    final testNum1 = 20.8;

    //const 和 final 的区别
    //const在赋值时, 赋值的内容必须是在编译期间就确定下来的
    //final在赋值时, 可以动态获取, 比如赋值一个函数


    //3.const声明常量
    const testStr = "就是玩一玩";

    //4.dynamic来声明变量
    //不建议使用dynamic, 因为类型的变量会带来潜在的危险
    dynamic testName = '晨仔';
    print(testName.runtimeType); // String
    testName = 18;
    print(testName.runtimeType); // int
    }
 */

/**
 * final与const的区别
 *
 */
main(List<String> args){

  //const test111 = getTestFunction(); // 错误的做法, 因为要执行函数才能获取到值
  // final test222 = getTestFunction(); // 正确的做法
  
  //final修饰的对象不能算是同一个对象
  // final obj1 = Animal('obj');
  // final obj2 = Animal('obj');
  // print(identical(obj1, obj2)); //false

  //final修饰的对象是同一个对象
  const obj1 = Animal('obj');
  const obj2 = Animal('obj');
  print(identical(obj1, obj2)); //true
}

String getTestFunction() {
  return '1111111111';
}

class Animal {
  final String name;
  const Animal(this.name);
}


