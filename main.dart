import 'dart:io';
import 'dart:math';

class Car {
  int id;
  String brand;
  String model;

  Car(this.id, this.brand, this.model);
}

List<Car> cars = [];

void listCars() {
  if (cars.isEmpty) {
    print(cars);
    print('There is no car to show.');
    print('');
  } else {
    cars.forEach((car) {
      print('CarID : ${car.id}');
      print('CarBrand : ${car.brand}');
      print('CarModel : ${car.model}');
      print('');
    });
  }
}

void createCars(String brand, String model) {
  var ramdomID = Random();
  var car = Car(ramdomID.nextInt(1000), brand, model);
  cars.add(car);
  print('You created a new car successfully');
  print('');
}

void updateCars(int id, String brand, String model) {
  var carIndex = cars.indexWhere((car) => car.id == id);
  if (carIndex >= 0) {
    cars[carIndex].brand = brand;
    cars[carIndex].model = model;
    print('You updated $brand and $model to ID : $id successfully');
    print('');
  } else {
    print('Your ID is invalid');
    print('');
  }
}

void deleteCars(int id) {
  var carIndex = cars.indexWhere((car) => car.id == id);
  if (carIndex >= 0) {
    cars.removeAt(carIndex);
    print('You deleted the ID: $id successfully');
    print('');
  } else {
    print('Your ID is invalid');
    print('');
  }
}

void main() {
  print('CRUD operations on cars');

  while (true) {
    print('You can run this program by typing this commands:');
    print('1 : list');
    print('2 : create');
    print('3 : update');
    print('4 : delete');
    print('5 : exit');
    print('');

    stdout.write('Enter a command above you want: ');
    var command = stdin.readLineSync()!;
    print('');

    if (command == 'list') {
      listCars();
      print('');
    } else if (command == 'create') {
      stdout.write('Enter a new car brand: ');
      var brand = stdin.readLineSync()!;
      stdout.write('Enter a new car model: ');
      var model = stdin.readLineSync()!;
      createCars(brand, model);
      print('');
      listCars();
      print('');
    } else if (command == 'update') {
      stdout.write('Enter the car ID you want to update: ');
      var id = int.parse(stdin.readLineSync()!);
      stdout.write('Enter the new car brand: ');
      var brand = stdin.readLineSync()!;
      stdout.write('Enter the new car model: ');
      var model = stdin.readLineSync()!;
      updateCars(id, brand, model);
      print('');
      listCars();
      print('');
    } else if (command == 'delete') {
      stdout.write('Enter the car ID you want to delete: ');
      var id = int.parse(stdin.readLineSync()!);
      deleteCars(id);
      print('');
      listCars();
      print('');
    } else if (command == 'exit') {
      break;
    } else {
      print('Your command is invalid!!Please Try again');
      print('');
    }
  }
}
