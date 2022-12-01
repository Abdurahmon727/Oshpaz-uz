import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/vars.dart';

class DropDownRecipeFontSize extends StatefulWidget {
  const DropDownRecipeFontSize({Key? key}) : super(key: key);

  @override
  State<DropDownRecipeFontSize> createState() => _DropDownRecipeFontSizeState();
}

class _DropDownRecipeFontSizeState extends State<DropDownRecipeFontSize> {
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
                settingsOnChangedHive();
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

class DropDownFontSize extends StatefulWidget {
  const DropDownFontSize({Key? key}) : super(key: key);

  @override
  State<DropDownFontSize> createState() => _DropDownFontSizeState();
}

class _DropDownFontSizeState extends State<DropDownFontSize> {
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
              value: currentFontSize,
              menuMaxHeight: 150,
              onChanged: (value) {
                setState(() {
                  currentFontSize = value;
                });
                settingsOnChangedHive();
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

class DropDownTheme extends StatefulWidget {
  const DropDownTheme({Key? key}) : super(key: key);

  @override
  State<DropDownTheme> createState() => _DropDownThemeState();
}

class _DropDownThemeState extends State<DropDownTheme> {
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
                settingsOnChangedHive();
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

class MakeDropDownLanguage extends StatefulWidget {
  const MakeDropDownLanguage({Key? key}) : super(key: key);

  @override
  State<MakeDropDownLanguage> createState() => _MakeDropDownLanguageState();
}

class _MakeDropDownLanguageState extends State<MakeDropDownLanguage> {
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
                settingsOnChangedHive();
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
  }
}
