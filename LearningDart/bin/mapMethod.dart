void main() {
  usingTheListAndApplyingMapWithExternalFuntion();
}

void usingTheListAndApplyingMapWithExternalFuntion() {
  var myNumbers = [1, 2, 4, 5, 6, 7];

  // we use (as) when dart can't recognize the type of the sent parameter
  ///also we use toList when we want the output not to be iterable but to be list
  var doubleList =
      (myNumbers as List<int>).map((element) => doubleNumber(element)).toList();

  for (var element in doubleList) {
    print(element);
  }
}

void usingTheListAndApplyingMapWithAnonymusFuntion() {
  List<int> myNumbers = [1, 2, 4, 5, 6, 7];
  var doubleList = myNumbers.map((int x) {
    return x * 2;
  });
  doubleList.forEach((element) {
    print(element);
  });
}

int doubleNumber(int x) {
  return x * 2;
}
