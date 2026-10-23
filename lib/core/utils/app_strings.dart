/// Centralized localization key constants.
/// Use these instead of bare string literals like `'welcome_back'.tr`
/// to prevent typos and make key usage traceable across the codebase.
class AppStrings {
  AppStrings._();

  // ─── App Info ─────────────────────────────────────────────────────────────
  static const String appName = 'app_name';
  static const String appTagline = 'app_tagline';
  static const String poweredBy = 'powered_by';

  // ─── Navigation / Tabs ────────────────────────────────────────────────────
  static const String tabHome = 'tab_home';
  static const String tabExplore = 'tab_explore';
  static const String tabAlerts = 'tab_alerts';
  static const String tabSaved = 'tab_saved';
  static const String tabProfile = 'tab_profile';
  static const String homeTitle = 'home_title';

  // ─── Onboarding ───────────────────────────────────────────────────────────
  static const String onboardingWelcome = 'onboarding_welcome';
  static const String onboardingDesc = 'onboarding_desc';
  static const String register = 'register';
  static const String chooseYourOption = 'choose_your_option';
  static const String student = 'student';
  static const String teacher = 'teacher';
  static const String guest = 'guest';

  // ─── Auth ─────────────────────────────────────────────────────────────────
  static const String welcomeBack = 'welcome_back';
  static const String loginToContinue = 'login_to_continue';
  static const String email = 'email';
  static const String emailHint = 'email_hint';
  static const String password = 'password';
  static const String passwordHint = 'password_hint';
  static const String rememberMe = 'remember_me';
  static const String forgotPassword = 'forgot_password';
  static const String createWith = 'create_with';
  static const String google = 'google';
  static const String facebook = 'facebook';
  static const String login = 'login';
  static const String noAccount = 'no_account';
  static const String signUp = 'sign_up';
  static const String loginError = 'login_error';
  static const String fillFields = 'fill_fields';
  static const String userName = 'user_name';
  static const String enterYourUserName = 'enter_your_user_name';
  static const String enterYourPassword = 'enter_your_password';
  static const String dontHaveAccount = 'dont_have_account';
  static const String alreadyHaveAccount = 'already_have_account';
  static const String name = 'name';
  static const String enterYourName = 'enter_your_name';
  static const String enterYourEmail = 'enter_your_email';
  static const String className = 'class_name';
  static const String enterYourClass = 'enter_your_class';
  static const String section = 'section';
  static const String enterYourSection = 'enter_your_section';
  static const String rollNo = 'roll_no';
  static const String enterYourRollNo = 'enter_your_roll_no';
  static const String group = 'group';
  static const String enterYourGroup = 'enter_your_group';
  static const String address = 'address';
  static const String enterYourAddress = 'enter_your_address';
  static const String gender = 'gender';
  static const String male = 'male';
  static const String female = 'female';
  static const String other = 'other';
  static const String pleaseEnterName = 'please_enter_name';
  static const String pleaseEnterEmail = 'please_enter_email';
  static const String pleaseEnterPassword = 'please_enter_password';
  static const String passwordMinLength = 'password_min_length';
  static const String pleaseEnterClass = 'please_enter_class';
  static const String pleaseEnterSection = 'please_enter_section';
  static const String pleaseEnterRollNo = 'please_enter_roll_no';
  static const String pleaseEnterGroup = 'please_enter_group';
  static const String pleaseEnterAddress = 'please_enter_address';
  static const String pleaseEnterGender = 'please_enter_gender';
  static const String registrationSuccess = 'registration_success';

  // ─── Profile / Settings ───────────────────────────────────────────────────
  static const String settingsTitle = 'settings_title';
  static const String theme = 'theme';
  static const String themeAuto = 'theme_auto';
  static const String themeLight = 'theme_light';
  static const String themeDark = 'theme_dark';
  static const String language = 'language';
  static const String langEn = 'lang_en';
  static const String langAr = 'lang_ar';
  static const String langBn = 'lang_bn';
  static const String logout = 'logout';
  static const String logoutConfirmation = 'logout_confirmation';
  static const String cancel = 'cancel';

  // ─── Dashboard ────────────────────────────────────────────────────────────
  static const String stayUpdatedAcademic = 'stay_updated_academic';
  static const String dashboardMessage = 'dashboard_message';
  static const String attendance = 'attendance';
  static const String homework = 'homework';
  static const String result = 'result';
  static const String examRoutine = 'exam_routine';
  static const String solution = 'solution';
  static const String notice = 'notice';
  static const String addStudent = 'add_student';
  static const String allStudent = 'all_student';
  static const String quiz = 'quiz';
  static const String profileOfSchool = 'profile_of_school';
  static const String profileOfPublication = 'profile_of_publication';
  static const String emergencyContacts = 'emergency_contacts';

  // ─── Attendance ───────────────────────────────────────────────────────────
  static const String semester7th = 'semester_7th';
  static const String date = 'date';
  static const String studentName = 'student_name';
  static const String present = 'present';
  static const String absent = 'absent';

  // ─── Teacher / Student Result ─────────────────────────────────────────────
  static const String studentResult = 'student_result';
  static const String allStudentResult = 'all_student_result';
  static const String noResultFound = 'no_result_found';
  static const String publish = 'publish';
  static const String searchByRollNo = 'search_by_roll_no';
  static const String subject = 'subject';
  static const String gpa = 'gpa';
  static const String roll = 'roll';
  static const String id = 'id';
  static const String nameNotFound = 'name_not_found';
  static const String unknown = 'unknown';
  static const String unknownExam = 'unknown_exam';

  // ─── Homework ─────────────────────────────────────────────────────────────
  static const String yourDailyHomework = 'your_daily_homework';
  static const String homeworkDescription = 'homework_description';
  static const String addHomework = 'add_homework';
  static const String enterHomework = 'enter_homework';
  static const String submit = 'submit';
  static const String select = 'select';
  static const String enterSubject = 'enter_subject';
  static const String pleaseEnterHomework = 'please_enter_homework';
  static const String pleaseSelectClass = 'please_select_class';
  static const String pleaseSelectSection = 'please_select_section';
  static const String pleaseSelectSubject = 'please_select_subject';
  static const String homeworkSubmitSuccess = 'homework_submit_success';
  static const String homeworkSubmitFailed = 'homework_submit_failed';
  static const String studentHomeWork = 'student_home_work';
  static const String studentHomeWorkDetails = 'student_home_work_details';
  static const String noHomeworkAvailable = 'no_homework_available';
  static const String noHomeworkDetailsFound = 'no_homework_details_found';
  static const String deadline = 'deadline';
  static const String createdAt = 'created_at';
  static const String noData = 'no_data';
  static const String noClass = 'no_class';
  static const String noHomeworkToday = 'no_homework_today';

  // ─── Notice ───────────────────────────────────────────────────────────────
  static const String noticeAndEvents = 'notice_and_events';
  static const String send = 'send';
  static const String profession = 'profession';
  static const String enterYourProfession = 'enter_your_profession';
  static const String enterNotice = 'enter_notice';
  static const String uploadImage = 'upload_image';
  static const String pleaseEnterProfession = 'please_enter_profession';
  static const String pleaseEnterNotice = 'please_enter_notice';
  static const String noticeSentSuccess = 'notice_sent_success';
  static const String noticeSentFailed = 'notice_sent_failed';

  // ─── Solutions & Questions ────────────────────────────────────────────────
  static const String question = 'question';
  static const String questionList = 'question_list';
  static const String enterDetails = 'enter_details';
  static const String uploadFile = 'upload_file';
  static const String sending = 'sending';
  static const String pendingSolutions = 'pending_solutions';
  static const String completedSolutions = 'completed_solutions';
  static const String noQuestionsAvailable = 'no_questions_available';
  static const String zeroMinAgo = 'zero_min_ago';
  static const String justNow = 'just_now';
  static const String yesterday = 'yesterday';
  static const String minAgo = 'min_ago';
  static const String hrAgo = 'hr_ago';
  static const String pleaseEnterSolution = 'please_enter_solution';
  static const String solutionAddedSuccess = 'solution_added_success';
  static const String failedToAddSolution = 'failed_to_add_solution';
  static const String askQuestion = 'ask_question';
  static const String writeYourQuestion = 'write_your_question';
  static const String noQuestionsFound = 'no_questions_found';
  static const String editQuestion = 'edit_question';
  static const String questionSolutionFromTeacher = 'question_solution_from_teacher';
  static const String shareAnswer = 'share_answer';
  static const String answerLoading = 'answer_loading';
  static const String noSolutionYet = 'no_solution_yet';
  static const String noSolutionAvailable = 'no_solution_available';
  static const String view = 'view';
  static const String pleaseEnterQuestion = 'please_enter_question';
  static const String notLoggedIn = 'not_logged_in';
  static const String questionAddedSuccess = 'question_added_success';
  static const String questionDeletedSuccess = 'question_deleted_success';
  static const String questionEditedSuccess = 'question_edited_success';

  // ─── Add Student Marks ────────────────────────────────────────────────────
  static const String addStudentMarks = 'add_student_marks';
  static const String selectClass = 'select_class';
  static const String selectSection = 'select_section';
  static const String selectSubject = 'select_subject';
  static const String exam = 'exam';
  static const String selectExam = 'select_exam';
  static const String studentList = 'student_list';
  static const String students = 'students';
  static const String noStudentsFound = 'no_students_found';
  static const String addAnotherStudent = 'add_another_student';
  static const String enterStudentName = 'enter_student_name';
  static const String enterRollNumber = 'enter_roll_number';
  static const String mark = 'mark';
  static const String saveMarks = 'save_marks';
  static const String pleaseSelectClassSectionSubjectExam = 'please_select_class_section_subject_exam';
  static const String pleaseFillAllStudentFields = 'please_fill_all_student_fields';
  static const String marksAddedSuccess = 'marks_added_success';
  static const String failedToAddMark = 'failed_to_add_mark';

  // ─── Add Account / Student Registration ───────────────────────────────────
  static const String addAccount = 'add_account';
  static const String emailAddress = 'email_address';
  static const String enterYourEmailAddress = 'enter_your_email_address';
  static const String studentId = 'student_id';
  static const String enterYourStudentId = 'enter_your_student_id';
  static const String studentPhoneNumber = 'student_phone_number';
  static const String enterYourStudentPhoneNumber = 'enter_your_student_phone_number';
  static const String selectYourGender = 'select_your_gender';
  static const String fathersName = 'fathers_name';
  static const String enterYourFathersName = 'enter_your_fathers_name';
  static const String mothersName = 'mothers_name';
  static const String enterYourMothersName = 'enter_your_mothers_name';
  static const String dateOfBirth = 'date_of_birth';
  static const String enterYourDateOfBirth = 'enter_your_date_of_birth';
  static const String religion = 'religion';
  static const String selectYourReligion = 'select_your_religion';
  static const String bloodGroup = 'blood_group';
  static const String selectYourBloodGroup = 'select_your_blood_group';
  static const String guardiansPhoneNumber = 'guardians_phone_number';
  static const String enterYourGuardiansPhoneNumber = 'enter_your_guardians_phone_number';

  // ─── All Student & Details ────────────────────────────────────────────────
  static const String deleteStudent = 'delete_student';
  static const String deleteStudentConfirmation = 'delete_student_confirmation';
  static const String delete = 'delete';
  static const String studentDetails = 'student_details';
  static const String personalInformation = 'personal_information';
  static const String familyInformation = 'family_information';
  static const String contactAndAddress = 'contact_and_address';
  static const String studentPhone = 'student_phone';
  static const String guardianPhone = 'guardian_phone';
  static const String noStudentFound = 'no_student_found';
  static const String noStudentAddedYet = 'no_student_added_yet';
  static const String noStudentFoundInSemester = 'no_student_found_in_semester';
  static const String semester = 'semester';
  static const String allStudentFetchedSuccess = 'all_student_fetched_success';
  static const String studentDeletedSuccess = 'student_deleted_success';

  // ─── Common ───────────────────────────────────────────────────────────────
  static const String error = 'error';
  static const String success = 'success';
  static const String loading = 'loading';
  static const String networkError = 'network_error';
  static const String noInternet = 'no_internet';
  static const String requestTimeout = 'request_timeout';
  static const String requestFailed = 'request_failed';

  // ─── Teacher Routine ───────────────────────────────────────────────────────────────
  static const String routine = 'routine';
  static const String teacherRoutine = 'teacher_routine';
  static const String subjectName = 'subject_name';
  static const String enterSubjectName = 'enter_subject_name';
  static const String examDate = 'exam_date';
  static const String enterExamDate = 'enter_exam_date';
  static const String subjectCode = 'subject_code';
  static const String enterSubjectCode = 'enter_subject_code';
  static const String classNames = 'class_names';
  static const String enterClassName = 'enter_class_name';
  static const String day = 'day';
  static const String saturday = 'saturday';
  static const String sunday = 'sunday';
  static const String monday = 'monday';
  static const String tuesday = 'tuesday';
  static const String wednesday = 'wednesday';
  static const String thursday = 'thursday';
  static const String friday = 'friday';
}

