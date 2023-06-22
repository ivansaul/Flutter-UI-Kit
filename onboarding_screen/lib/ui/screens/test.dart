import 'package:flutter/material.dart';
import 'package:flutter_template/ui/widgets/widgets.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  PageController controller = PageController();

  final slides = <Widget>[
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
  ];

  double progress = 0;

  @override
  void initState() {
    super.initState();

    double partialProgress = 100 / slides.length;

    progress = partialProgress;

    controller.addListener(() {
      double currentPage = controller.page ?? 0;
      setState(() {
        progress = partialProgress * (1 + currentPage);
        // print('progress: $progress');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return slides[index];
            },
          ),
          ProgressWidget(progress: progress),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          FloatingActionButton(
            onPressed: () {
              // print(controller.page);
              controller.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ],
      ),
    );
  }
}
