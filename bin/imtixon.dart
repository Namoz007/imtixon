// import 'dart:developer';
import 'dart:io';

void main() {
  stdout.write('Usernamingizni kiriting(Kamida 3ta harf): ');
  String userName = stdin.readLineSync()!;
  if (userName.trim().length >= 3) {
    stdout.write('Parolni kiriting(Kamida 6ta harf): ');
    String password = stdin.readLineSync()!;
    if (password.trim().length >= 6) {
      stdout.write('Toliq ism sharifingizni kiriting: ');
      String fullName = stdin.readLineSync()!;

      stdout.write('Emailingini kiriting(Masalan: gmail.com, email.com): ');
      String email = stdin.readLineSync()!;
      if (email.trim().endsWith('@gmail.com') ||
          email.trim().endsWith('@email.com')) {
        User user = User(
            userName: userName,
            password: password,
            fullName: fullName,
            email: email);
        print('Tabriklayman siz uchun shaxsiy hisob ochildi.');
        while (true) {
          stdout.write(
              "\n1.Profilni korish\n2.Profilni tahrirlash\n3.Parolni ozgartirish\n4.Dasturni yakunlash\n\nBiror bir bolimni tanlang: ");
          String userInput = stdin.readLineSync()!;
          switch (userInput) {
            case '1':
              user.about();
              break;
            case '2':
              user.updateProfile();
              break;
            case '3':
              user.changePassword();
              break;
            case '4':
              print('Dastur yakunlandi.');
            default:
              print('Bunday bolim mavjud emas');
          }
        }
      } else {
        print('Dastur yakunlandi, chunki haqiqiy email kiritmadingiz.');
      }
    } else {
      print(
          'Dastur yakunlandi, chunki siz parolni kamida 6 ta harfda kiritish kerak edi.');
    }
  } else {
    print(
        'Dastur yakunlandi, chunki siz usernamega kamida 3 ta harf kiritmadingiz.');
  }
}

class User {
  String userName;
  String password;
  String fullName;
  String email;

  void changePassword() {
    stdout.write('Parolni kiriting(Kamida 6ta harf): ');
    String password = stdin.readLineSync()!;
    if (password.trim().length >= 6) {
      this.password = password;
    } else {
      print(
          'Parol yangilanmadi, chunki parol uzunligi kamida 6 ta element bolishi kerak edi.');
    }
  }

  void updateProfile() {
    stdout.write('Usernamingizni kiriting(Kamida 3ta harf): ');
    String userNamee = stdin.readLineSync()!;
    if (userNamee.trim().length >= 3) {
      this.userName = userNamee;
      stdout.write('Toliq ism sharifingizni kiriting: ');
      String fullName = stdin.readLineSync()!;
      this.fullName = fullName;
      stdout.write('Emailingini kiriting(Masalan: gmail.com, email.com): ');
      String email = stdin.readLineSync()!;
      if (email.trim().endsWith('@gmail.com') ||
          email.trim().endsWith('@email.com')) {
        print('Tabriklayman siz profilingizni yangilandingiz');
        this.email = email;
      }
    }
  }

  void about() {
    print("""

Ism sharim: ${this.fullName}
Foydalanuvchi nomi: ${this.userName}
Email: ${this.email}
Parol: ${this.password}

""");
  }

  User(
      {required this.userName,
      required this.password,
      required this.fullName,
      required this.email});
}
