enum SignUpStatus { successful, failed, pending, exists }
enum LoginStatus { pending, successful, exists, noUser, wrongPassword, failed }

const String dbName = 'courses';
const String usersDbName = 'users';
