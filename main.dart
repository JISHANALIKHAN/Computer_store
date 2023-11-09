import 'dart:io';

class Computer {
  // Declare the fields as instance variables
  String name;
  int Price;
  String OS;
  String RAM;
  String StorageType;
  String Processor;
  String graphics;

  // Define a constructor to initialize the fields
  Computer(this.name, this.Price, this.OS, this.RAM, this.StorageType,
      this.Processor, this.graphics);

  void displayInfo() {
    print(
        "$name computer has $RAM of RAM, $StorageType storage, $Processor processor, and $graphics graphics card.\nIt operates on $OS and It is priced at $Price");
  }
}

main() {
  int Cash = 0;
  List<Computer> computers = [];
  List<Computer> UserRequirment = [];
  List<Computer> MatchingComputer = List.from(UserRequirment);
  List<Computer> PurchasedComputer = [];
  Computer DELL1 = Computer('DELL1', 24000, 'Linux Ubuntu', '8 GB DDR4',
      '512 GB SSD', 'Intel i3 7230U core', 'RTX 3040');
  Computer HP15 = Computer('HP15', 55000, 'Windows 11', '16 GB DDR4',
      '512 GB SSD', 'Ryzen 5 5600G', 'Radeon Intergrated');
  Computer HP11 = Computer('HP11', 19000, 'Chrome os', '4 GB DDR4',
      '128 GB SSD', 'Ryzen 3 5600U', 'Radeon Intergrated Graphics');
  Computer DELL2 = Computer('DELL2', 58000, 'Windows 11', '16 GB DDR4',
      '1 TB SSD', 'Intel i5 7230U core', 'RTX 3040');
  Computer HP13 = Computer('HP13', 55000, 'Chrome os', '8 GB DDR4',
      '512 GB SSD', 'Ryzen 5 3200G', 'RTX 4060');
  Computer HP10 = Computer('HP10', 25000, 'Linux kali', '8 GB DDR4',
      '128 GB SSD', 'Ryzen 3 5600U', 'Radeon Intergrated Graphics');
  computers.add(DELL1);
  computers.add(HP11);
  computers.add(HP15);
  computers.add(DELL2);
  computers.add(HP13);
  computers.add(HP10);
  void findComputerOs(String Os) {
    if (Os == 'Windows') {
      for (Computer computer in computers) {
        if (computer.OS.contains('Windows') == true) {
          MatchingComputer.add(computer);
        }
      }
    } else if (Os == 'Linux') {
      for (Computer computer in computers) {
        if (computer.OS.contains('Linux') == true) {
          MatchingComputer.add(computer);
        }
      }
    } else if (Os == 'Chrome os') {
      for (Computer computer in computers) {
        if (computer.OS.contains('Chrome Os') == true) {
          MatchingComputer.add(computer);
        }
      }
    }
  }

  void findComputerProcessor(String ProcessorRequirement) {
    if (ProcessorRequirement == 'AMD Ryzen') {
      for (Computer computer in UserRequirment) {
        if (computer.Processor.contains('Ryzen') == false) {
          MatchingComputer.remove(computer);
        }
      }
    } else if (ProcessorRequirement == 'Intel core') {
      for (Computer computer in UserRequirment) {
        if (computer.Processor.contains('core') == false) {
          MatchingComputer.remove(computer);
        }
      }
    }
  }

  void findStorageType(String StorageRequirement) {
    if (StorageRequirement == 'SSD') {
      for (Computer computer in UserRequirment) {
        if (computer.StorageType.contains('SSD') == false) {
          MatchingComputer.remove(computer);
        }
      }
    } else if (StorageRequirement == 'HDD') {
      for (Computer computer in UserRequirment) {
        if (computer.StorageType.contains('HDD') == false) {
          MatchingComputer.remove(computer);
        }
      }
    }
  }

  void findBudgetComputer(String budget) {
    int? startingPrice;
    int? endingPrice;

    for (int index = 0; index < budget.length; index++) {
      if (budget[index] == '-') {
        startingPrice = int.parse(budget.substring(0, index));
        endingPrice = int.parse(budget.substring(index + 1));
        break;
      }
    }

    if (startingPrice != null && endingPrice != null) {
      for (Computer computer in UserRequirment) {
        if (computer.Price < startingPrice && computer.Price > endingPrice) {
          MatchingComputer.remove(computer);
        }
      }
    }
  }

  print(
      "We have these operating systems available:\nWindows\nLinux\nChrome os\nEnter your os requirement from above list:");
  String? Os = stdin.readLineSync();
  if (Os != null) {
    if (Os == 'Windows') {
      print('So you want a computer with Windows os');
      findComputerOs('Windows');
    } else if (Os == 'Linux') {
      print('So you want a computer with linux os');
      findComputerOs('Linux');
    } else if (Os == 'Chrome os') {
      print("So you want a computer with Chrome os");
      findComputerOs('Chrome os');
    }
  } else {
    print("No Os was entered");
  }
  print(
      "We have this companies processors available:\nAMD Ryzen\nIntel core\nEnter your processor requirement from the above list:");
  String? ProcessorRequirement = stdin.readLineSync();
  if (ProcessorRequirement != null) {
    if (ProcessorRequirement == 'AMD Ryzen') {
      print("So you want a computer with AMD Ryzen processor");
      findComputerProcessor("AMD Ryzen");
    } else if (ProcessorRequirement == 'Intel core') {
      print("So you want a computer with an Intel core processor");
      findComputerProcessor("Intel core");
    }
  } else {
    print("No processor name was entered");
  }
  print(
      "We have two storage types drives available:\nSSD\nHDD\nEnter your Storage type requirement:");
  String? StorageRequirement = stdin.readLineSync();
  if (StorageRequirement != null) {
    if (StorageRequirement == 'SSD') {
      print("So you need a computer with SSD storage type");
      findStorageType('SSD');
    } else if (StorageRequirement == 'HDD') {
      print("So you want a computer with HDD storage type");
      findStorageType('HDD');
    }
  } else {
    print("No storage requirment was entered");
  }
  print(
      "Enter your Budget range for the computer in the format(starting price-ending price)");
  String? budget = stdin.readLineSync();
  if (budget != null) {
    if (budget.contains('-') == false) {
      print("You did not entered the hypen(-)");
    } else {
      print('So your budget range is $budget');
      findBudgetComputer(budget);
    }
  }
  int length = MatchingComputer.length;
  if (length != 0) {
    print('We have $length computers that meet your requirement');
    for (Computer computer in MatchingComputer) {
      computer.displayInfo();
    }
    print("Enter the computer you liked by its name:");
    String? sellComputerName = stdin.readLineSync();
    if (sellComputerName != null) {
      for (Computer computer in MatchingComputer) {
        if (computer.name.contains(sellComputerName)) {
          PurchasedComputer.add(
              computer); // Add the selected computer to the purchasedComputers list
          Cash += computer.Price;
          MatchingComputer.remove(
              computer); // Remove the selected computer from matchingComputers
          print("That computer costed you $Cash");
          print("Have a nice day!");
          break;
        }
      }
    }
  } else {
    print("Sorry we do not have any computer that meet your requrement!");
  }
}
