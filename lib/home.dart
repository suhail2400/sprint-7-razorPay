import 'package:compare/payment.dart';
import 'package:compare/user.dart';
import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
  const Compare({super.key});

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  final user1 = const User(
      phoneNumber: '5487963214',
      userName: 'Rahul',
      userImage:
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60');
  final user2 = const User(
      phoneNumber: '6487963214',
      userName: 'Rahul',
      userImage:
          'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60');

  compareUser(BuildContext context) {
    if (user1 == user2) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('They are equal')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('They are not equal')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Equatable Example')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            userWidget(
              name: user1.userName,
              phoneNo: user1.phoneNumber,
              image: user1.userImage,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                compareUser(context);
              },
              child: const Text("Compare"),
            ),
            userWidget(
              phoneNo: user2.phoneNumber,
              name: user2.userName,
              image: user2.userImage,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentPage()));
          },
          child: Icon(Icons.person)),
    );
  }

  userWidget({
    required phoneNo,
    required name,
    required image,
  }) {
    return Column(
      children: [
        Image.network(
          image,
          width: 200,
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          phoneNo,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
