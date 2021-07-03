import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = context.watch<NameCubit>().state;

    // BlocBuilder<NameCubit, String>(builder:(context, state) {

    // },);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change name",
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: _nameController.text),
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text("change"),
                onPressed: () {
                  final name = _nameController.text;
                  context.read<NameCubit>().change(name);
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
