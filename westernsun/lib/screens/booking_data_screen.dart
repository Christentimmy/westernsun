import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:westernsun/screens/booking_details.dart';

class BookingDataScreen extends StatefulWidget {
  const BookingDataScreen({super.key});

  @override
  State<BookingDataScreen> createState() => _BookingDataScreenState();
}

class _BookingDataScreenState extends State<BookingDataScreen> {
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  DateTimeRange? _selectedRange;

  final RxInt _adult = 0.obs;
  final RxInt _children = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Booking Date",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Dates",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TableCalendar(
                      firstDay: DateTime.utc(2024, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarStyle: CalendarStyle(
                        todayDecoration: const BoxDecoration(
                          color: Color.fromARGB(255, 177, 150, 140),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                        rangeStartDecoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                        rangeEndDecoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                        ),
                        rangeHighlightColor: Colors.brown.withOpacity(0.3),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      rangeStartDay: _selectedRange?.start,
                      rangeEndDay: _selectedRange?.end,
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _selectedRange = null; // Clears range selection
                        });
                      },
                      onRangeSelected: (start, end, focusedDay) {
                        setState(() {
                          _selectedDay = null; // Clears single-day selection
                          _selectedRange =
                              DateTimeRange(start: start!, end: end!);
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Guest & Rooms",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.brown.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Adults",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 189, 149, 135),
                                ),
                              ),
                              Text(
                                "Over 17years",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (_adult.value != 0) {
                                _adult.value--;
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown.withOpacity(0.5),
                              ),
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Obx(
                            () => Text(_adult.value.toString()),
                          ),
                          const SizedBox(width: 7),
                          GestureDetector(
                            onTap: () => _adult.value++,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown.withOpacity(0.5),
                              ),
                              child: const Icon(FontAwesomeIcons.plus),
                            ),
                          ),
                          const SizedBox(width: 7),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 80,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Colors.brown.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Child",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 189, 149, 135),
                                ),
                              ),
                              Text(
                                "Under 17years",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (_children.value != 0) {
                                _children.value--;
                              }
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown.withOpacity(0.5),
                              ),
                              child: const Icon(FontAwesomeIcons.minus),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Obx(
                            () => Text(_children.value.toString()),
                          ),
                          const SizedBox(width: 7),
                          GestureDetector(
                            onTap: () => _children.value++,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.brown.withOpacity(0.5),
                              ),
                              child: const Icon(FontAwesomeIcons.plus),
                            ),
                          ),
                          const SizedBox(width: 7),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Price"), Text("\$250k")],
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: ()=> Get.to(()=> BookingDetailsScreen()),
                              child: Container(
                                height: 45,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.brown,
                                ),
                                child: const Text(
                                  "Proceed",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
