import 'package:asartha/common/navigation.dart';
import 'package:asartha/common/style.dart';
import 'package:asartha/data/model/user_profile.dart';
import 'package:asartha/ui/add_address_page.dart';
import 'package:asartha/ui/date_picker_page.dart';
import 'package:asartha/ui/address_page.dart';
import 'package:asartha/ui/detail_address_page.dart';
import 'package:asartha/ui/user/edit_profile_page.dart';
import 'package:asartha/ui/error_payment_page.dart';
import 'package:asartha/ui/forgot_password_page.dart';
import 'package:asartha/ui/home_page.dart';
import 'package:asartha/ui/partner/partner_sign_in_page.dart';
import 'package:asartha/ui/partner/partner_sign_up_page.dart';
import 'package:asartha/ui/payment_page.dart';
import 'package:asartha/ui/user/sign_in_page.dart';
import 'package:asartha/ui/user/sign_up_page.dart';
import 'package:asartha/ui/success_payment_page.dart';
import 'package:asartha/widget/floating_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 350,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      theme: ThemeData(
        primaryColor: primary,
        scaffoldBackgroundColor: white,
        textTheme: myTextTheme,
        appBarTheme: AppBarTheme(
            titleTextStyle: Theme.of(context).textTheme.headline4,
            elevation: 0),
      ),
      initialRoute: SignInPage.routeName,
      navigatorKey: navigatorKey,
      routes: {
        SignInPage.routeName: (context) => const SignInPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
        HomePage.routeName: (context) => HomePage(
            partner: (ModalRoute.of(context)?.settings.arguments as bool)),
        FloatingNavigationBar.routeName: (context) => FloatingNavigationBar(
            partner: (ModalRoute.of(context)?.settings.arguments as bool)),
        EditProfilePage.routeName: (context) => EditProfilePage(
            user: (ModalRoute.of(context)?.settings.arguments as UserProfile)),
        PaymentPage.routeName: (context) => const PaymentPage(),
        DatePickerPage.routeName: (contex) => const DatePickerPage(),
        AddressPage.routeName: (context) => AddressPage(
            partner: (ModalRoute.of(context)?.settings.arguments as bool)),
        DetailAddressPage.routeName: (context) => const DetailAddressPage(),
        AddAddressPage.routeName: (context) => AddAddressPage(
            partner: (ModalRoute.of(context)?.settings.arguments as bool)),
        SuccessPaymentPage.routeName: (context) => const SuccessPaymentPage(),
        ErrorPaymentPage.routeName: (context) => const ErrorPaymentPage(),
        PartnerSignInPage.routeName: (context) => const PartnerSignInPage(),
        PartnerSignUpPage.routeName: (context) => const PartnerSignUpPage()
      },
    );
  }
}
