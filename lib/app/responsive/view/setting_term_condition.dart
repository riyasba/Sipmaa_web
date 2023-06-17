import 'package:flutter/material.dart';
import 'package:reg_login/app/data/components/constands/constands.dart';

class SettingTermConditionPage extends StatefulWidget {
  const SettingTermConditionPage({super.key});

  @override
  State<SettingTermConditionPage> createState() =>
      _SettingTermConditionPageState();
}

class _SettingTermConditionPageState extends State<SettingTermConditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kblue,
        title: Text('Terms & Condition'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Euismod elementum nisi quis eleifend quam adipiscing vitae proin sagittis. Sit amet mauris commodo quis. Netus et malesuada fames ac. Quis hendrerit dolor magna eget est lorem ipsum dolor sit. Scelerisque purus semper eget duis at. Est placerat in egestas erat imperdiet sed euismod nisi. Eget sit amet tellus cras adipiscing enim. Quis commodo odio aenean sed adipiscing diam. Sed elementum tempus egestas sed sed risus pretium quam vulputate. Bibendum neque egestas congue quisque. A pellentesque sit amet porttitor eget dolor morbi. In hendrerit gravida rutrum quisque. Sed vulputate odio ut enim.'),
            Text(
                ' Egestas quis ipsum suspendisse ultrices gravida dictum. Consectetur adipiscing elit duis tristique sollicitudin. Nisl vel pretium lectus quam id. Laoreet non curabitur gravida arcu ac tortor dignissim convallis. Etiam tempor orci eu lobortis elementum. Elit at imperdiet dui accumsan. Cursus sit amet dictum sit amet justo donec. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Lorem dolor sed viverra ipsum nunc. Quam nulla porttitor massa id neque aliquam vestibulum morbi blandit. Mattis molestie a iaculis at erat. Enim eu turpis egestas pretium aenean pharetra magna ac. Scelerisque eleifend donec pretium vulputate. Proin fermentum leo vel orci porta non pulvinar neque laoreet. At augue eget arcu dictum varius duis. Odio pellentesque diam volutpat commodo. Nec tincidunt praesent semper feugiat. Quis eleifend ')
          ],
        ),
      )),
    );
  }
}
