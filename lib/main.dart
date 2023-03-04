import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color surfaceColor = Color(0x0dffffff);
    Color primaryColor = Colors.pink.shade400;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: MyHomePage(
        toggleThemeMode: () {
          setState(() {
            if (_themeMode == ThemeMode.dark)
              _themeMode = ThemeMode.light;
            else
              _themeMode = ThemeMode.dark;
          });
        },
      ),
    );
  }
}

class MyAppThemeConfig {
  final primaryColor = Colors.pink.shade400;
  final Color primaryTextColor;
  final Color secondryTexColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondryTexColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;
  MyAppThemeConfig.light()
      : primaryTextColor = Colors.grey.shade900,
        secondryTexColor = Colors.grey.shade900.withOpacity(.8),
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(235, 235, 235, 235),
        brightness = Brightness.light;
  ThemeData getTheme() {
    return ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        primaryColor: primaryColor,
        brightness: brightness,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: appBarColor,
            foregroundColor: primaryTextColor),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: surfaceColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor))),
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
              bodyMedium: TextStyle(fontSize: 15, color: primaryTextColor),
              bodySmall: TextStyle(fontSize: 13, color: secondryTexColor),
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold, color: primaryTextColor),
              titleMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor)),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final Function() toggleThemeMode;

  const MyHomePage({super.key, required this.toggleThemeMode});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum _SkillType { photoshop, xd, illustrator, aftterEfect, lightRoom }

class _MyHomePageState extends State<MyHomePage> {
  _SkillType _skill = _SkillType.photoshop;
  void updateSelectedSkill(_SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: widget.toggleThemeMode,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 16, 0),
              child: Icon(CupertinoIcons.moon),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
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
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
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
                'uben macht den meister  تمرین استاد میسازه',
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
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Skill(
                    type: _SkillType.photoshop,
                    title: 'Photoshop',
                    imagePath: 'assets/images/app_icon_01.png',
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.photoshop,
                    onTap: () {
                      updateSelectedSkill(_SkillType.photoshop);
                    },
                  ),
                  Skill(
                    type: _SkillType.xd,
                    title: 'Adobe XD',
                    imagePath: 'assets/images/app_icon_05.png',
                    shadowColor: Colors.pink,
                    isActive: _skill == _SkillType.xd,
                    onTap: () {
                      updateSelectedSkill(_SkillType.xd);
                    },
                  ),
                  Skill(
                    type: _SkillType.illustrator,
                    title: 'Illustrator',
                    imagePath: 'assets/images/app_icon_04.png',
                    shadowColor: Colors.orange,
                    isActive: _skill == _SkillType.illustrator,
                    onTap: () {
                      updateSelectedSkill(_SkillType.illustrator);
                    },
                  ),
                  Skill(
                    type: _SkillType.aftterEfect,
                    title: 'After Effect',
                    imagePath: 'assets/images/app_icon_03.png',
                    shadowColor: Colors.blue.shade800,
                    isActive: _skill == _SkillType.aftterEfect,
                    onTap: () {
                      updateSelectedSkill(_SkillType.aftterEfect);
                    },
                  ),
                  Skill(
                    type: _SkillType.illustrator,
                    title: 'Lightroom',
                    imagePath: 'assets/images/app_icon_02.png',
                    shadowColor: Colors.blue,
                    isActive: _skill == _SkillType.lightRoom,
                    onTap: () {
                      updateSelectedSkill(_SkillType.lightRoom);
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(CupertinoIcons.at)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'PassWord',
                        prefixIcon: Icon(CupertinoIcons.lock)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 48,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text('Save')))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final _SkillType type;
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final Function() onTap;

  const Skill(
      {super.key,
      required this.type,
      required this.title,
      required this.imagePath,
      required this.shadowColor,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive
            ? BoxDecoration(
                color: Theme.of(context).dividerColor,
                borderRadius: BorderRadius.circular(12),
              )
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: shadowColor.withOpacity(.5), blurRadius: 20)
                    ])
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
