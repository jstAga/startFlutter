import 'package:flutter/material.dart';

const dark = Color.fromRGBO(40, 42, 49, 1);
const blue = Color.fromRGBO(61, 112, 255, 1);
const darkBlue = Color.fromRGBO(0, 99, 255, 1);
const green = Color.fromRGBO(83, 176, 82, 1);
const light = Color.fromRGBO(243, 246, 250, 1);
const lightGrey = Color.fromRGBO(243, 246, 250, 0.8);

class BankingHome extends StatefulWidget {
  const BankingHome({Key? key}) : super(key: key);

  @override
  State<BankingHome> createState() => _BankingHomeState();
}

class _BankingHomeState extends State<BankingHome> {
  final String count = "10,000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [_CreditCard(count: count), const _MainBlock()],
      ),
    );
  }
}

class _CreditCard extends StatefulWidget {
  final String count;

  const _CreditCard({required this.count});

  @override
  State<_CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<_CreditCard> {
  @override
  Widget build(BuildContext context) {
    const greyText =
        TextStyle(fontWeight: FontWeight.w400, color: lightGrey, fontSize: 18);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: darkBlue),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Salary card", style: greyText),
              const SizedBox(height: 5),
              Text("${widget.count}\$",
                  style: const TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 40),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text("12/22", style: greyText)]),
              const SizedBox(height: 5),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("VISA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: lightGrey)),
                  Text("3566 0020 2036 0505", style: greyText)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _MainBlock extends StatefulWidget {
  const _MainBlock({Key? key}) : super(key: key);

  @override
  State<_MainBlock> createState() => _MainBlockState();
}

class _MainBlockState extends State<_MainBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
              decoration:
                  InputDecoration(label: Text("Aleksandr"), hintText: "Name")),
          const TextField(
              decoration: InputDecoration(
                  label: Text("Sum"), hintText: "from 10\$ to 99 999\$")),
          const SizedBox(height: 10),
          const Text(
            "Commissions is not charged by the bank",
            style: TextStyle(color: dark, fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  hintText: "Message to the recipient",
                  filled: true,
                  focusedBorder: InputBorder.none,
                  fillColor: const Color.fromRGBO(240, 246, 250, 1))),
          const SizedBox(height: 20),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(blue)),
                child: const Text("Translate"),
              ))
        ],
      ),
    );
  }
}
