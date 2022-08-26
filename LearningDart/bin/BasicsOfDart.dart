import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter_course/flutter_course.dart' as flutter_course;
import 'package:test/expect.dart';

void dataTypesAndPrints() {
  //el String dayman awl 7rf capital
  String name = "Abdelaziz";
  String lastName = " Salah";
  int age = 21;
  bool male = true;
  num phone = 01153705735;

//3lamet el $ bt5lek te2dr t3ml formate
// w el curly braces bt5lek te2dr te3ml aktur mn 3mlya b3d el $
  print("my name length is ${name.length} chars");
  // el dollar sign bt5leh ye3rf en da variable msh string
  print("my name is $name");
  print("my age is $age");
  print("my Phone number is 0$phone");
  print("I am $male");

  // concatination and formating
  print("my name is ${name + lastName}\nI am $age" +
      " years old\nam I male => " +
      "$male\nThis is my phone number 0$phone");

  print(lastName
      .compareTo(" SAlah")); // -1 if lastName < sent string hexographically

  print(lastName.trim());
}

void NullSafety() {
//kol fekretha enk mynf34 t3rf object aw variable mn gher ma te3mlo initialization
// w da 34an mytl3sh error el null
//34an tkhly el compiler mytd5lsh 7ot ? b3d el data type fel declaration
// w 7ot 3lamt el ta3agob wnta btndah 3la el function
  List<String>? Friends;
  Friends!.add("Omar");
  Friends.addAll(["Deebo", "Ziad", "Mek"]);
}

void arthimaticOperations() {
  int a = 2;
  int b = 31;
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b); // mfesh mwdo3 el integer division w gw el C++ da
  print(a ~/ b); // tb lw 3auz integer div bt3ml de
  print(a % b); // mod
  print(a++); // postfix
  print(a--); // postfix
  print(++a); // prefix
  print(--a); // prefix
}

bool equalityAndRelations() {
  int a = 12;
  int b = 31;
  bool c = a == b;
  bool d = a != b;
  bool e = a >= b;
  bool f = a < b;
  bool g = a > b ? c : d; // ternary operator
  print(
      "$c $d $e $f \n $g"); // el backslash msh bt8yr lonha bs bt3ml new line 3ady
  return c;
}

void typeTesting() {
// el hadaf mn el hwar da enk te3rf hal el object da mn no3 class kaza wla la zy instance of keda fl java
  int a = 10;
  print(a is String); // false
  print(a is int); // true
  print(a is! bool); // true
}

void assingmentOperators() {
  int a = 10;
  //a ??= 20; // if a has no value (Null) make it 20 ;
  a += 20;
  a -= 20;
  a *= 20;
  a %= 20;
  a ~/= 20;
  print(a);
}

void conditionsAndLoops() {
  int a = 10;
  if (a == 1)
    print(1);
  else if (a == 2) {
    print(1);
    print(2);
  } else
    print("3auz a y3m enta");

  a = 1;
  switch (a) {
    case 1:
      print(1);
      break;
    case 2:
      print(1);
      print(2);
      break;
    default:
      print("3auz a y3m enta");
  }

  for (int i = 0; i < 10; i++) {
    print(i);
  }

  // while (a--) print(a); mynf34 mwdo3 while a -- de
  while (a > 0) print(a--);

  List<int> vals = [123, 123, 421, 1, 124214, 2342, 1421, 421, 421, 23];
  //for each
  for (int I in vals) {
    print(I);
  }
}

void Numbers() {
  int a = 10;
  if (a.isEven) {
    print("Even");
  } else if (a.isOdd || !a.isEven)
    print("Odd");
  else if (a.isFinite)
    print(a);
  else if (!a.isFinite || a.isInfinite)
    print("INF");
  else if (a.isNegative)
    print(-1);
  else
    print(a.sign);

  print(a.toInt());
  print(a.toDouble());
  print(a.abs());
  print(a.ceil()); // int
  print(a.ceilToDouble()); // Double
  print(
      a.compareTo(11)); // c = a - 11  return c.sign hya de function compare to

  // to convert string to integer
  //we use the  built in class
  String s =
      "20100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  String c = "A";
  print(num.parse(s)); // lw fe  7rof fl mwdo3 hydek error
  double x = 1e308; //max number
  print(x);
}

void Lists() {
  // el List mn gher data type btb2a general mmkn ta5ud ay no3 3ady w mmkn t3ml neasted lists
  List mySecondList = [
    "Salem",
    123,
    1341,
    [
      "C",
      true,
      [123, 32, "3D"]
    ]
  ];

  // modifying the first element
  mySecondList[0] = 2;

  //inserting element at the end
  mySecondList.add(123); // push back
  // forEach
  mySecondList.forEach((item) {
    print(item);
  });

  // it will print the first item in the list
  print(mySecondList.first);
  // it will print the last item in the list
  print(mySecondList.last);
  // it will print the length of the list
  print(mySecondList.length);
  // it will print true if the list has no elements
  print(mySecondList.isEmpty);
  // it will print true if the list has elements
  print(mySecondList.isNotEmpty);

  // this reverse the list
  var list2 = mySecondList.reversed;
  list2.forEach((element) {
    print(element);
  });

  list2 = ["Ahmed"];
  // if the list contains only one element it will print it
  // lw aktur mn keda hyrmy exception
  print(list2.single);

  ///////////////////////////////////////////////////////////
  List newList = [];
  newList.add("ahed");
  // add all btakhud list w btdef el elements ll list el aslya bt3tk
  // lkn lw 3mlt add bas htdef el list kolha 3la enha one element
  newList.addAll([1, 3, 1, 2, 312]);
  print(newList);
  newList.add([1, 3, 1, 2, 312]);
  print(newList);

  // insert at certain location
  newList = [];
  newList.insert(0, 90);
  print(newList);
  newList.insertAll(0, [13, 1311, 12131, 12312]);
  print(newList);

  ///Replace range
  ///               strt  endidx -> exclusive
  newList.replaceRange(2, 4, [1, 4, 4, 5]);
  print(newList);

  // remove the first occurance
  newList.remove(4);
  print(newList);

  //remove element at that idx
  newList.removeAt(3);
  print(newList);

  //remove certain range
  newList.removeRange(0, 4);
  print(newList);
}

// key and values
void Maps() {
  // te2dr te3ml multiple keys data type
  //fa enta bt7deed el key w l value el enta 3auzha
  Map myMap = {1: "ahmed", 2: "wael", 3: "noni", "salem": 1112};

  myMap.forEach((key, value) {
    print("$key : $value");
  });

  //hytb3 el keys bs
  print(myMap.keys);

  //hytb3 el values bs
  print(myMap.values);

  //hytb3 3dd el keys
  print(myMap.length);

  //bms7 key
  myMap.remove(2);
  print(myMap);

  // byms7 kol el 3nasr
  myMap.clear();
  print(myMap);

  //inserting
  // mynf34 te3ml kaza key mn nfs el esm, el key lazm yeb2a unique
  myMap.addAll({"hamed": 12, "mona": 123, "mona": 12});
  print(myMap);
}

void Sets() {
  //mynf34 nekrr fl elements
  // all elements are unique
  Set names = {"ahmed", "mona", "noni", "ahmed"};
  names.forEach((element) {
    print(element);
  });

  names.add("13");
  names.addAll({"dsad", 123, 121, 111, 1, 1, 11});
  names.addAll(["dasxca", 131.1, 214, 21, 421, 4214, 124]);
  names.forEach((element) {
    print(element);
  });
}

void DymanicVariable() {
  // msh lazm t7dded el data type
  // mmkn ne3ml auto
  var name = "Ahmed";
  var age = 12;
  var male = true;
  print("$male $name $age");

  // once created it always have the same data type
  // bm3na lw 3mlt intialization fl awl eno string mynf34 b3d keda t3rfo int msln
  // name = 12; // hydek error
}

void FinalsAndConsts() {
  // mynf34 te3ml overwrite 3la haga swa2 final aw const
  final int x = 12;
  const int xy = 131;
}

double Average(List<int> l) {
  int sum = 0;
  l.forEach((element) {
    sum += element;
  });
  return sum / l.length;
}

List<double> solveQuadEq(int a, int b, int c) {
  double x1 = (-b + sqrt(pow(b, 2) + 4 * a * c)) / (2 * a);
  double x2 = (-b - sqrt(pow(b, 2) + 4 * a * c)) / (2 * a);
  List<double> ans = [x1, x2];
  return ans;
}

void CodeUnits() {
  String name = "abcdefg";
  print(name.codeUnits); // this prints the ascii code
  String NAME = "abcdefg";
  print(NAME.toUpperCase().codeUnits); // this prints the ascii code
}

void Runes() {
  // hwa bya5od el string bta3k y7wlo le ascii code w ye3mlo list
  String name = "AbdelazizSalah";
  name.runes.forEach((element) {
    print(element);
  });

  print(name.runes);

  //34an tfok el tashfer
  name.runes.forEach((element) {
    print(String.fromCharCode(element));
  });
}

void PrintingEmojies() {
  for (int i = 0; i < 10; i++) {
    String emoji = "\u{1F602}"; // el wesh el byd7k
    print(emoji);
  }
}

void AssertFunc() {
  int? a;
  assert(a != null); // lw a == null byrmy exception
}

void Sublists() {
  List names = ["Abdelaziz", "Salah", "Mohammed", "Abdo"];
  // btakhud start idx w end idx , lw mb3tsh el
  List subList = names.sublist(2);
  print(subList);
  names.shuffle();
  print(names);
}

void ListConversionToMap() {
  List names = ["Abdelaziz", "Salah", "Mohammed", "Abdo"];
  Map myMap = names.asMap();
  print(myMap);
}

void WhereType() {
  List names = [
    "Abdelaziz",
    233,
    "Salah",
    231421,
    421412,
    42141,
    "Mohammed",
    "Abdo"
  ];
  // lw el list kan feha aktur mn no3 de btgeblk kol el elements el mn no3 wahed
  var nums = names.whereType<String>().toList();
  print(nums);
}

void FirstWhere() {
  List vals = [12, 13, 141, 123, 1231, 1];
  var values = vals.firstWhere((element) => element > 30);
  print(values);
}

void EveryAndAnyAndTake() {
  List vals = [12, 13, 141, 123, 1231, 1];
  // btrg3 true lw fe ay element m722 el shrt el mwgod da
  bool trgtBool = vals.any((element) => element > 1000);
  print(trgtBool);

  // btrg3 true lw kol el elements el mwgoda m722a el shart
  trgtBool = vals.every((element) => element > 1000);
  print(trgtBool);

  //bta5ud rkm mo3yn w btrg3 elements bl 3dd da mn el list from 0 to the sent val
  // lw el rkm el enta b3to akbur mn el size btrg3lk el List kolaha
  var sub = vals.take(10);
  print(sub);
}

void WhereFunc() {
  List vals = [12, 13, 141, 123, 1231, 1];

  // btrg3 iterable gowah kol el elements el m722a el condition el enta b3to
  var trgt = vals.where((element) => element > 50);
  print(trgt);

  // btrg3 awl element m722 el shrt
  var Firstwhere = vals.firstWhere((element) => element > 50);
  print(Firstwhere);

  //Index where btrg3 el index bta3 el element el 722 el shart
  var Index = vals.indexWhere((element) => element == 1);
  print(Index);
}

void StartWithAndEndWith() {
  String name = "Wael";
  // it returns bool lw el name start with certain string
  print(name.startsWith("Wa"));

  // it returns bool lw el name end with certain string
  print(name.endsWith("Wa"));

  // it returns bool lw el name contains certain string
  print(name.contains("ae"));
}

// Example
void Example() {
  List<String> names = [
    "Abdelaziz",
    "Salah",
    "Mohammed",
    "Abdo",
    "Ahmed",
    "Salah",
    "Mohammed",
    "Abdo"
  ];
  var vals = names.where((element) => element.startsWith("A"));
  print(vals);
}

void Iterators() {
  // Iterable hya ay container a2dar a3ml 3leh iterations 3la el 3nasr bt3to
  // swa2 baa kan list aw set aw map aw ay container zy el arrays w keda
  List<String> names = [
    "Abdelaziz",
    "Salah",
    "Mohammed",
    "Abdo",
    "Ahmed",
    "Salah",
    "Mohammed",
    "Abdo"
  ];
  Iterator it = names.iterator;
  // toul ma fe next hyd5ol lw wesl ll end 5las
  while (it.moveNext()) {
    print(it.current);
  }
}

void MapFunction() {
  List<String> names = [
    "Abdelaziz",
    "Salah",
    "Mohammed",
    "Abdo",
    "Ahmed",
    "Salah",
    "Mohammed",
    "Abdo"
  ];

/*
 Lw 7tet  => b3d el (e) sa3tha enta bt7ot condition bs 
 laken lw m7tthash fa enta bt3ml el lambda expression bta3k enta w 
 bt7ot el conditions w btshof lw el condition da et7a2a2 3auz t3ml return l a bzbt
*/

  Iterable res = names.map((e) {
    if (e.startsWith("A")) {
      return "A";
    } else
      return "Not A";
  });
  print(res);

  // tb lw 3ndy map w 3auz ageb kol el keys bt3tha bs a3ml a ?
  Map info = {"name": "Abdelaziz", "Age": 21, "Phone": "01153705735"};
  List infoKeys = info.entries.map((e) => e.key).toList();
  print(infoKeys);
  List infoValues = info.entries.map((e) => e.value).toList();
  print(infoValues);
}

void TryAndCatch() {
  // we insert the risky code in the try block then catch the error at the catch
  //block
  try {
    // if you used the / operator only it will produce Infinity without throwing an exception
    int a = 1, b = 0;
    print(a ~/ b);
  } catch (e) {
    print("Error: $e");
  }
}

void main(List<String> arguments) {
  TryAndCatch();
}
