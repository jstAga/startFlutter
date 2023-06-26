import 'package:flutter/material.dart';
import 'package:start_flutter/resources/resources.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/core/love_constants.dart';
import 'package:start_flutter/ui/geek_tech/5month/love_calculator/ui/widgets/home/love_home_model.dart';

class LoveHomeWidget extends StatefulWidget {
  const LoveHomeWidget({super.key});

  @override
  State<LoveHomeWidget> createState() => _LoveHomeWidgetState();
}

class _LoveHomeWidgetState extends State<LoveHomeWidget> {
  final model = LoveHomeModel();

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final secondNameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: LoveHomeProvider(
          model: model,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage(Images.hw2m5_home_bg)),
              const _TitleWidget(),
              const _FirstNameWidget(),
              _FirstNameFieldWidget(controller: firstNameController),
              const _SecondNameWidget(),
              _SecondNameFieldWidget(controller: secondNameController),
              const SizedBox(height: 8),
              // const _CalculateButton()
              _CalculateButton(
                  firstNameController: firstNameController,
                  secondNameController: secondNameController),
            ],
          ),
        ),
      ),
    );
  }
}

class _SecondNameFieldWidget extends StatelessWidget {
  const _SecondNameFieldWidget({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "Second name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(28))),
      ),
    );
  }
}

class _FirstNameFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const _FirstNameFieldWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "First name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(28))),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Text("Love calculator", style: LoveConstants.baseTitleText),
    );
  }
}

class _SecondNameWidget extends StatelessWidget {
  const _SecondNameWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text("Second name", style: LoveConstants.baseHomeText),
    );
  }
}

class _FirstNameWidget extends StatelessWidget {
  const _FirstNameWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text("First name", style: LoveConstants.baseHomeText),
    );
  }
}

class _CalculateButton extends StatelessWidget {
  const _CalculateButton({
    required this.firstNameController,
    required this.secondNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController secondNameController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await LoveHomeProvider.read(context)?.model.getLove(
                firstName: firstNameController.text,
                secondName: secondNameController.text);

            await Navigator.pushNamed(context, "/loveCalculator/result",
                arguments: LoveHomeProvider.read(context)!.model.result);
          },
          style: LoveConstants.baseLoveButton,
          child: const Text(
            "Calculate",
            style: TextStyle(color: Colors.black, fontSize: 16),
          )),
    );
  }
}