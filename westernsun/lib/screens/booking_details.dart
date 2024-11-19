import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paystack_for_flutter/paystack_for_flutter.dart';
import 'package:westernsun/screens/payment_screen.dart';

class BookingDetailsScreen extends StatefulWidget {
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  final RxList _specialList = [].obs;
  var publicKey = 'pk_test_3a03d071694b6d92005d4b9f31260a6965175865';
  var secretKey = 'sk_test_fd7ae79fb5a28191b91b0f7bac2742ebbd71ba64';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            PaystackFlutter().pay(
              context: context,
              secretKey: secretKey,
              amount:
                  2000, // The amount to be charged in the smallest currency unit. If amount is 600, multiply by 100(600*100)
              email: 'timmychris09@gmail.com', // The customer's email address.
              callbackUrl:
                  'https://callback.com', // The URL to which Paystack will redirect the user after the transaction.
              showProgressBar:
                  true, // If true, it shows progress bar to inform user an action is in progress when getting checkout link from Paystack.
              paymentOptions: [
                PaymentOption.card,
                PaymentOption.bankTransfer,
                PaymentOption.mobileMoney
              ],
              currency: Currency.NGN,
              metaData: {
                "product_name": "Nike Sneakers",
                "product_quantity": 3,
                "product_price": 24000
              },

              onSuccess: (paystackCallback) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Transaction Successful::::${paystackCallback.reference}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.brown,
                  ),
                );
                Get.to(() => SuccessfulPaymentScreen(reference: paystackCallback.reference,));
                
              },
              onCancelled: (paystackCallback) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Transaction Failed/Not successful::::${paystackCallback.reference}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }, // A callback function to be called when the payment is canceled.
            );
          },
          child: const Text(
            "Proceed",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text(
          "Booking Details",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Booking Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                bookingDetailsCard(),
                const SizedBox(height: 20),
                const Text(
                  "Contact Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                contactDetailsCard(),
                const SizedBox(height: 20),
                const Text(
                  "Contact Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                specialRequestCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container specialRequestCard() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 50,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.brown,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.note_alt_sharp,
                color: Colors.brown,
              ),
              const SizedBox(width: 10),
              const Text(
                "Add Special Request",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  _specialList.add("");
                },
                icon: const Icon(Icons.add),
              ),
              // const Icon(Icons.add),
            ],
          ),
          const SizedBox(height: 5),
          Obx(() {
            return ListView.builder(
              itemCount: _specialList.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      _specialList.removeAt(index);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown[100],
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Type here",
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          })
        ],
      ),
    );
  }

  Container contactDetailsCard() {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.brown,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Bruce Bayce",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // editContactDetailsCard();
                },
                child: const Icon(Icons.edit, size: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.email),
              SizedBox(width: 10),
              Text('timmychris09@gmail.com'),
            ],
          ),
          const Spacer(),
          const Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text('+234-917-236-217'),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> editContactDetailsCard() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 41, 41, 41),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container bookingDetailsCard() {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Colors.brown,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/1.jpg",
                  width: 100,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "King's Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person, size: 15),
                      Text(
                        "2 Guest",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.bed, size: 15),
                      Text(
                        "twin Bed",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.person, size: 15),
                      Text(
                        "2 Guest",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.bed,
                        size: 15,
                      ),
                      Text(
                        "twin Bed",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.edit),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Check In",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("21 Jun 2023")
                ],
              ),
              Container(
                height: 30,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 2,
                    color: Colors.brown,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.nightlight_round),
                    Text("2"),
                  ],
                ),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Check In",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("21 Jun 2023")
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
