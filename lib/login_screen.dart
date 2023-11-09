import 'package:flutter/material.dart';
import 'package:flutter_course_october/telegram_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://th.bing.com/th/id/R.b851c29cc57ba8fd7e44651521e62295?rik=j8uMXSGqSkQvUg&riu=http%3a%2f%2fwww.atfmb.com%2fwp-content%2fuploads%2f2010%2f08%2fflowers_001.jpg&ehk=%2bsaJCU1hpq1QkvqKQLGYZdezmCeuiUkcIE%2f3x7%2bjV3A%3d&risl=&pid=ImgRaw&r=0"))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            color: const Color.fromARGB(207, 255, 255, 255),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image(
                  width: MediaQuery.of(context).size.width / 1.3,
                  image: const NetworkImage(
                      "https://th.bing.com/th/id/R.4b09b067a814c117ec1a34bbb021a00e?rik=Mytxyc8rtpBNIA&riu=http%3a%2f%2fwww.hdwallpapers.in%2fwalls%2fpurple_flowers-normal.jpg&ehk=1LFwUfNeO0jPoxDXFaA5LDa%2fU8JQPBSRMtZtI0VTzGI%3d&risl=&pid=ImgRaw&r=0"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white60,
                    filled: true,
                    prefixIcon: const Icon(Icons.email),
                    hintText: "example@example.com",
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                        //  borderSide: BorderSide(width: 5.0, strokeAlign: 2.2),
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white60,
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    hintText: "P@ssw0rd",
                    label: const Text("Password"),
                    border: OutlineInputBorder(
                        //  borderSide: BorderSide(width: 5.0, strokeAlign: 2.2),
                        borderRadius: BorderRadius.circular(20))),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TelegramScreen(),
                    ));
                  },
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: const Text(
                        "Log in",
                        textAlign: TextAlign.center,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You don't have account?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create one",
                        style: TextStyle(color: Colors.purple[900]),
                      ))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
