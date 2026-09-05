import 'package:get/get.dart';
import '../features/auth/register/binding/register_binding.dart';
import '../features/auth/register/view/register_screen.dart';
import '../features/studentAttendance/binding/student_attendance_binding.dart';
import '../features/studentAttendance/view/student_attendance_screen.dart';
import '../features/studentDasbord/binding/student_dashbord_binding.dart';
import '../features/studentDasbord/view/student_dashbord_screen.dart';
import '../features/studentResult/binding/student_result_binding,.dart';
import '../features/studentResult/view/student_result_screen.dart';
import '../features/studentSolution/binding/student_solution_binding.dart';
import '../features/studentSolution/view/student_solution_screen.dart';
import '../features/student_nutice/binding/student_nutice_binding.dart';
import '../features/student_nutice/view/student_nutice_screen.dart';
import '../features/studentaddMark/binding/student_add_mark_binding.dart';
import '../features/studentaddMark/view/student_add_mark_screen.dart';
import '../features/studenthomework/binding/student_home_work_binding.dart';
import '../features/studenthomework/view/student_home_work_screen.dart';
import 'app_routes.dart';
import '../features/splash/view/splash_screen.dart';
import '../features/splash/binding/splash_binding.dart';
import '../features/onboarding/view/onboarding_screen.dart';
import '../features/onboarding/binding/onboarding_binding.dart';
import '../features/auth/login/view/login_screen.dart';
import '../features/auth/login/binding/login_binding.dart';
import '../features/main/view/main_screen.dart';
import '../features/main/binding/main_binding.dart';
import '../features/home/view/home_screen.dart';
import '../features/home/binding/home_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.studentDashbord,
      page: () => const StudentDashbordScreen(),
      binding: StudentDashbordBinding(),
    ),
    GetPage(
      name: AppRoutes.studentAttendance,
      page: () => const StudentAttendanceScreen(),
      binding: StudentAttendanceBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.studentResult,
      page: () => const StudentResultScreen(),
      binding: StudentResultBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.studentHomeWork,
      page: () => const StudentHomeWorkScreen(),
      binding: StudentHomeworkBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.studentNutice,
      page: () => const StudentNuticeScreen(),
      binding: StudentNuticeBinding(),
      transition: Transition.leftToRight,
    ),

    GetPage(
      name: AppRoutes.studentSolution,
      page: () => const StudentSolutionScreen(),
      binding: StudentSolutionBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: AppRoutes.studentAddMark,
      page: () => const StudentAddMarkScreen(),
      binding: StudentAddMarkBinding(),
      transition: Transition.leftToRight,
    ),
  ];
}
