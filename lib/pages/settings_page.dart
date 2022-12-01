import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oshpazuz/widgets/drop_downs.dart';
import 'package:oshpazuz/vars.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Settings',
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                MakeDropDownLanguage(),
                SizedBox(height: 20),
                DropDownTheme(),
                SizedBox(height: 20),
                DropDownFontSize(),
                SizedBox(height: 20),
                DropDownRecipeFontSize(),
              ],
            ),
            Column(
              children: [
                getLinks(Icons.thumb_up, 'Rate us'),
                getLinks(Icons.savings, 'Support us'),
                getLinks(Icons.contact_support, 'Get help'),
                getLinks(Icons.perm_phone_msg, 'Contact'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
