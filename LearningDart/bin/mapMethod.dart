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

/**
 * you just need to rewatch the mapping to widgets video again and understand these steps:

1- you use as List<String> when the compiler can't determine the type of your list, in other words when you create a generic data type with out specifing it explicitly in the code

2- the map function takes one of the two following options: 

     1- either take (parameters) { bodyLogic ; } 

     2- or take (element) => function(element) ; 

in the first option you create an anonymus function and inside the curly braces you insert the logic you want 

while in the second option you call certain function on all the elements of the list 

3- in both cases the map returns an iterable object which is something like a generic class for all lists 

4- so in order to convert it to list you just use the method inside it which is called toList() to convert the iterable into list

5- then the last step which is ... operator, it is simply instead of having this list as a whole as one item inside the container, you just get all the elements inside this list out and put them in the outter list,

ie: let that you have a box of chocolates which contains 4 chocolates, so instead of putting the box inside the refrigerator you wanted to put each piece of the chocolates one by one, so you use the ... operator to get the pieces one by one from the box into the refrigerator. 
 */