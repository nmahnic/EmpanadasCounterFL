
import 'dart:developer';
import 'dart:io';

import 'package:fl_empanadas_counter/theme/app_theme.dart';
import 'package:fl_empanadas_counter/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _textFieldController = TextEditingController();
  Map<String, int> options = {'Carne': 1 , 'Jamon y queso': 1};

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cree una orden'),
        elevation: 5,
        backgroundColor: AppTheme.primaryColor
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) => Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              EmpanadaTitle( title: options.keys.elementAt(index)),
              const Expanded(child: SizedBox()),
              RoundedIconButton(
                icon: Icons.remove,
                iconSize: 30, 
                onPress: () { 
                  log("RoundedIconButton REMOVE"); 
                  options[options.keys.elementAt(index)] = options.values.elementAt(index) - 1;
                  setState((){ });
                },
              ),
              EmpanadaTitle(title: options.values.elementAt(index).toString()),
              RoundedIconButton(
                icon: Icons.add,
                iconSize: 30, 
                onPress: () { 
                  log("RoundedIconButton ADD"); 
                  options[options.keys.elementAt(index)] = options.values.elementAt(index) + 1;
                  setState((){ });
                  },
              ),
            ],
          ),
        ), 
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        onPressed: () async {
          String? resultLabel;
          if(Platform.isAndroid) {
            resultLabel = await showCustomDialogAndroid(context);
          } else {
            resultLabel = await showCustomDialogIOS(context);
          }
          if (resultLabel != null) {
            log("$resultLabel");
            _textFieldController.clear();
            setState(()  {
              options[resultLabel!] = 1;
              log("$options");
            } );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<String?> showCustomDialogAndroid(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)
          ),
          title: const Text("Titulo"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Este es el contenido de la alerta'),
              const SizedBox(height: 10),
              Material(
              child: TextField(
                onChanged: (value) => { log( value ) },
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Empanada"),
              ),
            ),
            ]
          ),
          actions: [
            TextButton(
              onPressed: () => { Navigator.pop(context) },
              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, _textFieldController.text) ,
              child: const Text('Continuar'),
            )
          ],
        );
      }
    );
  }

  Future<String?> showCustomDialogIOS( BuildContext context) async {
    return showCupertinoDialog(
      context: context, 
      builder: (context) => CupertinoAlertDialog(
        title: const Text("Titulo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Este es el contenido de la alerta'),
            const SizedBox(height: 10),
            Material(
              child: TextField(
                onChanged: (value) => { log( value ) },
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: "Empanada"),
              ),
            ),
          ],
        ),
        actions: [
            TextButton(
              onPressed: () => { Navigator.pop(context) },
              child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, _textFieldController.text) ,
              child: const Text('Continuar'),
            )
          ],
      )
    );
  }

}
