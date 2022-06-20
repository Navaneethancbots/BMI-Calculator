import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Sql/User.dart';

import 'UserService.dart';

class ViewUser extends StatefulWidget {

  late  List<User> userList;
  final _userService = UserService();

  final User user;
  ViewUser({Key? key, required this.user}) : super(key: key);

  @override
  _ViewUserState createState() => _ViewUserState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History',),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(

            children: [
              Text(
                'Full Details',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 114,
                  ),
                  Text(
                    widget.user.Name.toString().capitalize(),
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 107,
                  ),
                  Text(
                    widget.user.Gender.toString().toUpperCase(),
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Height',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 109,
                  ),
                  Text(
                    "${widget.user.Height} cm",
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Weight',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 108,
                  ),
                  Text(
                    "${widget.user.Weight} Kg",
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Age',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 131,
                  ),
                  Text(
                    widget.user.Age ?? '',
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'BMI ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 127,
                  ),
                  Text(
                    widget.user.Result ?? '',
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'You\'re',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 118,
                  ),
                  Text(
                    widget.user.Interpretation ?? '',
                    style: TextStyle(color: Colors.white,
                        fontSize:16),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Text(
              //         'Interpretation',
              //         style: TextStyle(
              //             fontWeight: FontWeight.w600,
              //             color: Colors.teal,
              //             fontSize: 16),
              //       ),
              //     ),
              //     Expanded(
              //       child: Text(
              //         widget.user.Value ?? '',
              //         style: TextStyle(color: Colors.white,
              //             fontSize:16),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
