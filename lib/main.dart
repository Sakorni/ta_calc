import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ta_calc/models/decoder/code_to_list_and_operation_decoder.dart';
import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/models/decoder/list_to_code_decoder.dart';
import 'package:ta_calc/resources/enums.dart';
import 'package:ta_calc/resources/strings.dart';
import 'package:ta_calc/ui/operations_decode_page/operations_decode_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MyColor(),
            overlayColor: MyColor(),
          ),
        ),
      ),
      builder: (context, child) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        return child!;
      },
      home: MyHomePage(),
    );
  }
}

class MyColor extends MaterialStateColor {
  const MyColor() : super(0xFFEEEEEE);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.grey[200]!;
    }
    return Colors.white;
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> titles = [
    AppStrings.listToCode,
    AppStrings.codeToList,
    AppStrings.codeToOpers,
  ];

  final Widget listToCode = OperationsDecodePage(
    calcMode: CalcMode.encode,
    decoderDelegate: ListToCodeDecoder(),
  );

  final Widget codeToList = OperationsDecodePage(
    calcMode: CalcMode.decode,
    decoderDelegate: CodeToListDecoder(),
  );

  final Widget codeToListAndOpers = OperationsDecodePage(
    calcMode: CalcMode.decode,
    decoderDelegate: CodeToListAndOperation(),
  );

  int index = 0;

  void changeIndex(int value) {
    assert(value >= 0 && value < titles.length);
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CalculatorDrawer(
        titles: titles,
        onItemTapped: changeIndex,
      ),
      appBar: AppBar(
        //TODO: Добавить инфостраницу, где будут перечислены простые числа (вдруг челу захочется) и правила преобразования операции в код, мол, какой что соответствует и прочее
        title: Text(titles[index]),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        children: [
          listToCode,
          codeToList,
          codeToListAndOpers,
        ],
        index: index,
      ),
    );
  }
}

class CalculatorDrawer extends StatelessWidget {
  final List<String> titles;
  final void Function(int index) onItemTapped;

  const CalculatorDrawer(
      {Key? key, required this.titles, required this.onItemTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(child: Text("Лучшая навигация")),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            padding: EdgeInsets.zero,
          ),
          ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text(titles[0]),
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.calculate_rounded),
              title: Text(
                titles[1],
              ),
              onTap: () {
                onItemTapped(1);
                Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.calculate),
              title: Text(titles[2]),
              onTap: () {
                onItemTapped(2);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
