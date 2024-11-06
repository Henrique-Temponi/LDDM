import 'package:flutter/material.dart';

class MetasForm extends StatefulWidget {
  const MetasForm(
      {super.key,
      required this.nomeController,
      required this.descriController,
      required this.dataController,
      required this.editText,
      this.currentName,
      this.currentDescri,
      this.currentDate});

  final TextEditingController nomeController;
  final TextEditingController descriController;
  final TextEditingController dataController;
  final String editText;
  final String? currentName;
  final String? currentDescri;
  final String? currentDate;

  @override
  State<MetasForm> createState() => _MetasFormState();
}

class _MetasFormState extends State<MetasForm> {
  DateTime selectedDate = DateTime.now();

  void setTimeDate() {
    if (widget.currentDate != "") {
      List<String> date = widget.currentDate!.split("/");
      selectedDate =
          DateTime(int.parse(date[2]), int.parse(date[1]), int.parse(date[0]));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(selectedDate.toString());
        widget.dataController.text = "";
        widget.dataController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        print(widget.dataController.text);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.nomeController.text = widget.currentName!;
    widget.descriController.text = widget.currentDescri!;
    widget.dataController.text = widget.currentDate!;
    setTimeDate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(widget.editText,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          // child: widget.editText,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.nomeController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Nome da meta"),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: widget.descriController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Descricao"),
            )),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: TextField(
                          controller: widget.dataController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Data"))),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () => {_selectDate(context)},
                      icon: const Icon(Icons.calendar_month))
                ])),
      ],
    );
  }
}
