import 'package:flutter/material.dart';

class IMCCalculatorScreen extends StatefulWidget {
  @override
  _IMCCalculatorScreenState createState() => _IMCCalculatorScreenState();
}

class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String result = '';

  void calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null) {
      double bmi = weight / (height * height);
      String category = '';

      if (bmi < 18.5) {
        category = 'Sous-poids';
      } else if (bmi < 25) {
        category = 'Poids normal';
      } else if (bmi < 30) {
        category = 'Surpoids';
      } else {
        category = 'Obésité';
      }
      setState(() {
        result =
            'Votre IMC est ${bmi.toStringAsFixed(2)}\n Categorie: $category';
      });
    } else {
      setState(() {
        result = 'Veuillez entrer des valeurs valides ex: 1.5';
      });
    }
  }

  void resetFields() {
    setState(() {
      heightController.text = '';
      weightController.text = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    labelText: 'Taille (m)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    labelText: 'Poids (kg)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: resetFields,
                  child: Text('réinitialiser'),
                ),
                SizedBox(height: 16.0),
                Text(
                  result,
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: Text('Calculer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
