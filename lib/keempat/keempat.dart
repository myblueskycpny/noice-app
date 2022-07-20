import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  String? nama;
  String? nim;
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama');
      nim = prefs.getString('nim');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.orange,
            title: const Text(
              'PROFIL',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.person, color: Colors.white, size: 35),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama ?? '',
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          nim ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Data Pribadi',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(color: Colors.amber),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.amber),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 14,
                    ),
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.remove('id');
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
