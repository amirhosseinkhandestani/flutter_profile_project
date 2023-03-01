import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.pink.shade400,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
              bodyMedium: TextStyle(fontSize: 18),
              bodySmall: TextStyle(
                  fontSize: 13, color: Color.fromARGB(200, 255, 255, 255)),
              titleLarge: TextStyle(fontWeight: FontWeight.bold),
              titleMedium:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/profile_image.png',
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AmirHossein Khandestani',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Flutter Programer'),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            size: 15,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Iran,Shiraz',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  CupertinoIcons.heart,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
            child: Text(
              'uben macht den meister',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 12),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                'Skills',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                CupertinoIcons.chevron_down,
                size: 12,
              )
            ]),
          ),
          Center(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_icon_01.png',
                        width: 40,
                        height: 40,
                      ),
                      Text('photoshop'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
