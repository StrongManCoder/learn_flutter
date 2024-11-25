void main() {
  sum(2, 8, isPrint: true);

  FunctionLearn fcl = FunctionLearn();
  fcl.sum(2, 9, isPrint: true);

  var result = FunctionLearn.doSum(2, 222);
  print(result);
}

//可选参数 ?
int sum(int var1, int var2, {bool? isPrint = false}) {
  var result = var1 + var2;
  if (isPrint ?? false) {
    print('result:$result');
  }

  return result;
}

class FunctionLearn {
  int sum(int var1, int var2, {bool? isPrint = false}) {
    var result = var1 + var2;
    if (isPrint ?? false) {
      print('result:$result');
    }

    _learn();
    return result;
  }

  //私有方法  作用域 当前类的内部
  _learn() {
    print('带_的私有方法啊');
  }

  anonymousFunc() {}

  //静态方法
  static doSum(int V1, int V2) {
    return V1 + V2;
  }
}
