import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxcHJ4eHR4d2Zkc2FzY3pnbnV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNTQwMTIsImV4cCI6MjAzMzYzMDAxMn0.xoq30Ug3OHCCxhYZwaCFAmxWID_UszOuOzK8yVZOAoI';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxcHJ4eHR4d2Zkc2FzY3pnbnV4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgwNTQwMTIsImV4cCI6MjAzMzYzMDAxMn0.xoq30Ug3OHCCxhYZwaCFAmxWID_UszOuOzK8yVZOAoI';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
