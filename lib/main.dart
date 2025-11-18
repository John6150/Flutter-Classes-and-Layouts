import 'package:flutter/material.dart';

void main() {
  callUser('Kortede', x: 3);
  runApp(const MyApp());
  Student korede = Student(
    name: 'Korede',
    cgpa: 3.2,
    stdBioData: BioData(age: 32, height: 500),
  );

  // korede.cgpa = 2.5;
  // korede.course = 'Flutter';

  korede.setStdName = 'Hameed'; // Using a Setter
  korede.stdName; // Using a Getter
  print(korede.name);
  print(korede.stdName);

  korede.callStudent();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String titleTwo = 'First App';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
        title: Text(
          'WhatsApp',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.more_horiz_outlined),
          onPressed: () {},
          color: Colors.black,
        ),
        actions: [
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 10),
          // Spacer(),
          SizedBox(
            child: IconButton(
              padding: EdgeInsets.all(2),
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children:
              // [
              //   SizedBox(height: 30),
              // ChatTile(
              //   lastmsg: 'Hello sir, I went out to buy food',
              //   username: 'Hameed',
              //   time: '8:21',
              //   dp: 'lib/images/dp.png',
              //   msgs: 20,
              // ),
              // SizedBox(height: 30),
              // ChatTile(
              //   lastmsg: "Good morning sir, I'll be late today",
              //   username: 'Korede',
              //   time: '10:21',
              //   dp: 'lib/images/dp.png',
              //   msgs: 50,
              // ),
              users
                  .map(
                    (e) => Column(
                      children: [
                        SizedBox(height: 30),
                        ChatTile(
                          lastmsg: e['lastmsg'],
                          username: e['name'],
                          time: e['time'],
                          dp: e['dp'],
                          msgs: e['msgs'],
                        ),
                      ],
                    ),
                  )
                  .toList(),

          // ...users.map(
          //   (e) => Column(
          //     children: [
          //       SizedBox(height: 30),
          //       ChatTile(
          //         lastmsg: e['lastmsg'],
          //         username: e['name'],
          //         time: e['time'],
          //         dp: e['dp'],
          //         msgs: e['msgs'],
          //       ),
          //     ],
          //   ),
          // ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

List<Map<String, dynamic>> users = [
  {
    'name': 'Hameed',
    'lastmsg': 'Hello sir, I went out to buy food',
    'msgs': null,
    'dp': null,
    'time': '8:21',
  },
  {
    'name': 'Korede',
    'lastmsg': "Good morning sir, I'll be late today",
    'msgs': 50,
    'dp': 'lib/images/dp.png',
    'time': '10:21',
  },
];

// [{}]

class Student extends CourseRep {
  // List [] //array
  // Map // objest
  String name; // properties
  double cgpa;
  final List? sub;
  final BioData stdBioData;

  Student({
    required this.name,
    required this.cgpa,
    this.sub,
    required this.stdBioData,
  }) : super(course: ''); // constructor

  void callStudent() {
    print(
      'Hello $name, your cgpa is $cgpa, you are ${stdBioData.age} years old, and you are ${stdBioData.height}cm tall',
    );
  } // function

  // String get stdName => name; // getter

  // set setStdName(String text) => name = text; // setter
  // {
  //   name = text;
  // } // setter

  String get stdName {
    return name;
  } // getter

  set setStdName(text) {
    name = text;
  } // setter
}

class BioData {
  final int age;
  final double height;

  const BioData({required this.age, required this.height});
}

class CourseRep {
  String course;
  CourseRep({required this.course});
}

class Button extends StatefulWidget {
  final Color btnColor;
  const Button({super.key, required this.btnColor});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    int x = 0;
    return TextButton(
      onPressed: () {
        setState(() {
          x += 1;
          // x++;
        });
      },
      child: Text('Click me'),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

int callUser(String name, {int? x}) {
  return 3;
}

class ChatTile extends StatefulWidget {
  final String? dp;
  final String username;
  final String lastmsg;
  final String time;
  final int? msgs;
  const ChatTile({
    super.key,
    this.dp,
    required this.username,
    required this.lastmsg,
    required this.time,
    this.msgs,
  });

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.withValues(alpha: 0.3),
            image: widget.dp == null
                ? null
                : DecorationImage(
                    repeat: ImageRepeat.noRepeat,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.dp ?? ''),
                    // image: AssetImage('lib/images/dp.png'),
                  ),

            borderRadius: BorderRadius.all(Radius.circular(50000)),
          ),
          child: widget.dp == null ? Icon(Icons.people) : SizedBox.shrink(),
        ),
        SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.username),
            // Text('Hameed'),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.lastmsg,
                    // text: 'Hello sir, I went out to buy food',
                    style: TextStyle(color: Colors.black),
                  ),
                  // TextSpan(
                  //   text: 'I will be back shortly',
                  //   style: TextStyle(color: Colors.red),
                  // ),
                ],
              ),
            ),
            // Text('Hello sir, I went out to buy food'),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(widget.time, style: TextStyle(color: Colors.green)),
            // Text('08:21', style: TextStyle(color: Colors.green)),
            Row(
              children: [
                Icon(Icons.notifications_off_rounded),
                SizedBox(width: 10),
                widget.msgs != null
                    ? Container(
                        width: 20,
                        height: 20,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30000),
                        ),

                        child: Center(
                          child: Text(
                            widget.msgs.toString(),
                            // '${widget.msgs}',
                            // '32',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
