import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

String personas = "";
int valor = 0;

class _MyHomePageState extends State<MyHomePage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de Personas"),
        elevation: 10,
        centerTitle: true,
      ),
      drawer: MenuLateral(),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$contador",
                    style: TextStyle(fontSize: 100, color: Colors.white)),
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          contador++;
                          setState(() {});
                        },
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 100),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          contador--;
                          contador < 0 ? contador = 0 : setState(() {});
                        },
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 100),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text("Personas permitidas $personas",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                (contador == valor) || (contador > valor)
                    ? AlertDialog(
                        actions: [
                          Text(
                            "Atencion! Llego al limite de personas",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                        backgroundColor: Colors.redAccent,
                      )
                    : Text(""),
                ElevatedButton(
                    onPressed: () {
                      contador = 0;
                      setState(() {});
                    },
                    child: Text("Reiniciar contador"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController numerodepersonas = TextEditingController();

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          Text("Cantidad de personas permitidas:"),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: numerodepersonas,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "ingrese numero"),
            keyboardType: TextInputType.number,
            onChanged: (texto) {
              personas = texto;
              convertidor(personas);
              print(valor);
            },
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}

convertidor(String personas) {
  valor = int.tryParse(personas);
}
