// Future<void> _showMyDialog(BuildContext context) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.red.withOpacity(0),
//         title: PupUpLoading(),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children: <Widget>[
//               Text(
//                 'MenuBar Color',
//                 style: TextStyle(
//                     fontSize: 14
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuColorR,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.menuColorR=e;
//                           });
//                         },
//                         style: TextStyle(
//                           fontSize: this.height*5,
//                           height: 1.0,
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Red",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuColorG,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         onChanged: (e){
//                           setState(() {
//                             this.menuColorG=e;
//                           });
//                         },
//                         decoration: InputDecoration(
//
//                           labelText: "Green",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuColorB,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.menuColorB=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Blue",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 'Menu Text Color',
//                 style: TextStyle(
//                     fontSize: 14
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuTextColorR,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.menuTextColorR=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Red",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuTextColorG,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.menuTextColorG=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Green",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.menuTextColorB,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.menuTextColorB=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Blue",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Text(
//                 'Active Menu Text Color',
//                 style: TextStyle(
//                     fontSize: 14
//                 ),
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.activeTextColorR,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.activeTextColorR=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Red",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.activeTextColorG,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.activeTextColorG=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//                           labelText: "Green",
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                     ),
//                   ),
//                   Expanded(
//                     flex: 8,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical:this.height*0.1),
//                       child: TextFormField(
//                         initialValue: this.activeTextColorB,
//                         keyboardType: TextInputType.number,
//                         maxLength: 3,
//                         onChanged: (e){
//                           setState(() {
//                             this.activeTextColorB=e;
//                           });
//                         },
//                         style: TextStyle(
//                             fontSize: this.height*5,
//                             height: 1.0,
//                             color: Colors.black
//                         ),
//                         decoration: InputDecoration(
//
//                           labelText: "Blue",
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Change'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               context.read<AllData>().setMenuColor(this.menuColorR, this.menuColorG, this.menuColorB);
//               context.read<AllData>().setMenuTextColor(this.menuTextColorR, this.menuTextColorG, this.menuTextColorB);
//               context.read<AllData>().setActiveMenuColor(this.activeTextColorR, this.activeTextColorG, this.activeTextColorB);
//             },
//           ),
//           TextButton(
//             child: Text('Reset'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 this.menuColorR = "2";
//                 this.menuColorG = "43";
//                 this.menuColorB = "255";
//                 this.menuTextColorR = "255";
//                 this.menuTextColorG = "255";
//                 this.menuTextColorB = "255";
//                 this.activeTextColorR = "255";
//                 this.activeTextColorG = "255";
//                 this.activeTextColorB = "0";
//               });
//               context.read<AllData>().resetColor();
//             },
//           ),
//           TextButton(
//             child: Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               print("nth");
//             },
//           ),
//         ],
//       );
//     },
//   );
// }