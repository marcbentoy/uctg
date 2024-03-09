import 'package:uctg/environment.dart';

void main() {
  Environment environment = Environment();

  environment.initializePopulation();

  environment.generate();

  // for (Individual individual in environment.population) {
  //   print(individual.toString());
  //   for (Schedule schedule in individual.schedules) {
  //     print(schedule.toString());
  //   }
  //   print("- - - -");
  // }

  // runApp(const MainApp());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }
