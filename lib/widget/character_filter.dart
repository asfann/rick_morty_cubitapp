
import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';

class CharacterFilter extends StatefulWidget {
  const CharacterFilter({Key? key}) : super(key: key);

  @override
  State<CharacterFilter> createState() => _CharacterFilterState();
}

class _CharacterFilterState extends State<CharacterFilter> {
  String dropdownSpecies = 'Species';
  String dropdownGender = 'Gender';
  String dropdownStatus = 'Status';

  var speciesItems = ['Species', 'Human', 'Alien'];
  var genderItems = ['Gender', 'Male', 'Female', 'Genderless', 'Unknown'];
  var statusItems = ['Status', 'Alive', 'Dead', 'Unknown'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          height: 330,
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
                value: dropdownSpecies,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: speciesItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownSpecies = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: dropdownGender,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: genderItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownGender = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: dropdownStatus,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: statusItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownStatus = newValue!;
                  });
                },
              ),
              AdvancedButton(
                  show: true,
                  text: 'APPLY',
                  onPressed: () {
                    Map<String, dynamic> popResults = {};
                    if (dropdownSpecies != 'Species') {
                      popResults['species'] = dropdownSpecies;
                    }
                    if (dropdownGender != 'Gender') {
                      popResults['gender'] = dropdownGender;
                    }
                    if (dropdownStatus != 'Status') {
                      popResults['status'] = dropdownStatus;
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
