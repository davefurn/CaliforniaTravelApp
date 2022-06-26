  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  Widget myDrawerList() {
    var currentPage;
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItem(1, 'Search', Icons.search,
              currentPage == DrawerSections.search ? true : false),
           const SizedBox(height: 10,),
          menuItem(2, 'Login', Icons.login_rounded,
              currentPage == DrawerSections.login ? true : false),
                const SizedBox(height: 10,),
          menuItem(3, 'Home', Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false),
                const SizedBox(height: 10,),
          menuItem(4, 'Tours', Icons.tour,
              currentPage == DrawerSections.tours ? true : false),
                const SizedBox(height: 10,),
          menuItem(5, 'Hotels', Icons.bed_outlined,
              currentPage == DrawerSections.hotels ? true : false),
                const SizedBox(height: 10,),
          menuItem(6, 'About Us', Icons.info_outline,
              currentPage == DrawerSections.aboutus ? true : false),
                const SizedBox(height: 10,),
          menuItem(7, 'Contact Us', Icons.mail_outlined,
              currentPage == DrawerSections.contactus ? true : false),
        ],
      ),
      //shows list of menu_drawers
    );
  }

Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
         
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            
            children: [
             const SizedBox(width: 3 ),
              Icon(
                icon,
                size: 30,
                color: Colors.grey,
              ),
             const SizedBox(width: 30 ),
              Text(
                title,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  enum DrawerSections {
  search,
  login,
  home,
  tours,
  hotels,
  aboutus,
  contactus,
}
