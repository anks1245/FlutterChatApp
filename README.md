# Flutter Chat App

## Overview

This is a Flutter chat application where users can:

- Chat with others
- View and post stories
- Receive and view compliments on their stories

### :rocket: Features

- **User Authentication**: Secure login and signup functionality.
- **Stories**: Users can post and view stories.
- **Compliments**: View compliments received on posted stories.
- **Chat**: Real-time chat functionality.
- **Shimmer Loader**: Used for loading states to improve user experience.

## Tech Stack

- **Flutter**: Frontend framework
- **Dio**: API calling
- **Shimmer**: Used for loading placeholders
- **State Management**: SetState/Provider (based on implementation)
- **Networking**: REST API integration

### :open_file_folder: Folder Structure

```
lib/
│── assets/        # Contains images and other assets
│── models/        # Data models for the app
│── screens/       # UI screens of the app
│── services/      # API calls and business logic
│── utils/         # Helper functions and constants
│── widgets/       # Reusable UI components
│── main.dart      # Entry point of the application
```

### :tools: Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.0.0
  shimmer: ^3.0.0
```

### :pushpin: How to Run the Project

* Clone the repository `https://github.com/anks1245/FlutterChatApp.git`
* Install dependencies: `flutter pub get`
* Run the application: `flutter run`
