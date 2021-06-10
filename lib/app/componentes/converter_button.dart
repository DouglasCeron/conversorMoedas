import 'package:conversor_app/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class ConverterButton extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;

  const ConverterButton({
    Key key,
    this.items,
    this.controller,
    this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            SizedBox(
              height: 15,
            ),
            DropdownButton<CurrencyModel>(
              value: selectedItem,
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              hint: Text('Moeda'),
              items: items
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e.name,
                      )))
                  .toList(),
              onChanged: onChanged,
            ),
          ],
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.amber,
              )),
              hintText: 'Valor Atual',
            ),
          ),
        )
      ],
    );
  }
}
