import 'dart:io';

main() {
  //adminName: admin.  adminParol: 1234
  student student1 = student("Ali", "Huseynov", 19, 89, "1919");
  student student2 = student("Yagub", "Rasul", 21, 90, "2121");
  student student3 = student("Emil", "Abdul", 20, 78, "2020");
  List<student> students = [student1, student2, student3];
  teacher teacher1 = teacher("Murad1", "Musayev", "0509");
  teacher teacher2 = teacher("Murad2", "Musayev", "311");
  List<teacher> teachers = [teacher1, teacher2];

  String adminUser = "admin";
  String adminParol = "1234";

  greekMain:
  while (true) {
    stdout.write(
        "Tehsil vezifenizi daxil edin:\n1.telebe\n2.muellim\n3.Admin\n:");
    int? includer = int.parse(stdin.readLineSync()!);
    if (includer == 1) {
      print("Telebe bolmesine xosh geldiniz...");
      stdout.write(
          "Ne uzre yararlanmaq isteyirsiniz:\n1.Umumi netice ve ders sistemine baxmaq ucun\n2.Qeydiyyatdan otru\n:");
      int? studentPoll = int.parse(stdin.readLineSync()!);
      if (studentPoll == 1) {
        print("Ortalamaniz barede melumatlar yuklenir...");
        stdout.write("Adinizi daxil edin : ");
        String? showName = stdin.readLineSync();
        stdout.write("Parolunuzu daxil edin : ");
        String? showParol = stdin.readLineSync();
        for (int i = 0; i < students.length; i++) {
          if (students[i].name == showName) {
            if (students[i].parol == showParol) {
              students[i].showAvarage();
            } else {
              print("Yanlish parol daxil etdiniz...");
            }
          }
        }
      } else if (studentPoll == 2) {
        print("Qeydiyyat bolmesine xosh geldiniz...");
        stdout.write("Adinizi daxil edin: ");
        String? yourName = stdin.readLineSync();
        stdout.write("Soyadinizi daxil edin: ");
        String? yourSurname = stdin.readLineSync();
        stdout.write("Yashinizi daxil edin : ");
        int? yourAge = int.parse(stdin.readLineSync()!);
        stdout.write("Ortalamanizi daxil edin : ");
        int? yourAvarage = int.parse(stdin.readLineSync()!);
        stdout.write("Parolunuzu daxil edin: ");
        String? yourParol = stdin.readLineSync();
        student $yourName =
            student(yourName, yourSurname, yourAge, yourAvarage, yourParol);
        students.add($yourName);
        $yourName.show();
      }
    } else if (includer == 2) {
      print("Muellim bolmesine xosh geldiniz...");
      
      
     stdout.write("Adinizi daxil edin : ");
        String? showName = stdin.readLineSync();
        stdout.write("Parolunuzu daxil edin : ");
        String? showParol = stdin.readLineSync();
        for (int i = 0; i < teachers.length; i++) {
          if (teachers[i].name == showName) {
            if (teachers[i].parol == showParol) {
                teachers[i].welcomeTeacher();
                greekTeacher:
                while (true) {
                  stdout.write(
                      "Teleberinizin ortalamali cedvelini gormek isteyirsiniz y or n : ");
                  String? adminAnswer = stdin.readLineSync();
                  if (adminAnswer == "y") {
                    students.forEach((element) {
                      teacher.show(element);
                    });
                    break greekTeacher;
                  } else if (adminAnswer == "n") {
                    print("Sorgunuz ucun tesekkurler");
                    break greekTeacher;
                  } else {
                    print(
                        "Yanlsih cavab daxil etdiniz,xaish edirik yeniden yoxlayasiniz...");
                    continue greekTeacher;
                  }
                }
            } else {
              print("Yanlish parol daxil etdiniz...");
            }
          }
        }
    } else if (includer == 3) {
      print("Admin bolmesine xosh geldiniz...");
      stdout.write("Admin, istifadeci adini daxil edin : ");
      String? adminIncludeUser = stdin.readLineSync();
      stdout.write("Admin istifadeci parolunu daxil edin: ");
      String? adminIncludeParol = stdin.readLineSync();
      if (adminParol == adminIncludeParol && adminUser == adminIncludeUser) {
        greekAdmin:
        while (true) {
          stdout.write("Telebe siyahisini gormek isteyirsiniz y or n : ");
          String? adminAnswer = stdin.readLineSync();
          if (adminAnswer == "y") {
            students.forEach((element) {
              admin.show(element);
            });
            break greekAdmin;
          } else if (adminAnswer == "n") {
            print("Sorgunuz ucun tesekkurler");
            break greekAdmin;
          } else {
            print(
                "Yanlsih cavab daxil etdiniz,xaish edirik yeniden yoxlayasiniz...");
            continue greekAdmin;
          }
        }
      }
    }
    greekAnswer:
    while (true) {
      stdout.write("Davam etmek isteyirsiniz y or n : ");
      String? mainAnswer = stdin.readLineSync();
      if (mainAnswer == "y") {
        continue greekMain;
      } else if (mainAnswer == "n") {
        break greekMain;
      } else {
        print(
            "Yanlsih cavab daxil etdiniz,xaish edirik yeniden yoxlayasiniz...");
        continue greekAnswer;
      }
    }
  }
}

class student {
  student(this.name, this.surname, this.age, this.avarage, this.parol);
  int? age;
  String? name;
  String? surname;
  int? avarage;
  String? parol;
  void showAvarage() {
    print("****************************************************************");
    print("$name $surname sizin umumi ortalamaniz $avarage beraberdir");
    print("****************************************************************");
  }

  void show() {
    print("****************************************************************");
    print("Sizin melumatlar sistemde bu cur qeyd olundu");
    print("name: $name\nsurname: $surname\nage: $age\navarage: $avarage");
    print("****************************************************************");
  }
}

class admin {
  static String adminName = "admin";
  static String adminPassword = '1234';

  static show(student std) {
    print("************************************");
    print("name: ${std.name}\nsurname: ${std.surname}\nage: ${std.age}");
  }
}

class teacher {
  teacher(this.name, this.surname, this.parol);
  String? name;
  String? surname;
  String? parol;

  static void show(student std) {
    print("${std.name} ${std.surname}: ${std.avarage}");
  }

  welcomeTeacher() {
    print("$name $surname sisteme xosh geldiniz...");
  }
}
