// ignore_for_file: unused_result

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harpoon_events_app/controller/event_provider.dart';
import 'package:harpoon_events_app/controller/services/auth_services.dart';
import 'package:harpoon_events_app/controller/services/event_services.dart';
import 'package:harpoon_events_app/view/widgets/snack_bar.dart';
import 'package:intl/intl.dart';

import '../../util/color_lib.dart';
// import '../../util/fonts.dart';
// import '../widgets/stroke_text.dart';

final createEventLoader = StateProvider((ref) => false);

class CreateEventPage extends ConsumerStatefulWidget {
  const CreateEventPage({super.key});

  @override
  ConsumerState<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  final _form = GlobalKey<FormState>();
  // To convert DateTime to String
  // startDate
  // .toUtc()
  // .toIso8601String()
  // .replaceAll(r'T', ' ')
  // .split('.')[0]

  // To convert String to DateTime: using intl package
  // DateTime tempDate = new DateFormat("yyyy-MM-dd hh:mm:ss").parse("2023-08-10 08:32:05);

  String title = "";
  String description = "";
  String location = "Add Location";
  String groups = "";

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController groupsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(getUserDataProvider);
    return Scaffold(
      backgroundColor: ColorLib.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Event Name',
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 63,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5FAFF),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: titleController,
                        maxLines: 2,
                        autocorrect: true,
                        decoration: const InputDecoration(
                          hintText: 'Type Event Name',
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Missing Field";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            title = titleController.text;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'Event Description',
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 173,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF5FAFF),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Missing Field";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Type event description',
                        border: InputBorder.none,
                      ),
                      autocorrect: true,
                      maxLines: 20,
                      onChanged: (value) {
                        setState(() {
                          description = descriptionController.text;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'When would the event start?',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    DropdownCell(
                      selectedDate: startDate,
                      onDateChanged: (date) => setState(() => startDate = date),
                    ),
                    const SizedBox(width: 24),
                    DropdownCell(
                      selectedTime: startTime,
                      onTimeChanged: (time) => setState(() => startTime = time),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'When would the event end?',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    DropdownCell(
                      selectedDate: endDate,
                      onDateChanged: (date) => setState(() => endDate = date),
                    ),
                    const SizedBox(width: 24),
                    DropdownCell(
                      selectedTime: endTime,
                      onTimeChanged: (time) => setState(() => endTime = time),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('Type in your location'),
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: TextFormField(
                                controller: locationController,
                                decoration: const InputDecoration(
                                  hintText: 'Input your location',
                                  border: InputBorder.none,
                                ),
                                autocorrect: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                setState(() {
                                  location = locationController.text;
                                });

                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ColorLib.lightBrown,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const CustomText(
                                  text: 'Save',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 20.0,
                              color: Color.fromRGBO(195, 155, 233, 1), // Set the color
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Tropiline',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                          letterSpacing: 0.16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text(
                            'Enter the group(s) the event belongs to',
                            textAlign: TextAlign.center,
                          ),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 10,
                                runAlignment: WrapAlignment.spaceAround,
                                children: "Group1,Group2, Group 3, Group 4"
                                    .split(',')
                                    .map(
                                      (e) => Chip(
                                        label: Text(e.trim()),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              decoration: ShapeDecoration(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 2,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: TextFormField(
                                controller: groupsController,
                                decoration: const InputDecoration(
                                  hintText: 'Input the groups you want to create the event in',
                                  border: InputBorder.none,
                                ),
                                autocorrect: true,
                                minLines: 2,
                                maxLines: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                setState(() {
                                  groups = groupsController.text;
                                });

                                Navigator.of(context).pop();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ColorLib.lightBrown,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const CustomText(
                                  text: 'Save',
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Stack(
                          children: [
                            Icon(
                              Icons.group,
                              size: 20.0,
                              color: Color.fromRGBO(195, 155, 233, 1), // Set the color
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 2),
                      groups.isEmpty
                          ? const Text(
                              'Select Groups',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Tropiline',
                                fontWeight: FontWeight.w700,
                                height: 0.09,
                                letterSpacing: 0.16,
                              ),
                            )
                          : Wrap(
                              direction: Axis.horizontal,
                              spacing: 10,
                              children: groups
                                  .split(',')
                                  .map(
                                    (e) => Chip(
                                      label: Text(e.trim()),
                                    ),
                                  )
                                  .toList(),
                            ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Consumer(builder: (context, ref, child) {
                  final loading = ref.watch(createEventLoader);
                  ref.listen(createEventResponse, (previous, next) {
                    if (next!.status == "success") {
                      ref.read(createEventLoader.notifier).state = false;
                      
                      titleController.clear();
                      descriptionController.clear();
                      startDate = DateTime.now();
                      endDate = DateTime.now();
                      startTime = DateTime.now();
                      endTime = DateTime.now();

                      snackBar(
                        content: "Event created successfully",
                        context: context,
                        backgroundColor: Colors.green,
                      );
                    } else {
                      ref.read(createEventLoader.notifier).state = true;
                      snackBar(
                        content: next.errMessage ?? "",
                        context: context,
                        backgroundColor: Colors.red,
                      );
                    }
                  });
                  return GestureDetector(
                    onTap: () async {
                      if (_form.currentState!.validate() && location.isNotEmpty) {
                        
                        ref.read(createEventLoader.notifier).state = true;
                        final timestart = DateFormat('HH:mm').format(startTime);
                        final timeend = DateFormat('HH:mm').format(endTime);
                        final datestart = DateFormat('MM/dd/yyyy').format(startDate);
                        final dateend = DateFormat('MM/dd/yyyy').format(endDate);

                        final data = {
                          "title": title,
                          "description": description,
                          "creator": userData.value!.user!.id ?? "",
                          "location": location,
                          "start_time": timestart,
                          "end_time": timeend,
                          "start_date": datestart,
                          "end_date": dateend,
                          "image": "anything.jpg"
                        };
                        ref.read(createEvent(data));
                      } else {
                        snackBar(
                          content: "Missing field",
                          context: context,
                          backgroundColor: Colors.red,
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 64,
                      padding: const EdgeInsets.symmetric(horizontal: 71, vertical: 18),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFDEEDF7),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignCenter,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0xFF000000),
                            blurRadius: 0,
                            offset: Offset(4, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: SizedBox(
                              width: 233,
                              child: Text(
                                loading ? "Loading..." : 'Create Event',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Cabinet Grotesk',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                  letterSpacing: 0.20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DropdownCell extends StatefulWidget {
  final DateTime? selectedDate;
  final DateTime? selectedTime;
  final ValueChanged<DateTime>? onDateChanged;
  final ValueChanged<DateTime>? onTimeChanged;

  const DropdownCell({
    Key? key,
    this.selectedDate,
    this.selectedTime,
    this.onDateChanged,
    this.onTimeChanged,
  }) : super(key: key);

  @override
  State<DropdownCell> createState() => _DropdownCellState();
}

class _DropdownCellState extends State<DropdownCell> {
  DateTime? _selectedTime; // Maintain a separate time for each instance

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.selectedTime; // Initialize with the provided time
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 63,
      decoration: ShapeDecoration(
        color: const Color(0xFFF5FAFF),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.selectedDate != null)
              Row(
                children: [
                  Text(DateFormat('MM/dd/yyyy').format(widget.selectedDate!)),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      if (widget.onDateChanged != null) {
                        _showDatePicker();
                      }
                    },
                  ),
                ],
              ),
            if (_selectedTime != null)
              Row(
                children: [
                  Text(DateFormat('hh:mm a').format(_selectedTime!)),
                  IconButton(
                    icon: const Icon(Icons.arrow_drop_down),
                    onPressed: () {
                      if (widget.onTimeChanged != null) {
                        _showTimePicker();
                      }
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  _showDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (date != null && widget.onDateChanged != null) {
      widget.onDateChanged!(date);
    }
  }

  _showTimePicker() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedTime ?? DateTime.now()),
    );

    if (timeOfDay != null && widget.onTimeChanged != null) {
      final DateTime selectedTime = DateTime(
        widget.selectedDate?.year ?? DateTime.now().year,
        widget.selectedDate?.month ?? DateTime.now().month,
        widget.selectedDate?.day ?? DateTime.now().day,
        timeOfDay.hour,
        timeOfDay.minute,
      );

      setState(() {
        _selectedTime = selectedTime; // Update the selected time for this instance
      });

      widget.onTimeChanged!(selectedTime);
    }
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Tropiline',
        fontWeight: FontWeight.w600,
        height: 0.09,
        letterSpacing: 0.16,
      ),
    );
  }
}
