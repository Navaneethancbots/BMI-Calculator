import 'package:bmi_calculator/screens/imputpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'User.dart';
import 'UserService.dart';
import 'ViewUser.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<User> userList = [];
  final _userService = UserService();

  getAllUserDetails()async {
    var users = await _userService.readAllUsers();
    userList = <User>[];

    users.forEach((user) {

      print("timestamp ${user['Timestamp']}");

      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.Name = user['Name'];
        userModel.Gender = user['Gender'];
        userModel.Height = user['Height'];
        userModel.Weight = user['Weight'];
        userModel.Age = user['Age'];
        userModel.Result = user['Result'];
        userModel.Value= user['Value'];
        userModel.Interpretation = user['Interpretation'];
        userModel.Timestamp = user['Timestamp'];
        userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteAllFormDialog(BuildContext context) async{
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        title: Text('Are You Sure to Delete',style: TextStyle(color: Colors.teal,fontSize: 20),),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red
              ),
              onPressed: ()  {

                setState(()  {
                  var result=  _userService.truncateTable();
                  userList = [];
                  _showSuccessSnackBar('User Details Deleted Success');
                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> InputPage()));
                   Navigator.of(context, rootNavigator: true).pop(result);
                });


              }, child: const Text('Delete')),
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal
              ),
              onPressed: (){
                Navigator.pop(context);
              }, child: const Text('close')),
        ],
      );
    });
  }

  _deleteFormDialog(BuildContext context,userId){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        title: Text('Are You Sure to Delete',style: TextStyle(color: Colors.teal,fontSize: 20),),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.red
              ),
              onPressed: ()async{
                var result= await _userService.deleteUser(userId);
                if (result != null) {
                  getAllUserDetails();
                  _showSuccessSnackBar('User Details Deleted Success');
                  Navigator.pop(context);
                }
              }, child: const Text('Delete')),
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal
              ),
              onPressed: (){
                Navigator.pop(context);
              }, child: const Text('close')),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('SQL'),
        actions: [
          IconButton(onPressed: (){
              _deleteAllFormDialog(context);
          }, icon: Icon(Icons.delete)),
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewUser(
                          user: userList[index],
                        )));
              },
              // leading: Icon(Icons.person),
              title: Text(userList[index].Name ?? ''),
              subtitle: Text(DateFormat().format(DateTime.parse(userList[index].Timestamp.toString()))),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      _deleteFormDialog(context,userList[index].id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}