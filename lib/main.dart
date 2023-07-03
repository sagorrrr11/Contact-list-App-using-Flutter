import 'package:flutter/material.dart';

void main() {
  runApp(ContactApp());
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}

class ContactApp extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phoneNumber: '1234567890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      phoneNumber: '9876543210',
    ),
    Contact(
      name: 'Alex Johnson',
      email: 'alexjohnson@example.com',
      phoneNumber: '5555555555',
    ),
  ];

  ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Contact List'),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(contacts[index].name),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ContactDetailsSheet(contact: contacts[index]);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ContactDetailsSheet extends StatelessWidget {
  final Contact contact;

  const ContactDetailsSheet({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Text('Name: ${contact.name}'),
              const SizedBox(height: 8.0),
              Text('Email: ${contact.email}'),
              const SizedBox(height: 8.0),
              Text('Phone Number: ${contact.phoneNumber}'),
            ],
          ),
        ),
      ),
    );
  }
}
