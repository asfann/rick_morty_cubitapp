
import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';

class PlanetFilter extends StatefulWidget {
  const PlanetFilter({Key? key}) : super(key: key);

  @override
  State<PlanetFilter> createState() => _PlanetFilterState();
}

class _PlanetFilterState extends State<PlanetFilter> {
  String dropdownType = 'Type';
  String dropdownDimension = 'Dimension';

  var typeItems = ['Type', 'Planet', 'Resort'];
  var dimensionItems = ['Dimension', 'Dimension C-137', 'unknown', 'Replacement Dimension', 'Dimension 5-126'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          height: 270,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)))
              ]),
              DropdownButton(
                value: dropdownType,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: typeItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownType = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: dropdownDimension,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: dimensionItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownDimension = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AdvancedButton(
                  show: true,
                  text: 'APPLY',
                  onPressed: () {
                    Map<String, dynamic> popResults = {};
                    if (dropdownType != 'Type') {
                      popResults['type'] = dropdownType;
                    }
                    if (dropdownDimension != 'Dimension') {
                      popResults['dimension'] = dropdownDimension;
                    }
                    Navigator.pop(context, popResults);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

