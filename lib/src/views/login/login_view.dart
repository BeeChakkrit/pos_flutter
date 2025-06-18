import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_flutter/src/views/login/widget_textfile.dart';
import 'package:pos_flutter/src/widgets/my_sizedbox.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wallpaper-login.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to POS Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MySizedbox(
                    size: 20,
                    myType: 'h',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
              margin: const EdgeInsets.all(45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MySizedbox(
                    size: 20,
                    myType: 'h',
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                  const MySizedbox(
                    size: 10,
                    myType: 'h',
                  ),
                  Text(
                    'ยินดีต้อนรับสู่ POS Flutter \nกรุณาเข้าสู่ระบบเพื่อเริ่มต้นใช้งาน',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[900]),
                  ),
                  const MySizedbox(
                    size: 20,
                    myType: 'h',
                  ),
                  const TextfileLogin(
                    text: 'Username',
                  ),
                  const MySizedbox(
                    size: 10,
                    myType: 'h',
                  ),
                  const TextfileLogin(
                    text: 'Password',
                  ),
                  const MySizedbox(
                    size: 20,
                    myType: 'h',
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/table');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/wallpaper-login.jpg'),
                          fit: BoxFit.cover,
                        ),
                        // border: Border.all(color: Colors.blue[900]!, width: 2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
