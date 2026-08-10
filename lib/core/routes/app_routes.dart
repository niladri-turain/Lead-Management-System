import 'package:flutter/material.dart';
import '../../feature/pages/splash/splash_screen.dart';
import '../../feature/pages/login/login_screen.dart';
import '../../feature/pages/main_nav_screen.dart';
import '../../feature/pages/home/home_screen.dart';
import '../../feature/pages/leads/leads_screen.dart';
import '../../feature/pages/leads/lead_create_screen.dart';
import '../../feature/pages/leads/lead_details_screen.dart';
import '../../feature/pages/follow_up/follow_up_screen.dart';
import '../../feature/pages/invoice/invoice_screen.dart';
import '../../feature/pages/invoice/create_invoice_screen.dart';
import '../../feature/pages/invoice/invoice_details_screen.dart';
import '../../feature/pages/profile/profile_screen.dart';
import '../../feature/pages/profile/edit_profile_screen.dart';
import '../../feature/pages/profile/settings_screen.dart';
import '../../feature/pages/profile/change_password_screen.dart';
import '../../feature/pages/profile/about_us_screen.dart';
import '../../feature/pages/profile/help_support_screen.dart';
import '../../feature/pages/profile/contact_support_screen.dart';

import '../../feature/pages/follow_up/follow_up_details_screen.dart';
import '../../feature/pages/follow_up/add_follow_up_screen.dart';

import '../../feature/pages/follow_up/follow_up_calendar_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String mainNav = '/mainNav';
  static const String home = '/home';
  static const String leads = '/leads';
  static const String followUp = '/followUp';
  static const String followUpDetails = '/followUpDetails';
  static const String addFollowUp = '/addFollowUp';
  static const String followUpCalendar = '/followUpCalendar';
  static const String invoice = '/invoice';
  static const String createInvoice = '/createInvoice';
  static const String invoiceDetails = '/invoiceDetails';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String settings = '/settings';
  static const String changePassword = '/changePassword';
  static const String aboutUs = '/aboutUs';
  static const String helpSupport = '/helpSupport';
  static const String contactSupport = '/contactSupport';
  static const String addLead = '/addLead';
  static const String leadDetails = '/leadDetails';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        mainNav: (context) => const MainNavScreen(),
        home: (context) => const HomeScreen(),
        leads: (context) => const LeadsScreen(),
        addLead: (context) => const LeadCreateScreen(),
        leadDetails: (context) => const LeadDetailsScreen(),
        followUp: (context) => const FollowUpScreen(),
        followUpDetails: (context) => const FollowUpDetailsScreen(),
        addFollowUp: (context) => const AddFollowUpScreen(),
        followUpCalendar: (context) => const FollowUpCalendarScreen(),
        invoice: (context) => const InvoiceScreen(),
        createInvoice: (context) => const CreateInvoiceScreen(),
        invoiceDetails: (context) => const InvoiceDetailsScreen(),
        profile: (context) => const ProfileScreen(),
        editProfile: (context) => const EditProfileScreen(),
        settings: (context) => const SettingsScreen(),
        changePassword: (context) => const ChangePasswordScreen(),
        aboutUs: (context) => const AboutUsScreen(),
        helpSupport: (context) => const HelpSupportScreen(),
        contactSupport: (context) => const ContactSupportScreen(),
      };
}
