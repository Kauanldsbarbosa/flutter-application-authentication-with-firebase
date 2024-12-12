# flutter-application-authentication-with-firebase
A Flutter app with Firebase authentication, using the architecture recommended by Flutter developers. Includes secure token storage, form validation, state management with Provider, and seamless API integration. A robust base for secure and scalable apps.


---

# Flutter Firebase Authentication

**Flutter Firebase Authentication** is a mobile application built with Flutter that implements a complete authentication system using Firebase as the backend. It provides a robust foundation for mobile apps requiring secure login and token storage.

## 🚀 Features

- **User Registration**: Allows new users to create an account.
- **Email and Password Login**: Secure authentication using user credentials.
- **Session Management**: Secure token storage using `SecureStorageService`.
- **Form Validation**: Ensures valid inputs for email and password fields.
- **Detailed Error Messages**: Provides clear feedback in case of errors, such as incorrect password or invalid email.
- **Firebase Integration**: Leverages Firebase Authentication API for user management and login.

## 🛠️ Technologies Used

- **Flutter**: UI development framework.
- **Firebase Authentication**: User login and authentication management.
- **Secure Storage**: Securely stores sensitive data such as authentication tokens.
- **Http Package**: For REST API requests.
- **Provider**: State management using the `ChangeNotifier` pattern.

## 📦 Project Structure

```
lib/
├── services/          # API communication and secure storage
├── view_models/       # Business logic (e.g., LoginViewModel)
├── ui/                # UI components and application screens
├── routes/            # Route and navigation configuration
└── main.dart          # Application entry point
```

## 🎯 Project Goal

This project aims to provide a simple and efficient foundation for integrating Firebase authentication into Flutter apps. It can be used as a starting point for larger projects or as a guide to learn about Firebase integration with Flutter.

## 📝 Requirements

- Flutter SDK (>= 2.0)
- Firebase configured in the project
- Dependencies installed via `pub get`

## 💻 Setup and Run

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/flutter-firebase-authentication.git
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter-firebase-authentication
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase following the instructions in the [Firebase for Flutter Guide](https://firebase.flutter.dev/).
5. Add your Firebase token to a `.env` file in the project root. Example:
   ```env
   FIREBASE_TOKEN=your_firebase_token_here
   ```
6. Run the application:
   ```bash
   flutter run
   ```

## 🛡️ Security

This project uses secure storage for tokens and follows best practices for authentication. However, ensure you adjust Firebase security settings as needed for your specific use case.
