import 'package:flutter/material.dart';
import 'package:portfolio/src/components/custom_widgets/black-text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            BlackText(
              onTap: (){},
              text: "Works",
            ),
            const SizedBox(width: 20),
            BlackText(
              onTap: (){},
              text: "Blog",
            ),
            const SizedBox(width: 20),
            BlackText(
              onTap: (){},
              text: "Contact",
            ),
          ],),
        )


      ],),
    ));
  }
}
