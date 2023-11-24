import 'package:flutter/material.dart';
import 'package:safepay/fitness_app_theme.dart';

class TransactionFormView extends StatefulWidget {
  const TransactionFormView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionFormViewState createState() => _TransactionFormViewState();
}

class _TransactionFormViewState extends State<TransactionFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _numberController;
  late TextEditingController _amountController;
  late TextEditingController _reasonController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    _amountController = TextEditingController();
    _reasonController = TextEditingController();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _amountController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: Text(
              "Numéro",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w500,
                // fontSize: 16,
                letterSpacing: 0.5,
                color: FitnessAppTheme.lightText,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  color: FitnessAppTheme.background,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(23.0),
                  child: Text(
                    "+242",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  cursorColor: FitnessAppTheme.nearlyDarkBlue,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un montant valide';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: Text(
              "Montant de la transaction",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w500,
                // fontSize: 16,
                letterSpacing: 0.5,
                color: FitnessAppTheme.lightText,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(12.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  color: FitnessAppTheme.background,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(23.0),
                  child: Text(
                    "XAF",
                    style: TextStyle(
                      fontFamily: FitnessAppTheme.fontName,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  cursorColor: FitnessAppTheme.nearlyDarkBlue,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(12.0),
                      ),
                      borderSide: BorderSide(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrez un montant valide';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: Text(
              "Raison de la transaction",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: FitnessAppTheme.fontName,
                fontWeight: FontWeight.w500,
                // fontSize: 16,
                letterSpacing: 0.5,
                color: FitnessAppTheme.lightText,
              ),
            ),
          ),
          TextFormField(
            controller: _reasonController,
            maxLines: 5,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              // labelText: 'Raison de la transaction',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16,
              ),
              labelStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: FitnessAppTheme.nearlyDarkBlue,
                  width: 2.0,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisissez la raison de la transaction';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Ajustez le radius ici
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0), // Ajustez ici le padding interne du bouton
              backgroundColor: FitnessAppTheme.nearlyDarkBlue,
              elevation: 8.0,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final number = _numberController.text;
                final amount = _amountController.text;
                final reason = _reasonController.text;

                // Utilisez ces données où vous en avez besoin
                print('Numéro: $number');
                print('Montant: $amount');
                print('Raison: $reason');
              }
            },
            child: const Text(
              'Continuer',
              style: TextStyle(
                color: FitnessAppTheme.nearlyWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
