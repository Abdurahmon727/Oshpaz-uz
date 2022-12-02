import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/widgets/saved_recipe_builder.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('Saved Recipes',
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text('3 recipies', style: GoogleFonts.workSans())
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            //builder
            SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 50);
                },
                itemBuilder: (context, index) => (index != 0)
                    ? savedRecipe
                    : Column(children: [SizedBox(height: 40), savedRecipe]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
