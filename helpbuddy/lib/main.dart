import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpbuddy/admin/Request/request_history.dart';
import 'package:helpbuddy/admin/admin_state.dart';
import 'package:helpbuddy/admin/home/admin_dashboard.dart';
import 'package:helpbuddy/admin/home/project_requests.dart';
import 'package:helpbuddy/admin/home/view_more.dart';
import 'package:helpbuddy/admin/messages/messages.dart';
import 'package:helpbuddy/admin/more/profile/profile.dart';
import 'package:helpbuddy/admin/notification/notification.dart';
import 'package:helpbuddy/admin/reviews/reviews.dart';
import 'package:helpbuddy/super_admin/withdrawal/add_bank_account.dart';
import 'package:helpbuddy/super_admin/withdrawal/withdraw.dart';
import 'package:helpbuddy/authentication/forget_password.dart';
import 'package:helpbuddy/authentication/logins/super_admin_login.dart';
import 'package:helpbuddy/authentication/logins/user_login.dart';
import 'package:helpbuddy/authentication/select_role.dart';
import 'package:helpbuddy/authentication/signup.dart';
import 'package:helpbuddy/onboarding/onboarding.dart';
import 'package:helpbuddy/onboarding/splashscreen.dart';
import 'package:helpbuddy/referral_link/refer.dart';
import 'package:helpbuddy/super_admin/advertisement/advert_placement.dart';
import 'package:helpbuddy/super_admin/home/dashboard.dart';
import 'package:helpbuddy/super_admin/more/more.dart';
import 'package:helpbuddy/super_admin/more/settings.dart';
import 'package:helpbuddy/super_admin/notification/notification.dart';
import 'package:helpbuddy/super_admin/stat/admin_stat.dart';
import 'package:helpbuddy/super_admin/stat/all_stat.dart';
import 'package:helpbuddy/super_admin/stat/message_stat.dart';
import 'package:helpbuddy/super_admin/stat/project_stat.dart';
import 'package:helpbuddy/super_admin/stat/transac_stat.dart';
import 'package:helpbuddy/super_admin/stat/user_stat.dart';
import 'package:helpbuddy/user/chat/models/user_model.dart';
import 'package:helpbuddy/user/chat/screens/chat_room.dart';
import 'package:helpbuddy/user/history/history.dart';
import 'package:helpbuddy/user/home/dashboard.dart';
import 'package:helpbuddy/user/messages/messages.dart';
import 'package:helpbuddy/user/more/user_more.dart';
import 'package:helpbuddy/user/notification/notification.dart';
import 'package:helpbuddy/user/payment/bank_state.dart';
import 'package:helpbuddy/user/payment/make_payment.dart';
import 'package:helpbuddy/user/profile/profile.dart';
import 'package:helpbuddy/user/project/project.dart';
import 'package:helpbuddy/user/state/user_state.dart';
import 'package:provider/provider.dart';

import 'authentication/logins/admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserState>(
          create: (BuildContext context) => UserState(),
        ),
        ChangeNotifierProvider<BankState>(
          create: (BuildContext context) => BankState(),
        ),
        ChangeNotifierProvider<AdminState>(
          create: (BuildContext context) => AdminState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Twgo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          // Onboarding Routes ...
          '/splash': (context) => const Splashscreen(),
          '/onboarding': (context) => const Onboarding(),
          '/signup': (context) => const SignUp(),
          '/select-role': (context) => const SelectRole(),
          '/user-login': (context) => const UserLogin(),
          '/admin-login': (context) => const AdminLogin(),
          '/super-admin-login': (context) => const SuperAdminLogin(),
          '/forgot-password': (context) => const ForgotpasswordWidget(),
          '/referral-link': (context) => const Refer(),

          // User Routes ...
          '/user/dashboard': (context) => const UserDashboard(),
          '/user/notification': (context) => const UserNotification(),
          '/user/profile': (context) => const UserProfile(),
          '/user/add-balance/make-payment': (context) => const MakePayments(),
          '/user/history': (context) => const History(),
          '/user/more': (context) => const UserMore(),
          '/user/project': (context) => const Project(),
          '/user/project/chat': (context) => chat(context),
          '/user/get-help': (context) => chat(context),
          '/user/side-bar/messages': (context) => const UserMessages(),
          '/user/side-bar/notification': (context) => const UserNotification(),
          '/user/side-bar/formA': (context) => chat(context),
          '/user/side-bar/get-to-work': (context) => chat(context),
          '/user/side-bar/profile': (context) => const UserProfile(),

          // Admin Routes ...
          '/admin/dashboard': (context) => const AdminDashboard(),
          '/admin/notification': (context) => const AdminNotification(),
          '/admin/profile': (context) => const AdminProfile(),
          '/admin/project-requests': (context) => const ProjectRequests(),
          '/admin/history': (context) => const RequestHistory(),
          '/admin/reviews': (context) => const Reviews(),
          '/admin/more': (context) => const ViewMore(),
          '/admin/side-bar/messages': (context) => const AdminMessages(),
          '/admin/side-bar/notification': (context) =>
              const AdminNotification(),
          '/admin/side-bar/profile': (context) => const AdminProfile(),

          // Super Admin Routes ...
          '/super-admin/dashboard': (context) => const SuperAdminDashboard(),
          '/super-admin/all-stats/project-stats': (context) =>
              const ProjectStat(),
          '/super-admin/withdrawal': (context) => const Withdrawal(),
          '/super-admin/withdrawal/add-bank-account': (context) =>
              const AddBankAccount(),
          '/super-admin/all-stats/message-stats': (context) =>
              const MessageStat(),
          '/super-admin/all-stats/transaction-stats': (context) =>
              const TransactionStat(),
          '/super-admin/all-stats/user-stats': (context) => const UserStat(),
          '/super-admin/notification': (context) =>
              const SuperAdminNotification(),
          '/super-admin/stats': (context) => const AdminStat(),
          '/super-admin/user-stats': (context) => const UserStat(),
          '/super-admin/all-stats': (context) => const AllStat(),
          '/super-admin/more': (context) => const SuperAdminMore(),
          '/super-admin/more/advert': (context) => const AdvertPlacement(),
          '/super-admin/more/settings': (context) => const SuperAdminSettings(),
        },
      ),
    );
  }
}

Widget chat(BuildContext ctx) {
  return Builder(
    builder: (context) {
      // Extract the required parameters from the route settings arguments
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final userModel = args['userModel'] as UserModel;
      final targetUser = args['targetUser'] as UserModel;
      final reason = args['reason'] as String?;

      // Return the ChatRoom widget with the required parameters
      return ChatRoom(
        userModel: userModel,
        targetUser: targetUser,
        reason: reason,
      );
    },
  );
}
