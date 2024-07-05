import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const baseTextColor = Colors.black87;
    const secondaryTextColor = Colors.black54;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
          dividerTheme: const DividerThemeData(
            color: secondaryTextColor,
          ),
          listTileTheme: const ListTileThemeData(
            iconColor: baseTextColor,
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: baseTextColor,
              ),
              labelSmall: TextStyle(
                color: secondaryTextColor,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: const Icon(Icons.arrow_back),
      ),
      body: ListView.separated(
          itemCount: 15,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) => ListTile(
              leading: SvgPicture.asset(
                'assets/images/cat.svg',
                height: 40,
                width: 40,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text('Product', style: theme.textTheme.bodyMedium),
              subtitle:
                  Text('some description', style: theme.textTheme.labelSmall))),
    );
  }
}
