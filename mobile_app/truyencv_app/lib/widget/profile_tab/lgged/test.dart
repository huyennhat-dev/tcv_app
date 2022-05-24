// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'globals.dart';
// import 'dart:convert' show utf8;

// import 'package:local_auth/local_auth.dart';

// class SystemsSettingsPage extends StatefulWidget {

//   final int index;
//   SystemsSettingsPage({ required this.index});

//   @override
//   _SystemsSettingsPage createState() => _SystemsSettingsPage();

// }

// class _SystemsSettingsPage extends State<SystemsSettingsPage> {

//   bool tileValTemp = false;
//   bool tileValDetect = false;
//   bool tileValCamOff = false;
//   bool tileValSystem = false;
//   bool connected = false;

//   int successCount = 0;
//   String successPrompt = "";


//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: Colors.blueAccent,
//           title: Text("Base Station Settings"),
//         ),
//         body: Column(
//           children: <Widget> [
//             SwitchListTile(value: tileValDetect,
//                 onChanged: (bool val){ setState(() {
//                   tileValDetect = val;
//                 });},
//                 title: Text('Detection notifications', style: TextStyle(color: Colors.white))
//             ),
//             SwitchListTile(value: tileValTemp,
//                 onChanged: (bool val){ setState(() {
//                   tileValTemp = val;
//                 });},
//                 title: Text('Temperature threshold out of range', style: TextStyle(color: Colors.white))
//             ),
//             TextButton(
//               child: const Text("save", style: TextStyle(fontSize: 20.0)),
//               style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                 padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10.0)),
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent)),
//                 onPressed: () {

//                   //successPrompt = "Loading.. Wait 5 seconds to update.";
//                   successCount = 0;

//                   Socket.connect(baseStationAddresses[0], baseStationPort,timeout: Duration(seconds: 5)).then(
//                     (socket) {
//                       print('Connected to: '
//                           '${socket.remoteAddress.address}:${socket
//                           .remotePort}');

//                       String command = "SETSYSTEM," + baseStationNames[0] + ",detectMotion," + "$tileValDetect";
//                       socket.write(command);

//                       socket.listen((data) {

//                         String socketData = utf8.decode(data);

//                         if(socketData == "REQUEST_CONFIRMED") {
//                           successCount += 1;
//                         }
//                       },
//                         onDone: () {
//                           socket.destroy();
//                         },

//                       );
//                     },
//                   ).catchError((onError) {
//                     print("here 1");
//                     successPrompt = "There was a problem. Please retry.";

//                   });

//                   Socket.connect(baseStationAddresses[0], baseStationPort,timeout: Duration(seconds: 5)).then(
//                           (socket) {
//                         print('Connected to: '
//                             '${socket.remoteAddress.address}:${socket
//                             .remotePort}');

//                         String command = "SETSYSTEM," + baseStationNames[0] + ",tempThreshold," + "$tileValTemp";
//                         socket.write(command);

//                         socket.listen((data) {
//                           String socketData = utf8.decode(data);

//                           if(socketData == "REQUEST_CONFIRMED") {
//                             successCount += 1;
//                           }
//                         },
//                           onDone: () {
//                             print("SuccessCount $successCount");

//                             if(successCount == 2)
//                             {
//                               print("here 2");
//                               successPrompt = "Setting successfully saved.";
//                             }
//                             else
//                             {
//                               print("here 3");
//                               successPrompt = "Couldn't save, please retry.";
//                             }

//                             socket.destroy();
//                           },
//                         );
//                       }
//                   ).catchError((onError) {
//                     print("here 4");
//                     successPrompt = "There was a problem. Please retry.";

//                   });

//                   showDialog(context: context, builder: (context) =>
//                       AlertDialog(
//                         title: Text("Save results"),
//                         content: Text(successPrompt),
//                         actions: <Widget>[
//                           TextButton(onPressed: () => Navigator.pop(context),
//                             child: const Text("OK"),
//                           )
//                         ]
//                     )
//                   );

//                   /*
//                   FutureBuilder<String>(
//                     future: getSaveStatus(),
//                     builder: (context, snapshot) {
//                       String nonNullableString = snapshot.data ?? 'Error';
//                       if(snapshot.hasData) {
//                         return AlertDialog(
//                           title: Text("Save results"),
//                           content: Text(nonNullableString),
//                           actions: <Widget>[
//                             TextButton(onPressed: () => Navigator.pop(context),
//                               child: const Text("OK"),
//                             )
//                           ]
//                         );
//                       }
//                       return Center(child: CircularProgressIndicator());
//                     },
//                   );*/
//                 }
//               ),
//             Center(
//               child:ClipRRect(
//                 borderRadius: BorderRadius.circular(4),
//                 child: Stack(
//                   children: <Widget>[
//                     Positioned.fill(
//                       child: Container(
//                         decoration: const BoxDecoration(
//                           color: Colors.red,
//                         ),
//                       ),
//                     ),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         padding: const EdgeInsets.all(16.0),
//                         primary: Colors.white,
//                         textStyle: const TextStyle(fontSize: 20),
//                       ),
//                       onPressed: () {},
//                       child: const Text('Remove System'),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         )
//     );
//   }

//   Future<String> getSaveStatus() async {

//     return await new Future(() => successPrompt);
//   }

// }