void main() {
  Oppo o1 = Oppo.parentConst("model")
    .._type = 3; // yenf3 twsl lel object 34an fe nfs el file
  // lw ro7t fe file mo5tlef msh hyshtghl
}

abstract class device {
  String screen = "";
  String camera = "";
  String cpu = "";

  void printMobile();
}

class Mobile extends device {
  String memory = "";

  @override
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

  Samsung(this.model);
}

/* lw fe constructor lel parent lazm ykon fe constructor lel child  */
class Oppo implements Samsung {
  @override
  bool brandNew = false;

  @override
  String camera = "";

  @override
  String cpu = "";

  @override
  String memory = "";

  @override
  String model = "";

  @override
  String screen = "";

  int _type = 0;

  void theGoalOfThisClass() {
    print("This class is applying the multilevel Inheritance Concept");
  }

  Oppo.parentConst(name);
  Oppo.CopyConst(Samsung obj) {
    _type = 1;
    brandNew = obj.brandNew;
    model = obj.model;
    camera = obj.camera;
    cpu = obj.cpu;
    screen = obj.screen;
    memory = obj.memory;
  }

  @override
  void printMobile() {
    // super.printMobile();
    print("The screen is $screen\nThe camera is $camera\nThe cpu is $cpu" +
        "\nThe memory is $memory\nThe type is $_type");
  }
}

class Phone2 implements Oppo, Samsung {
  @override
  bool brandNew = false;

  @override
  String camera = "";

  @override
  String cpu = "";

  @override
  String memory = "";

  @override
  String model = "";

  @override
  String screen = "";

  @override
  int _type = 0;

  @override
  void printMobile() {
    // TODO: implement printMobile
  }

  @override
  void theGoalOfThisClass() {
    // TODO: implement theGoalOfThisClass
  }
}

void creatingSamsungObj() {
  Samsung s1 = Samsung("model");
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
  Samsung s1 = Samsung("model");
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

enum weekDays {
  sunDay,
  monDay,
  tuesDay,
  wednesDay,
  thursDay,
  friDay,
  saturDay,
}

enum status { online, offline }

void Regex() {
  // ay pattern 3auzo 5osh 3la stackoverFlow hato
  String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp reg1 = RegExp(emailPattern);
  String email = "Abdelaziz132001@gmail.com";
  String email2 = "Abdelaziz132001gmail.com";
  print(reg1.hasMatch(email));
  print(reg1.hasMatch(email2));

  String phonePattern = "^(?:[+0]9)?[0-9]{10}";
  RegExp reg2 = RegExp(phonePattern);
  String phone = "1111111111";
  String phone2 = "+01111111111";
  String phone3 = "11111111";
  print(reg2.hasMatch(phone));
  print(reg2.hasMatch(phone2));
  print(reg2.hasMatch(phone3));
}

/// mixins
mixin A {
  // this should be an abstract class
  // el mixin zyha zy el abstract
  int a = 0;
  int b = 0;
  void funcNul();
}

class B {
  int c = 0;
  int d = 0;
  void FunNul2() {
    print("shit");
  }
}

class C with A, B {
  @override
  void funcNul() {
    print("Anything to overRide the abstract function in A");
  }
}
