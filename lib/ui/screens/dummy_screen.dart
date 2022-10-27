// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../models/created_test_model.dart';

// class HiveExampleUi extends StatefulWidget {
//   static const String id = '/dummy';
//   @override
//   _HiveExampleUiState createState() => _HiveExampleUiState();
// }

// class _HiveExampleUiState extends State<HiveExampleUi> {
//   late Box _personBox;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Hive.registerAdapter(CreatedTestModelAdapter());
//     _openBox();
//   }

//   Future _openBox() async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive.init(dir.path);
//     _personBox = await Hive.openBox('personBox');
//     return;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hive example"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Wrap(
//             children: <Widget>[
//               TextButton(
//                 child: Text("Add item "),
//                 onPressed: () {
//                   CreatedTestModel testModel =
//                       CreatedTestModel("Vivek", DateTime.now());
//                   _personBox.add(testModel);
//                 },
//               ),
//               TextButton(
//                 child: Text("Delete item "),
//                 onPressed: () {
//                   int lastIndex = _personBox.toMap().length - 1;
//                   if (lastIndex >= 0) _personBox.deleteAt(lastIndex);
//                 },
//               ),
//               TextButton(
//                 child: Text("Update item "),
//                 onPressed: () {
//                   int lastIndex = _personBox.toMap().length - 1;
//                   if (lastIndex < 0) return;

//                   CreatedTestModel personModel =
//                       _personBox.values.toList()[lastIndex];
//                   personModel.createdDate = DateTime.now();
//                   _personBox.putAt(lastIndex, personModel);
//                 },
//               ),
//             ],
//           ),
//           Text("Data in database"),
//           _personBox == null
//               ? Text("Box is not initialized")
//               : Expanded(
//                   child: WatchBoxBuilder(
//                     box: _personBox,
//                     builder: (context, box) {
//                       Map<dynamic, dynamic> raw = box.toMap();
//                       List list = raw.values.toList();

//                       return ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: list.length,
//                         itemBuilder: (context, index) {
//                           CreatedTestModel personModel = list[index];
//                           return ListTile(
//                             title: Text(personModel.testName),
//                             subtitle: Text(
//                                 personModel.createdDate.toLocal().toString()),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
// }
