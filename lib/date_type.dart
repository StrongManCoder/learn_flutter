void main() {
  _numType();

  _stringType();

  _lisstType();

  _tips();
}

//数字类型
_numType() {
  num num1 = -1.0; //num是数字类型的父类型  两个子类  int和double
  int int1 = 4;
  double d1 = 1.68;

  print("num: $num1  double: $d1 ");

  print(num1.toInt());
  print(num1.toDouble());
}

_stringType() {
  String str1 = '字符串1';
  String str2 = "双引号字符串";
  String str3 = 'str1:$str1 str2:$str2';
  String str5 = '常用字符串的类型,看输出效果';

  print(str3);
  print(str5.substring(1, 5)); // 字符串截取
}

_lisstType() {
  print('_listType');

  List list = [1, 2, 3, '集合子项啊']; // 初始化的时候 添加元素
  print(list);

  //指定类型
  List<int> list2 = [1, 2, 3];

  List list3 = [];

  list3.add('3456'); //add方法添加元素
  list3.addAll(list); //addAll 添加一个集合

  //遍历集合
  for (int i = 0; i < list3.length; i++) {
    // print(list[i]);
  }

  for (var a in list3) {}

  list3.forEach((ele) {
    print(ele);
  });

  print(list3);

  list3.remove(3456);
}

_mapType() {
  print('----------_mapType--------');
  Map map = {"name": '小明', "age": 16};

  map.forEach((key, value) {
    print('key:$key  value:$value');
  });

  Map<String, int> age3 = {};
}

_tips() {
  print('----------_tips--------');

  dynamic x = 'hal';

  // x.foo();
  print(x.runtimeType); //
}
