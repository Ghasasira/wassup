# Wassup Messenger App

Wassup is a real-time messenger app developed using Flutter, Firebase for the backend, and GetX for state management. This README provides an overview of the app, its features, and instructions for setting up and running the project.

## Features

- **Real-time Messaging**: Wassup allows users to send and receive real-time messages instantly.
- **User Authentication**: Users can create accounts, sign in, and reset their passwords securely.
- **User Profiles**: Users can update their profiles with profile pictures and personal information.
- **Group Chats**: Wassup supports group chats where multiple users can participate in a single conversation.
- **Push Notifications**: Users receive push notifications for new messages even when the app is in the background.
- **Message Encryption**: Messages are encrypted for user privacy and security.
- **Online/Offline Status**: Users can see when their contacts are online or offline.

  ## Demo
  To be added

## Getting Started

To run Wassup on your local machine, follow these steps:

1. **Prerequisites**: Make sure you have Flutter and Dart installed. You can install them from [flutter.dev](https://flutter.dev/docs/get-started/install).

2. **Firebase Setup**:
   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add your Android and iOS apps to the project and download the config files.
   - Place the config files in the respective folders of your project.
   - Enable Firebase Authentication, Firestore, and Firebase Cloud Messaging in your Firebase project.
   
3. **Clone the Repository**:


4. **Navigate to the Project Folder**:


5. **Install Dependencies**:


6. **Run the App**:


## Configuration

For Firebase configuration, add the Firebase project's config files to the following locations:

- For Android: `/android/app/google-services.json`
- For iOS: `/ios/Runner/GoogleService-Info.plist`

## Usage

1. Launch the Wassup app on your device.
2. Create an account or sign in.
3. Start messaging with your contacts or create group chats.
4. Enjoy real-time messaging and stay connected with your friends and family.

## Project Structure

The project structure is organized as follows:

- `/lib`: Contains the main application code.
- `/lib/controllers`: Controllers for various app functionalities using GetX.
- `/lib/models`: Data models and classes.
- `/lib/services`: Firebase and other services for data management.
- `/lib/views`: User interface components and screens.
- `/lib/widgets`: Reusable widgets and components.

## Contributing

If you would like to contribute to this project, please follow these guidelines:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Make your changes and test them thoroughly.
4. Submit a pull request with a clear description of the changes.

## License

This project is licensed under the MIT License.

## Contact

If you have any questions or feedback, please feel free to contact the project maintainers:

- Gasasira Joshua
- gasasiraj013@outlook.com
- Project Repository: [GitHub Repository](https://github.com/Ghasasira/wassup-messenger)

Thank you for using Wassup, and we hope it helps you stay connected with your friends and loved ones!
