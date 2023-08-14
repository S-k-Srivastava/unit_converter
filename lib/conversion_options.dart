import 'package:flutter/material.dart';
import 'package:UnitEx/conversion.dart';
import 'package:UnitEx/units.dart';
import 'package:units_converter/units_converter.dart';

class MySquareButton extends StatefulWidget {
  final int unit;
  final String unitName;
  final IconData icon;
  const MySquareButton({
    super.key,
    required this.unit,
    required this.unitName,
    required this.icon,
  });

  @override
  State<MySquareButton> createState() => _MySquareButtonState();
}

class _MySquareButtonState extends State<MySquareButton> {
  List<DropdownMenuItem<dynamic>> units = [];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.unit == length) {
          List<Unit> length = Length().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == area) {
          List<Unit> length = Area().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == volume) {
          List<Unit> length = Volume().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").isNotEmpty
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == mass) {
          List<Unit> length = Mass().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == time) {
          List<Unit> length = Time().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == pressure) {
          List<Unit> length = Pressure().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        } else if (widget.unit == temperature) {
          List<Unit> length = Temperature().getAll();
          for (var i = 0; i < length.length; i++) {
            units.add(
              DropdownMenuItem(
                value: length[i].name,
                child: Text(length[i].name.toString().split(".").length > 1
                    ? length[i].name.toString().split(".")[1]
                    : length[i].name.toString()),
              ),
            );
          }
        }

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => Conversion(
              unit: widget.unit,
              units: units,
            ),
          ),
        );
      },
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3333333333333333,
          height: MediaQuery.of(context).size.width * 0.3333333333333333,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon),
              const SizedBox(
                height: 5,
              ),
              Text(widget.unitName),
            ],
          ),
        ),
      ),
    );
  }
}

class ConversionOptions extends StatefulWidget {
  const ConversionOptions({super.key});

  @override
  State<ConversionOptions> createState() => _ConversionOptionsState();
}

class _ConversionOptionsState extends State<ConversionOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'UnitEx',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          MySquareButton(
              unit: length, unitName: "Length", icon: Icons.space_bar),
          MySquareButton(
              unit: area, unitName: "Area", icon: Icons.landslide_rounded),
          MySquareButton(unit: volume, unitName: "Volume", icon: Icons.volcano),
          MySquareButton(
              unit: mass, unitName: "Mass", icon: Icons.monitor_weight),
          MySquareButton(
              unit: time, unitName: "Time", icon: Icons.timer_rounded),
          MySquareButton(
              unit: pressure, unitName: "Pressure", icon: Icons.speed),
          MySquareButton(
              unit: temperature,
              unitName: "Temperature",
              icon: Icons.thermostat),
        ],
      ),
    );
  }
}
