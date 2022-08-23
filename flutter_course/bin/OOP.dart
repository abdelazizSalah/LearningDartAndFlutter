void main() {
  cascadeOperator();
}

/* el standard el 3alamy en esm el class yeb2a awl 7arf feh capital */
class Mobile {
  // defining the data members
  static int noOfMobiles = 0;
  int phone = 0;
  String screen = "";
  String name = "";

  //setter and getters
  // de el tre2a el 3adya fl oop
  void setPhone(int phone) {
    this.phone = phone;
  }

  void setScreen(String screen) {
    this.screen = screen;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return name;
  }

  String getScreen() {
    return screen;
  }

  int getPhone() {
    return phone;
  }

  //lakn fe dart fe tre2a tanya el hya de
  set changeName(name) {
    if (name is String) {
      this.name = name;
    }
  }

  set changePhone(phone) {
    if (phone is int) {
      this.phone = phone;
    }
  }

  set changeScreen(screen) {
    if (screen is String) {
      this.screen = screen;
    }
  }

  String get getName2 {
    return name;
  }

  int get getPhone2 {
    return phone;
  }

  String get returnScreen2 {
    return screen;
  }

  //constructor
  //1- default constructor
  Mobile() {
    noOfMobiles++;
    phone = 0;
    name = "";
    screen = "";
  }

  //2- parameterized constructor
  // el intialzation formula de btsahel el ketaba bdl ma takhod parameters w b3den
  // tft7 body w tktb w msh 3aref a, laa hya bta5ud el value t7otha fl mkan el enta b3to
  //3la toul
  Mobile.parameterized(this.phone, this.name, this.screen) {
    noOfMobiles++;
  }

  //ay constructor 3auz te3mlo mmkn tedelo esm
  Mobile.phoneOnly(this.phone) {
    noOfMobiles++;
  }

  void printMobile() {
    print(
        "The mobile name is $name\nThe phone number is $phone\nThe size of the screen is $screen");
  }
}

void creatingMobileObject() {
  Mobile Iphone = new Mobile.phoneOnly(011234);
  Iphone.setName("Iphone 11 Pro Max");
  // Iphone.setPhone(1153705735);
  Iphone.setScreen("Large");
  Iphone.printMobile();
}

void cascadeOperators() {
  Mobile iphone = Mobile()
    ..name = "Iphone 12"
    ..phone = 1235
    ..screen = "Large";

  iphone.printMobile();
  iphone.changeName = true;
  print(iphone.getName2);
}

void statics() {
  print(Mobile.noOfMobiles);
  Mobile phone1 = Mobile();
  Mobile phone2 = Mobile();
  Mobile phone3 = Mobile();
  print(Mobile.noOfMobiles);
}

void cascadeOperator() {
  Mobile phone1 = Mobile();
  phone1
    ..setName("name")
    ..setPhone(1245)
    ..setScreen("214")
    ..changeName = "dfa"
    ..changePhone = 2421421;
  phone1.printMobile();
}
