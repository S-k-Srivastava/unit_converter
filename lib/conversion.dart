import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';

class Conversion extends StatefulWidget {
  final int unit;
  final List<DropdownMenuItem<dynamic>> units;
  const Conversion({super.key, required this.unit, required this.units});

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  double output = 0.0;
  double input = 0.0;
  dynamic inputUnit;
  dynamic outputUnit;

  void convert(double val) {
    if (inputUnit == null || outputUnit == null || val == 0.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select units'),
        ),
      );
      return;
    }
    if (widget.unit == 0) {
      var d = Length()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 1) {
      var d = Area()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 2) {
      var d = Volume()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 3) {
      var d = Mass()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 4) {
      var d = Temperature()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 5) {
      var d = Pressure()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    } else if (widget.unit == 6) {
      var d = Time()..convert(inputUnit, val);
      output = d.getUnit(outputUnit).value!;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Conversion',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10000),
              ),
              elevation: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10000),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      output.toStringAsFixed(5).toString().replaceAll(
                          RegExp(r"(\.0+|(?<=\.\d+)(?<!\d+))$"), ""),
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: DropdownButtonFormField<dynamic>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Unit',
                ),
                // value: /,
                onChanged: (value) {
                  inputUnit = value;
                  convert(input);
                },
                items: widget.units,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input',
                ),
                onChanged: (value) {
                  convert(double.parse(value));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: DropdownButtonFormField<dynamic>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Output Unit',
                ),
                onChanged: (value) {
                  outputUnit = value;
                  convert(input);
                },
                items: widget.units,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
