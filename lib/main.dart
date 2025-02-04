import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_final_project/controllers/auth_service.dart';
import 'package:flutter_final_project/firebase_options.dart'; // Import the generated Firebase options
import 'package:flutter_final_project/provider/admin_provider.dart';
import 'package:flutter_final_project/views/admin_home.dart';
import 'package:flutter_final_project/views/categories_page.dart';
import 'package:flutter_final_project/views/coupons.dart';
import 'package:flutter_final_project/views/login.dart';
import 'package:flutter_final_project/views/modify_product.dart';
import 'package:flutter_final_project/views/modify_promo.dart';
import 'package:flutter_final_project/views/orders_page.dart';
import 'package:flutter_final_project/views/products_page.dart';
import 'package:flutter_final_project/views/promo_banners_page.dart';
import 'package:flutter_final_project/views/signup.dart';
import 'package:flutter_final_project/views/view_product.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure that Firebase is initialized before the app runs
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialize Firebase with generated options
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminProvider(),
      builder: (context, child) =>  MaterialApp(
        title: 'Ecommerce Admin App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => CheckUser(),
          "/login": (context)=> LoginPage(),
          "/signup": (context)=>SignupPage(),
          "/home": (context)=>AdminHome(),
          "/category": (context)=> CategoriesPage(),
          "/products": (context)=>ProductsPage(),
          "/add_product": (context)=>ModifyProduct(),
          "/view_product": (context)=>ViewProduct(),
          "/promos": (context)=>PromoBannersPage(),
          "/update_promo": (context)=> ModifyPromo(),
          "/coupons": (context)=> CouponsPage(),
          "/orders": (context)=> OrdersPage(),
          "/view_order": (context)=> ViewOrder()
        },
      ),
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

   @override
  void initState() {
    AuthService().isLoggedIn().then((value){
      if(value){
        Navigator.pushReplacementNamed(context, "/home");
      }else{
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}