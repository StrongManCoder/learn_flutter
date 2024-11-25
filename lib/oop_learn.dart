void main() {
  Person person = Person('jake', 18);
  print(person.toString());

  Student stu = Student('清华', 'rose', 28);
  stu._school = '985211';
  print(stu.toString());

  Student stu2 = Student.cover(stu);
  print(stu2.toString());
}

class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  @override
  String toString() {
    // TODO: implement toString
    // return super.toString();
    return 'name:$name,age:$age';
  }
}

class Student extends Person {
  String? _school; //下划线标记私有变量
  String? city;
  String? country;
  String? funName;

  Student(this._school, String? name, int? age,
      {this.city, this.country = 'china'})
      : funName = '$country.$city',
        super(name, age) {}

  //命名构造方法: [类名+.+方法名]
  Student.cover(Student stu) : super(stu.name, stu.age) {
    print('命名构造方法');
  }

  // 如果想在外部类访问私有变量 设置getter
  String? get school => _school;
//通过set方法开放对私有变量的修改
  set schoole(String? value) {
    _school = value;
  }

  //命名工厂构造方法:factory

  @override
  String toString() {
    // TODO: implement toString
    // return super.toString();
    return 'name:$name  school:$_school, city:$city,country:$country  ${super.toString()}';
  }
}
