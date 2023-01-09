// 📦 Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:akm/app/modules/login-page/controllers/login_page_controller.dart';
import 'package:akm/firebase_options.dart';

// For web based
// const baseUrl = 'http://127.0.0.1:3000/api/v1/';

// For mobile based

// const baseUrl = 'http://10.0.2.2:3000/api/v1/';

// check if platform is web

// For tethering
// const baseUrl = 'http://192.168.42.148:3000/';

// For wifi
// const baseUrl = 'http://192.168.100.79:3000/';

// for ngrok
// const baseUrl =
//     'https://a7c0-2001-448a-4042-4f35-8424-246-2c77-5cda.ap.ngrok.io/api/v1/';

const baseUrl = 'https://akm-backup-one.vviia.repl.co/api/v1/';

// List debitur field string
const field =
    'peminjam1,bidang_usaha,jenis_usaha,tgl_sekarang,umur,ktp1,progress,userId';

LoginPageController loginPageController = LoginPageController.instance;

FirebaseAuth auth = FirebaseAuth.instance;

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

// Initiialize shared preferences

final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

// Insight debitur query string
const joinTable =
    'join=inputNeraca&join=inputRugiLaba&join=inputKeuangan&join=analisaKeuangan&join=analisaKarakter&join=analisaBisnis&join=analisaJenisUsaha&join=agunan&join=agunan.form_tanah&join=agunan.form_kendaraan&join=agunan.form_los&join=agunan.form_peralatan&join=agunan.form_cash&join=agunan.form_lainnya&join=agunan.form_tanah_bangunan&join=syaratLain&join=analisaAgunan&join=ijinLegitimasi&join=asuransi&join=upload';
