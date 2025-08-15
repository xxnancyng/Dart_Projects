class Person {
  // Fields
  String name;
  int age;
  
  // Constructor
  Person(this.name, this.age);
  
  // Method
  void introduce() {
    print('Hi, I am $name, and I am $age years old.');
  }
  
  // Getter
  String get nameInUpperCase => name.toUpperCase();
  
  // Setter
  set updateAge(int newAge) => age = newAge;
}


void main() {
  // Create an instance
  var person = Person('Alice', 30);
  
  // Call method
  person.introduce(); // Output: Hi, I am Alice, and I am 30 years old.
  
  // Use getter
  print(person.nameInUpperCase); // Output: ALICE
  
  // Use setter
  person.updateAge = 31;
  print(person.age); // Output: 31
}

