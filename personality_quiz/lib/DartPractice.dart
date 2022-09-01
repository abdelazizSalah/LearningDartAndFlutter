void main() {
  SpreadOperator();
}

void SpreadOperator() {
  // this operator is responsible for taking all the elements of the nested list
  // and insert them as an elements for the outside list
  List names = [
    "Ahmed",
    ...["Salma", "Mona", "Gamal"]
  ];

  print(names);
}
