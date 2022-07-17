import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/vars.dart';

class dropDownRecipeFontSize extends StatefulWidget {
  dropDownRecipeFontSize({Key? key}) : super(key: key);

  @override
  State<dropDownRecipeFontSize> createState() => _dropDownRecipeFontSizeState();
}

class _dropDownRecipeFontSizeState extends State<dropDownRecipeFontSize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Change font size of recipe',
            style: GoogleFonts.workSans(fontSize: 15)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kmainColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              dropdownColor: kmainColor,
              isExpanded: true,
              focusColor: Colors.white,
              icon: Icon(Icons.expand_more),
              value: currentRecipeFontSize,
              onChanged: (value) {
                setState(() {
                  currentRecipeFontSize = value;
                });
              },
              menuMaxHeight: 150,
              items: [
                DropdownMenuItem(
                    value: 8, child: Text('8', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 10,
                    child: Text('10', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 12,
                    child: Text('12', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 14,
                    child: Text('14', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 16,
                    child: Text('16', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 18,
                    child: Text('18', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 20,
                    child: Text('20', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 22,
                    child: Text('22', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 24,
                    child: Text('24', style: GoogleFonts.workSans())),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class dropDownFontSize extends StatefulWidget {
  dropDownFontSize({Key? key}) : super(key: key);

  @override
  State<dropDownFontSize> createState() => _dropDownFontSizeState();
}

class _dropDownFontSizeState extends State<dropDownFontSize> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Change font size of application',
            style: GoogleFonts.workSans(fontSize: 15)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kmainColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              dropdownColor: kmainColor,
              isExpanded: true,
              focusColor: Colors.white,
              icon: Icon(Icons.expand_more),
              value: 12,
              menuMaxHeight: 150,
              onChanged: (value) {
                setState(() {
                  currentFontSize = value;
                });
              },
              items: [
                DropdownMenuItem(
                    value: 10,
                    child: Text('10', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 12,
                    child: Text('12', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 14,
                    child: Text('14', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 16,
                    child: Text('16', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 18,
                    child: Text('18', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 20,
                    child: Text('20', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 22,
                    child: Text('22', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 26,
                    child: Text('26', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 32,
                    child: Text('32', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 36,
                    child: Text('36', style: GoogleFonts.workSans())),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class dropDownTheme extends StatefulWidget {
  dropDownTheme({Key? key}) : super(key: key);

  @override
  State<dropDownTheme> createState() => _dropDownThemeState();
}

class _dropDownThemeState extends State<dropDownTheme> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Change theme', style: GoogleFonts.workSans(fontSize: 15)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kmainColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: kmainColor,
              isExpanded: true,
              focusColor: Colors.white,
              icon: Icon(Icons.expand_more),
              value: currentTheme,
              onChanged: (value) {
                setState(() {
                  currentTheme = value;
                });
              },
              items: [
                DropdownMenuItem(
                    value: 'Light',
                    child: Text('Light', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 'Dark',
                    child: Text('Dark', style: GoogleFonts.workSans())),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class makeDropDownLanguage extends StatefulWidget {
  makeDropDownLanguage({Key? key}) : super(key: key);

  @override
  State<makeDropDownLanguage> createState() => _makeDropDownLanguageState();
}

class _makeDropDownLanguageState extends State<makeDropDownLanguage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Change language', style: GoogleFonts.workSans(fontSize: 15)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kmainColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: kmainColor,
              isExpanded: true,
              focusColor: Colors.white,
              icon: Icon(Icons.expand_more),
              value: currentLanguage,
              onChanged: (value) {
                setState(() {
                  currentLanguage = value;
                });
              },
              items: [
                DropdownMenuItem(
                    value: 'English',
                    child: Text('English', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 'Russia',
                    child: Text('Russia', style: GoogleFonts.workSans())),
                DropdownMenuItem(
                    value: 'Uzbek',
                    child: Text('Uzbek', style: GoogleFonts.workSans())),
              ],
            ),
          ),
        )
      ],
    );
    ;
  }
}
