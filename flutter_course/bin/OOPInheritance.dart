void main() {
  creatingOppoObje();
}

class Mobile {
  String screen = "";
  String camera = "";
  String cpu = "";
  String memory = "";

  void printMobile() {
    print("The screen is $screen\nThe camera is $camera\nThe cpu is $cpu" +
        "\nThe memory is $memory");
  }
}

class Samsung extends Mobile {
  String model = "";
  bool brandNew = false;

  @override
  void printMobile() {
    super.printMobile();
    print('The model is $model\nis This brandNew $brandNew');
  }
}

class Oppo extends Samsung {
  int type = 0;
  void theGoalOfThisClass() {
    print("This class is applying the multilevel Inheritance Concept");
  }

  Oppo.CopyConst(Samsung obj) {
    type = 1;
    brandNew = obj.brandNew;
    model = obj.model;
    camera = obj.camera;
    cpu = obj.cpu;
    screen = obj.screen;
    memory = obj.memory;
  }

  @override
  void printMobile() {
    super.printMobile();
    print("The type is $type");
  }
}

void creatingSamsungObj() {
  Samsung s1 = Samsung();
  s1
    ..camera = "boom"
    ..cpu = "intel"
    ..screen = "Large"
    ..memory = "64Gb"
    ..model = "damar"
    ..brandNew = true;
  s1.printMobile();
}

void creatingOppoObje() {
  Samsung s1 = Samsung();
  s1
    ..camera = "boom"
    ..cpu = "intel"
    ..screen = "Large"
    ..memory = "64Gb"
    ..model = "damar"
    ..brandNew = true;

  Oppo o1 = Oppo.CopyConst(s1);
  o1.printMobile();
}
