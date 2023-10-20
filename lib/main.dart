import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text Carlos Farres Lozano - S2AM ',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text Carlos Farres Lozano S2AM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    
    //4 BOTONES CON SUS FUNCIONES DE CADA TIPO DE DIALOG
    //Showmodalbutton
    children: [
      FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(myController.text),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Tancar BottomSheet'),
                          )
                        ],
                      ),
                    ));
              });
        },
        tooltip: 'Mostra el valor!',
        backgroundColor: const Color.fromRGBO(246, 10, 10, 0.612),
        child: const Icon(Icons.text_fields),
      ),


      //SimpleDialog
      const SizedBox(height: 16), // Espacio entre los botones
      FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
                title: const Text('SimpleDialog Carlos Farres'),
              );
          },
          );
        },
        tooltip: 'Botón 2',
        backgroundColor: Colors.blue, // Color del segundo botón
        child: const Icon(Icons.add), // Icono del segundo botón
      ),


      //AlertDialog
      const SizedBox(height: 16), // Espacio entre los botones
      FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: const Text('SimpleDialog + botoncerrar Carlos Farres'),
                content: Text(myController.text),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                    )
                ],
              );
          },
          );
        },
        tooltip: 'Botón 3',
        backgroundColor: const Color.fromARGB(255, 7, 244, 30), // Color del segundo botón
        child: const Icon(Icons.add), // Icono del segundo botón
      ),


      //SnaCKbAR
      const SizedBox(height: 16), // Espacio entre los botones
      FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Prueba snackbar CFL'),
              duration: Duration(seconds: 2),
              ),
          );
        },
        tooltip: 'Botón 4',
        backgroundColor: Color.fromARGB(255, 255, 255, 0), // Color del segundo botón
        child: const Icon(Icons.add), // Icono del segundo botón
      ),
      ],
      ),
    );
  }
}