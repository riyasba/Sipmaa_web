// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:simpa/constands/constands.dart';
// import 'package:simpa/view/home_page.dart';
// import 'package:simpa/view/profile_page.dart';

// import '../view/friends.dart';
// import '../view/notification_screen.dart';

// class BottomNavigationBarExample extends StatefulWidget {
//   int index;
//   BottomNavigationBarExample({this.index = 0});
//   @override
//   _BottomNavigationBarExampleState createState() =>
//       _BottomNavigationBarExampleState();
// }

// class _BottomNavigationBarExampleState
//     extends State<BottomNavigationBarExample> {
//   int _currentIndex = 0;

//   // List of pages to be displayed in the bottom navigation bar
//   final List<Widget> _pages = [
//     Homepage(), // Replace with your own widget
//     Friends_screen(), // Replace with your own widget
//     Notificaton_screen(),

//     ProfilePage(), // Replace with your own widget
//   ];

//   @override
//   void initState() {
//     super.initState();
//     setValues();
//   }

//   setValues() {
//     setState(() {
//       _currentIndex = widget.index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         fixedColor: kblue,
//         // unselectedLabelStyle: TextStyle(color: kgrey),
//         currentIndex: _currentIndex,
//         onTap: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset('assets/images/home.svg'),
//             icon: SvgPicture.asset('assets/images/a.svg'),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             activeIcon: SvgPicture.asset('assets/images/friends_selected.svg'),
//             icon: SvgPicture.asset('assets/images/frinds_unselected.svg'),
//             label: 'Friends',
//           ),
//           BottomNavigationBarItem(
//             activeIcon:
//                 SvgPicture.asset('assets/images/notification_selected.svg'),
//             icon: SvgPicture.asset('assets/images/notification_unselected.svg'),
//             label: 'Notification',
//           ),
//           BottomNavigationBarItem(
//             activeIcon:
//                 SvgPicture.asset('assets/images/profilecircle_selected.svg'),
//             icon: SvgPicture.asset('assets/images/profilecircle_unslct.svg'),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Replace these PageOne, PageTwo, PageThree widgets with your own widgets
// class PageOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Page One').animate().fade().scale(),
//     );
//   }
// }





// // class Pagefour extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text('Page four')
// //     );
// //   }
// // }
