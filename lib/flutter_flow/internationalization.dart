import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome back',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'oitrrwgg': {
      'en': 'Create your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Phone Number',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'What is your phone number?',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'ukubud9g': {
      'en': 'Male',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c7tjlt5q': {
      'en': 'Female',
      'ar': '',
      'de': '',
      'es': '',
    },
    '72ii0waq': {
      'en': 'What is your gender?',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'hw265g8c': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'ar': 'تخطي في الوقت الراهن',
      'de': 'Für jetzt überspringen',
      'es': 'Saltar por ahora',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Make Payment\n',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en': 'Make a paymnt seamlessly using your NFC enabled phone or card.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Fund Your Wallet',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Add funds from your bank account or card to your wallet effortlessly.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Start Transacting',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en': 'Pay bills, send money to friends, or pay merchants  hassle-free.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Continue',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'wih71x51': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'qk15nsmc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'iphvcuwc': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    'v2shqq3z': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'knu0nxbp': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '79au6dyg': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Card_cO
  {
    'xn2so8km': {
      'en': 'My Card',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '6t7n9ugd': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'gmj1ww88': {
      'en': 'Top-Up',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    'gvnhniyq': {
      'en': 'Top-Up',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Scan to Pay',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'dbx7mxvi': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'roobc02h': {
      'en': 'Tap-and-pay',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    'dewmngdt': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'c4nokd3e': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'm8rhanhc': {
      'en': 'Home',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_Budgets
  {
    'cd0zp71n': {
      'en': 'My Budget',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'hfwbiivj': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'jjj3ydb1': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    'ns4vt604': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'wcsc04wg': {
      'en': 'Spending',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'a5zzlh8f': {
      'en': '-\$8,392',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    '8xnbsdnb': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'c81i1ybg': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ah4t7cpx': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '0tsohlub': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'fn6kvat8': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '6uht91yb': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'ofz2zvlc': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'de': 'Einzelheiten',
      'es': 'Detalles',
    },
    'zv72ekdw': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'eeyn6dk2': {
      'en': 'When',
      'ar': 'متى',
      'de': 'Wann',
      'es': 'Cuándo',
    },
    'lccxx6eu': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'jzyax4hn': {
      'en': 'Spent by',
      'ar': 'أنفقه',
      'de': 'Verbracht von',
      'es': 'gastado por',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    'eojlfs66': {
      'en': 'Customer Care',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '55pnmij2': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i744mr67': {
      'en': 'Light ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bmq2eyyi': {
      'en': 'Dark',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // budgetDetails
  {
    'p0gf1lfy': {
      'en': 'Per Month',
      'ar': 'كل شهر',
      'de': 'Pro Monat',
      'es': 'Por mes',
    },
    'ti7ipegi': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ifi6fmsa': {
      'en': 'Transactions',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'es': 'Actas',
    },
    'ak9m8szp': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'l53kroui': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Payment Successful',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully made payment. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغير الحساب',
      'de': 'Account wechseln',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب **** 2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب **** 2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب **** 2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynie0pc5': {
      'en': 'Recipient',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'khb3703x': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    'xvj3fan8': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'wo9cebk7': {
      'en': 'Select Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rcevwwju': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uvrt7im0': {
      'en': 'Request Funds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    '7y89msg9': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudget
  {
    'smbfunwu': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'fcgw57wj': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'onjddqdc': {
      'en': 'Budget Name',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'g83gfmaf': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    '0iex13x2': {
      'en': 'Create Budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'ggn76zys': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '8hzaiw1r': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'mos068mm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Add Transaction',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'ohewrgsv': {
      'en': 'Spent At',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    '3170k9n1': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'abz6nm8z': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    '3y95vtb6': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    '861el4k4': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    'swxms7ln': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uqfgu088': {
      'en': 'Add Transaction',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '9stmpsf0': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Edit Transaction',
      'ar': 'تحرير المعاملة',
      'de': 'Transaktion bearbeiten',
      'es': 'Editar transacción',
    },
    '5xgwlwjj': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '720k2d98': {
      'en': 'Spent At',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'l3bqo3oh': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    '0lw03w43': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '3eftlbxd': {
      'en': 'Update Transaction',
      'ar': 'تحديث المعاملة',
      'de': 'Transaktion aktualisieren',
      'es': 'Actualizar transacción',
    },
    '4atjd0yh': {
      'en': 'Tap above to save your changes.',
      'ar': 'اضغط أعلاه لحفظ التغييرات الخاصة بك.',
      'de': 'Tippen Sie oben, um Ihre Änderungen zu speichern.',
      'es': 'Toca arriba para guardar tus cambios.',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '12if11ss': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'YourP',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'xvnmo5s8': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'ctc2xnqe': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla.\n\nEuismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit.\n\nEt malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // tutorial_PROFILE
  {
    'o6prpb1q': {
      'en': 'Create Acciun',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    '292pbdw7': {
      'en':
          'Sign up and verify your identity for a seamless and secure experience.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'b10xvuf9': {
      'en': 'Fund Your Wallet',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    't6k1smsm': {
      'en':
          'Add funds from your bank account or card to your wallet effortlessly.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    'u8xxj427': {
      'en': 'Begin Transacting!',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'iqi0pkmb': {
      'en':
          'Begin transacting! Pay transport fare, bills, send money to friends, or pay merchants  hassle-free.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'c10wb3ot': {
      'en': 'Your account Details are below.',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '6z1sm34j': {
      'en': 'Total Balance',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'c0dls4u5': {
      'en': '\$25,202',
      'ar': '25202 دولار',
      'de': '25.202 \$',
      'es': '\$25,202',
    },
    '30yef7fj': {
      'en': 'Payroll Due',
      'ar': 'الرواتب المستحقة',
      'de': 'Gehaltsabrechnung fällig',
      'es': 'Vencimiento de nómina',
    },
    'zrx9e6tv': {
      'en': '\$12,245',
      'ar': '12245 دولارًا',
      'de': '12.245 \$',
      'es': '\$12,245',
    },
    '1cjqanzg': {
      'en': 'Debit Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    '726vrs60': {
      'en': 'Aug 31, 2021',
      'ar': '31 أغسطس 2021',
      'de': '31. August 2021',
      'es': '31 de agosto de 2021',
    },
    '4dgbx46t': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'n87v5tth': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    'l5pw5c8c': {
      'en': '\$4,000',
      'ar': '4000 دولار',
      'de': '4.000 \$',
      'es': '\$4,000',
    },
    '7i0a44qa': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '9a2ya1la': {
      'en': '\$3,402',
      'ar': '3،402 دولار',
      'de': '\$3.402',
      'es': '\$3,402',
    },
    'n1o498d9': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    'lmo3ko2i': {
      'en': 'Quick Services',
      'ar': 'خدمات سريعة',
      'de': 'Schnelle Dienste',
      'es': 'Servicios rápidos',
    },
    '774itrkn': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'xs2as0vf': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'g8yaaa7f': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'nb29ps2o': {
      'en': '1 New Alert',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'View Now',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'pnvkw3b7': {
      'en':
          'We noticed a small charge that is out of character of this account, please review.',
      'ar': 'لقد لاحظنا تكلفة صغيرة خارجة عن طبيعة هذا الحساب ، يرجى المراجعة.',
      'de':
          'Wir haben eine kleine Belastung festgestellt, die für dieses Konto untypisch ist. Bitte überprüfen Sie diese.',
      'es':
          'Notamos un pequeño cargo que está fuera de lugar en esta cuenta, revíselo.',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    '30kx6e5v': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'hhyb9x4x': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'kg2tmby7': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    'rfozud9v': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'pcrarg0a': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'cdr5h4hx': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zmjsfzgg': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'dfjtbkbo': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Go Far Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'bj5qnrj5': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    'd1n5mbq7': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '2thn73jc': {
      'en': 'Go Far Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    '1fjdiibo': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'ld7s2fpn': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    'ft8bu1we': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '8t6ddwco': {
      'en': 'Go Far Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'td15kjsa': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'qmjqp9a6': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    '9qc797et': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    '8pdmehj2': {
      'en': 'Go Far Rewards',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'krrhjgc4': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '53m2u0s2': {
      'en': '\$50.00',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
    },
    'aks5zz4f': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // budget_DELETE
  {
    'pozov0xz': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'aptjmof0': {
      'en':
          'If you delete this budget, your transactions will no longer be associated with it.',
      'ar': 'إذا حذفت هذه الميزانية ، فلن تكون معاملاتك مرتبطة بها بعد الآن.',
      'de':
          'Wenn Sie dieses Budget löschen, sind Ihre Transaktionen nicht mehr damit verknüpft.',
      'es':
          'Si elimina este presupuesto, sus transacciones ya no estarán asociadas a él.',
    },
    '9l7pbjcj': {
      'en': 'Delete Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'u0kr38at': {
      'en': 'Tap above to remove this bude',
      'ar': 'انقر فوق لإزالة هذا bude',
      'de': 'Tippen Sie oben, um diese Bude zu entfernen',
      'es': 'Toque arriba para eliminar este bude',
    },
    'b1xp801p': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profilepage
  {
    'hhb6veym': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
      'de': 'Wallet-Guthaben',
      'es': 'Saldo de la cartera',
    },
    'fgf8icmv': {
      'en': '\$23,000',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    '2rrr446m': {
      'en': '3 currencies',
      'ar': '3 عملات',
      'de': '3 Währungen',
      'es': '3 monedas',
    },
    'r04m9nxs': {
      'en': 'My Bank',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '8nac51xz': {
      'en': 'Transfer',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    's56t3xya': {
      'en': 'Activity',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'vewa5op5': {
      'en': 'Bitcoin',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    'yla7uncg': {
      'en': '32% of portfolio',
      'ar': '32٪ من المحفظة',
      'de': '32 % des Portfolios',
      'es': '32% de la cartera',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opob20j8': {
      'en': 'Solona',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'fi3cleyj': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% of portfolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2io5lul': {
      'en': 'Dogecoin',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'krsyyttw': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '4mvfe3pe': {
      'en': '40% of portfolio',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // QrPayment
  {
    '13jykx93': {
      'en': 'Scan QR cdoe or  NFC card to make payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    '59y7acaz': {
      'en': 'Scan QR code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2t20aei': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xqsg43bj': {
      'en': 'Scan to Pay\n',
      'ar': '',
      'de': '',
      'es': '',
    },
    'palo9z4i': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Details39TransactionTransferResponsive
  {
    'si4zw3mr': {
      'en': 'Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lr88vwb1': {
      'en': '\$5,201.02',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kqi344r6': {
      'en': 'Add Money',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dkp3m3xk': {
      'en': 'Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    't2yw7qtp': {
      'en': 'Primary Card',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p3yj4e6j': {
      'en': '•••• 4213',
      'ar': '',
      'de': '',
      'es': '',
    },
    'odu9sgnk': {
      'en': '\$5,212.00',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b4ddgcou': {
      'en': 'Secondary Card',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fh4skzi7': {
      'en': '•••• 4621',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kkm701wo': {
      'en': '\$2,502.20',
      'ar': '',
      'de': '',
      'es': '',
    },
    '18ophbei': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '50jxfhku': {
      'en': 'Google Services',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3pw4eje6': {
      'en': 'Today, 4:32pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jxpwuupz': {
      'en': '\$175.41',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zpp4jkmq': {
      'en': 'FB Messenger',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yk4ueas4': {
      'en': 'Today, 4:32pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mn80wjnj': {
      'en': '\$52.01',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hlr6v6lm': {
      'en': 'FB Messenger',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9lthhz4g': {
      'en': 'Today, 4:32pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fd36en2y': {
      'en': '\$52.01',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nspgzpvl': {
      'en': 'FB Messenger',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0wws4mgb': {
      'en': 'Today, 4:32pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y9xntwb5': {
      'en': '\$52.01',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4mwl4z8': {
      'en': 'FB Messenger',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qxu52ke6': {
      'en': 'Today, 4:32pm',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3bz0jiyi': {
      'en': '\$52.01',
      'ar': '',
      'de': '',
      'es': '',
    },
    'trbazq09': {
      'en': 'Transfer Money',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a7r7ibu4': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // blank
  {
    '5ooecgos': {
      'en': 'Page Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o4h9m08p': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // makePayment
  {
    'f90m7igx': {
      'en': 'Make Payment',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'h8z44gjz': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'sox02r9v': {
      'en': 'sender Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'at6dfkej': {
      'en': 'receiver Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'bcjd2r68': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    't1z8z8jw': {
      'en': 'Proceed',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'ufty9336': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '4cdqu7ki': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '4ng36hk3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // NewQrPayment
  {
    'xwfcuyrz': {
      'en': 'Scan QR cdoe or  NFC card to make payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mswv32so': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k6wq77pl': {
      'en': 'Scan to Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ou7qhlnc': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // scanMakePayment
  {
    'oorj4oed': {
      'en': 'Make Payment',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '1sqgrutk': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'yeyhvtuw': {
      'en': 'sender Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'ov3mofgy': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'ubdxqadu': {
      'en': 'Proceed',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'af29cl03': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'jn6n3jm4': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'ig8b5dqr': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // secondScanMakePayment
  {
    '12xzs7pl': {
      'en': 'Make Payment',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'v7pek2j1': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '6fg3vich': {
      'en': 'sender Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'bnl94h38': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    '089jcdce': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    '1skd5fpa': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'vghwh825': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    'y1zzkgv4': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '5i8q2zht': {
      'en': 'Proceed',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bvsnpvbf': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'yy9i0fqw': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'cjxui8yw': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // paymentComplete
  {
    'fhtl1sh5': {
      'en': 'Payment Confirmed!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '23r62zkr': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ojxja5p6': {
      'en': 'Paid to Nasir',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v7g8ffiq': {
      'en': '\$425.24',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6lexdf6l': {
      'en': 'Go Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sp8bi40n': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // qwerty
  {
    'jiopcuf3': {
      'en': 'Scan QR Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm0idw37b': {
      'en':
          'Place the QR code within the frame to scan. Please make sure the QR code is clearly visible.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'upl02yma': {
      'en':
          'Place the QR code within the frame to scan. Please make sure the QR code is clearly visible.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fum9c7sh': {
      'en': 'Make Payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    '08xvbjr3': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Home24BankFintechDashboard
  {
    'a3wxao7g': {
      'en': '2.54%',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pe5c737c': {
      'en': ' from last week',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nsq4jxqn': {
      'en': 'My Portfolio',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j04c2isu': {
      'en': 'Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pt1v3kpp': {
      'en': '\$7,630',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rejvslcq': {
      'en': '**** 0149',
      'ar': '',
      'de': '',
      'es': '',
    },
    'acn8q2d2': {
      'en': '05/25',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zk17lomr': {
      'en': 'Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'egjs4fos': {
      'en': '\$14,502',
      'ar': '',
      'de': '',
      'es': '',
    },
    '74e20rdg': {
      'en': '**** 0149',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4l6au6zg': {
      'en': '05/25',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j8r411yx': {
      'en': 'Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yf58td6w': {
      'en': '\$7,630',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6bei1ogn': {
      'en': '**** 0149',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5kqcwlfi': {
      'en': '05/25',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3q2t7lnt': {
      'en': 'Send',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kwqozmb5': {
      'en': 'Recieve',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hr9yrm98': {
      'en': 'Add Funds',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9wr3b45x': {
      'en': 'More',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uc4e8oj4': {
      'en': 'Transaction History',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o97hg488': {
      'en': 'A list of historical transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qrc4yadl': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7b19pwjp': {
      'en': 'Income',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pk80opy5': {
      'en': 'Expenses',
      'ar': '',
      'de': '',
      'es': '',
    },
    '737nlrwx': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4qm1tee': {
      'en': 'JoeMoe Coffee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'amevs9xb': {
      'en': 'Paid with: Visa **** 2192',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y2zv9fyh': {
      'en': '\$50.21',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5wh7z17c': {
      'en': 'JoeMoe Coffee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uod58x2z': {
      'en': 'Paid with: Visa **** 2192',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lb47lpqr': {
      'en': '\$50.21',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vpfh22jk': {
      'en': 'JoeMoe Coffee',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ktifoxt5': {
      'en': 'Paid with: Visa **** 2192',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zlpzvec1': {
      'en': '\$50.21',
      'ar': '',
      'de': '',
      'es': '',
    },
    'irao1vpn': {
      'en': 'Total asset value',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mr8fd8q8': {
      'en': '\$244,204',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gm2nksrn': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // MY_Card
  {
    'msmxld6u': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'cm93vhg8': {
      'en': 'Your latest updates are below.',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'ygqzyh9w': {
      'en': 'wuri',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'npfpl9c5': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'pqh7gxi9': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'ol5xcdcd': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'tgovlhmf': {
      'en': 'Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zt89ekqf': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c1b12k88': {
      'en': 'Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a4jkth3t': {
      'en': 'Fund',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yz9roa2u': {
      'en': 'More',
      'ar': '',
      'de': '',
      'es': '',
    },
    'otuhmj6j': {
      'en': 'Recent Card Transactions',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'eimekw11': {
      'en': 'Successful',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '1v4f2udt': {
      'en': 'Home',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // QrPaymentCopy
  {
    'el8i8t28': {
      'en': 'Scan QR cdoe or  NFC card to make payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    'riu4qogd': {
      'en': 'QR code details\n',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cedgr2pv': {
      'en': 'Scan QR code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ozd4tf3p': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'alsl3h00': {
      'en': 'Scan to Pay\n',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qaikff45': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // TopUPHistory
  {
    'bi85az5e': {
      'en': 'Recent Top-Up',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm2nnjjj9': {
      'en': 'Below are your most recent orders',
      'ar': '',
      'de': '',
      'es': '',
    },
    '50wpiofr': {
      'en': 'Agent ID #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wwsk8vwj': {
      'en': '429242424',
      'ar': '',
      'de': '',
      'es': '',
    },
    '47nakh3o': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8cbu2dqv': {
      'en': '2.5 units',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cmo9r3tb': {
      'en': 'N1,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cduy4vxb': {
      'en': 'Pendin',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1kbjcvgc': {
      'en': 'Agent ID #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '73ykah1i': {
      'en': '429242424',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pasm5qs7': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0pkeb4sb': {
      'en': '2.5 units',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ilpp86ou': {
      'en': 'N1,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'anwmkjdz': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7ddq30r2': {
      'en': 'Agent ID #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hxrm3q82': {
      'en': '429242424',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tusr0zjh': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4urz9gws': {
      'en': '2.5 units',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mosepobd': {
      'en': 'N1,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q8e4fr83': {
      'en': 'Recevied',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gb6wbxah': {
      'en': 'Agent ID #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'an2vbsfd': {
      'en': '429242424',
      'ar': '',
      'de': '',
      'es': '',
    },
    'geuxbg2a': {
      'en': 'Mon. July 3rd',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fl4tsfjl': {
      'en': '2.5 units',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd9ggpiza': {
      'en': 'N1,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'doh4dera': {
      'en': 'Received',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0g35qx8p': {
      'en': 'Cards',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // cart_successPage
  {
    'a0z8g8gt': {
      'en': 'Order Placed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'unyq6ekv': {
      'en': 'Successfully!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ctdyoc0m': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2e5b8oo5': {
      'en': 'View Orders',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4q1al14c': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // scanQRP
  {
    '8khics9a': {
      'en': 'Qr Scanner',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'c8up0zjl': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e2zzyg3y': {
      'en': 'Click to Scan ',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'r45go8m5': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'ivxash8x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // scanMakePaymentTwo
  {
    'sx0sbhw3': {
      'en': 'Make Payment',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'buceylw9': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'iluuf734': {
      'en': 'sender Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'ot4tc08c': {
      'en': 'receiver Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'agt2dx34': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '00almbni': {
      'en': 'Proceed',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'v99v9g9s': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'd9r2ooit': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '0q9hz3fs': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // makePaymentCopy
  {
    '0g405wva': {
      'en': 'Make Payment Copy',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'rmsa82c1': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'm870g5ai': {
      'en': '10',
      'ar': '',
      'de': '',
      'es': '',
    },
    '19g3pof0': {
      'en': 'receiver Wallet ID',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
    },
    'qz1g61km': {
      'en': 'Reason',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    '43wm351v': {
      'en': 'Proceed',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'icnv2p2m': {
      'en': 'Tap above to complete request',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '4nee2lha': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'tcv5it2t': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // support_TicketList
  {
    'e13qwyse': {
      'en': 'Below are a list of recent tickets created',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fk5g0tth': {
      'en': 'Ticket #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i59gopug': {
      'en': 'Support Tickets',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hsgzcmyc': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // support_SubmitTicket
  {
    '2g520kfe': {
      'en': 'Create a Ticket',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u4szgqe1': {
      'en': 'Fill out the form below to submit a ticket.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qsh2gokx': {
      'en': 'Call Us',
      'ar': '',
      'de': '',
      'es': '',
    },
    's501o359': {
      'en': 'Email Us',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ok7bqiw9': {
      'en': 'What is going on?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p32i4v5v': {
      'en': 'Short Description of what is going on...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7syovwdb': {
      'en': 'Choose a priority level',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ch9ug0o': {
      'en': 'Emergency',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3ecv1q1x': {
      'en': 'High',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e7q0wc94': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    '44hhdzo1': {
      'en': 'Low',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x4nhgpy1': {
      'en': 'Low',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jesdjem1': {
      'en': 'Upload Screenshot',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7ngpb6s7': {
      'en': 'Submit Ticket',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tefz1ae6': {
      'en': 'Support',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // support_TicketDetails
  {
    '2lo5xpa1': {
      'en': 'Ticket Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7fqyhbp5': {
      'en': 'Ticket #: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w99ug7on': {
      'en': 'Below are the details of this support ticket.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gggxacn1': {
      'en': 'Description',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jq9iuoi7': {
      'en': 'Submitted on',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dol2ficg': {
      'en': 'Last Edited',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5tu5t56c': {
      'en': 'Status',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sexkavq1': {
      'en': 'Pending',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5b9bzlp0': {
      'en': 'In Progress',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ie7rtxb': {
      'en': 'Complete',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u379kk54': {
      'en': 'Submitted',
      'ar': '',
      'de': '',
      'es': '',
    },
    'slvxx05l': {
      'en': 'Please select...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ryrcxeon': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v0u03u11': {
      'en': 'Assigned to',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k4eolgdr': {
      'en': 'Submitted By',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tedmdcdy': {
      'en': 'Developer Note (delete this)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u4elnyis': {
      'en':
          'You will have to change the reference above to link to your \"users\" collection if you don\'t already have it, you can utilize the collection added with this flow.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hrxla4kf': {
      'en': 'Assign',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sapm8jhe': {
      'en': 'Update Ticket',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // myAcc
  {
    't6ess5uq': {
      'en': 'Fund Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    '52coozbu': {
      'en': 'Account Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tex4jc67': {
      'en': 'Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '66lkw43v': {
      'en': 'Bank Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cxksm9ir': {
      'en': 'ZENITH  BANK PLC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xa1nb2pc': {
      'en': 'Account Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rf6oc7qg': {
      'en': 'NASIR IBRAHIM JAAFAR',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h0xxg5ey': {
      'en': 'Account Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r55aen0t': {
      'en': '2252856592',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q2ju0pr6': {
      'en': 'Copy details',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Cards
  {
    'sgv3exs7': {
      'en': 'wuri',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'kyt0ye20': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'rxacrlg4': {
      'en': 'Active',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'fuwonow9': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    '8gujx72k': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    'y5qae09l': {
      'en': 'Add Card  +',
      'ar': '',
      'de': '',
      'es': '',
    },
    '63jxbhzd': {
      'en': 'Cards',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cdcpqp2o': {
      'en': 'Cards',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // auth_3_Create
  {
    'srnu0ezn': {
      'en': 'wuri.ng',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8c7fh2re': {
      'en': 'Create an account',
      'ar': '',
      'de': '',
      'es': '',
    },
    '314s7b2x': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1pun35ye': {
      'en': 'Email',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm0r0awb4': {
      'en': 'Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zydmiwmg': {
      'en': 'Confirm Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0tqmm812': {
      'en': 'Create Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1a70iyu3': {
      'en': 'Already have an account? ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9j3552gr': {
      'en': 'Sign In here',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nhc0h15w': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // auth_3_Login
  {
    'gtj0v2dr': {
      'en': 'wuri.ng',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qbx76u0i': {
      'en': 'Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    'omf2jy0m': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '27o7tlzm': {
      'en': 'Email',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7eschbvk': {
      'en': 'Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8ayrfbe7': {
      'en': 'Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zrsgmyez': {
      'en': 'Don\'t have an account? ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h4qtsjev': {
      'en': 'Sign Up here',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2531ezfe': {
      'en': 'Forgot Password? ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b6oup9q5': {
      'en': 'Reset It Now',
      'ar': '',
      'de': '',
      'es': '',
    },
    '03hionjz': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // auth_3_phone
  {
    'g5c6z353': {
      'en': 'flow.io',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cnnt92ix': {
      'en': 'Login with Phone',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u0047ou3': {
      'en': 'Input your number below in order to login.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2mtwskih': {
      'en': 'Your phone number...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8f4h0t3v': {
      'en': 'Continue',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zvjro24y': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // auth_3_verifyPhone
  {
    'v1el18v1': {
      'en': 'flow.io',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm8f1wlcj': {
      'en': 'Verification Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hbhc7gxv': {
      'en': 'Enter the 6 digit code that you received at: ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nytx8pzt': {
      'en': ' change number?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hfr6c32u': {
      'en': 'Verify Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nrjkri8w': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // auth_3_ForgotPassword
  {
    'a6ihpvlj': {
      'en': 'wuri.ng',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p3d36r6r': {
      'en': 'Forgot Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ccvy6t49': {
      'en': 'Enter your email below in order be sent a reset password link.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tg2u9w8l': {
      'en': 'Your email address...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9xgsmeyp': {
      'en': 'Send Reset Link',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q6oioc6t': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Profile16SimpleProfile
  {
    'nz7e67y3': {
      'en': 'My Account Information',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k4rme7zh': {
      'en': 'Change Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0pkcwmh5': {
      'en': 'Edit Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rfmqumgt': {
      'en': 'Support',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dgy84eoy': {
      'en': 'Submit a Bug',
      'ar': '',
      'de': '',
      'es': '',
    },
    '73wv5snn': {
      'en': 'Submit a Feature Request',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nyzytmv6': {
      'en': 'Light ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '70lev861': {
      'en': 'Dark',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2w971mao': {
      'en': 'Log Out',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hi44xhsw': {
      'en': 'My Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    '590e7eto': {
      'en': '__',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // succ
  {
    'mqrzd0c2': {
      'en': 'Congrats!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jexxve20': {
      'en': 'Quiz Results Submitted',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fklo2l05': {
      'en': 'You completed a quiz from:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ngkzqnr1': {
      'en': 'Abigail Rogers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n8k6twk2': {
      'en': 'abigail.rogers@domain.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ouy0tgco': {
      'en': 'Go Home',
      'ar': '',
      'de': '',
      'es': '',
    },
    '56cvlzsj': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // nfcRead
  {
    'zqudoqlw': {
      'en': 'NFC Reader',
      'ar': '',
      'de': '',
      'es': '',
    },
    '10hxma8t': {
      'en': 'Scan your NFC tag to proceed',
      'ar': '',
      'de': '',
      'es': '',
    },
    'at16tfd9': {
      'en': 'Ready to Scan',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير موعد',
      'de': 'Termin bearbeiten',
      'es': 'Editar cita',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
      'de': 'Bearbeiten Sie die Felder unten, um Ihren Termin zu ändern.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija Fecha',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Material2ActionSheetSimple
  {
    'awaeazeg': {
      'en': 'Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nri7ub7b': {
      'en': 'Scan to Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zjy0cd3h': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    '36pkjtah': {
      'en': 'NFC',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // PaymentOptionSheet
  {
    '29ou06e2': {
      'en': 'Scan QR',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5d37ntr6': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // MainActionSheet
  {
    'zrz502na': {
      'en': 'Send',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fgwvsnb8': {
      'en': 'QR Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hfxd4gfx': {
      'en': 'Tap NFC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yen3587g': {
      'en': 'More',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Toast01
  {
    'gzcwq6l3': {
      'en': 'Notification Title',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hup806vd': {
      'en': 'Some body copy that is present in this small notification.',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // setPriority_Menu
  {
    'n3b4g7au': {
      'en': 'Set Priority Level',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tmz1razv': {
      'en': 'Emergency',
      'ar': '',
      'de': '',
      'es': '',
    },
    '07dhcwwx': {
      'en': 'High',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ypstc861': {
      'en': 'Medium',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6eipg1hj': {
      'en': 'Low',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // user_ListSmall_1
  {
    'upbzjnfn': {
      'en': 'ME',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // user_List
  {
    '0ipxj13a': {
      'en': 'Assign User',
      'ar': '',
      'de': '',
      'es': '',
    },
    'emno98nr': {
      'en': 'Select a user from the list below to continue.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w6oqf125': {
      'en': 'Close',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Action2SheetSimple
  {
    'jv9jtzv0': {
      'en': 'Scan to Pay',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ouo6nago': {
      'en': 'Direct Payment',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4mi34cm3': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Action2SheetSimplev
  {
    'osqiv82h': {
      'en': 'Edit Post',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e0di2kj0': {
      'en': 'Delete Story',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4uue0669': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Modal09Basic
  {
    'ynxcfdju': {
      'en': 'Refine the components modal.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1abf42kz': {
      'en':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. With its drag-and-drop interface and pre-built components, you can quickly prototype and build your app without writing any code. \nAdditionally, FlutterFlow\'s real-time preview feature allows you to see your changes in real-time and make adjustments on the fly.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5piwgoaw': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rjfca48r': {
      'en': 'Create Task',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // TapNfc
  {
    '5dcyuhqq': {
      'en': 'Ready to scan NFC',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2r9s6z5f': {
      'en': 'in oder scan nfc',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6d51nrxo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eakkamon': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ybui23if': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6cqmtgrm': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7xfvvgi1': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rh59xvi4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u5zn54zq': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9hdm92b4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p1sd1v6o': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ws3df6uw': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'afrc0s43': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
