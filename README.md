# jotub_app

A new Flutter project.

## Getting Started
- Required: Flutter version 3.16.5
## Architecture
The application using Clean Architecture and use BLoc for state management.
![project Architecture](https://www.google.com/url?sa=i&url=https%3A%2F%2Fflutterawesome.com%2Fflutter-project-using-clean-architecture-and-bloc-pattern%2F&psig=AOvVaw1z6wv4XovpdGxyfrsPmdYl&ust=1710828697704000&source=images&cd=vfe&opi=89978449&ved=0CBUQjhxqFwoTCOCwktuT_YQDFQAAAAAdAAAAABAD)
- [Clean Architecture](https://betterprogramming.pub/the-clean-architecture-beginners-guide-e4b7058c1165)
- [BLoc Management](https://bloclibrary.dev/)

## Technical
- The project using:
    - [Bloc](https://pub.dev/packages/flutter_bloc)
    - [Shared_preferences](https://pub.dev/packages/shared_preferences)
    - [json_serializable](https://pub.dev/packages/json_serializable)
    - [json_annotation](https://pub.dev/packages/json_annotation)
    - [retrofit](https://pub.dev/packages/retrofit)
    - [dio](https://pub.dev/packages/dio)
    - [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- and more library in [pub.dev](https://pub.dev/)

## Generate to splash screen
```sh
flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml
```

## Generate .g.dart file
Open Terminal and using:
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

## For Build APK
```sh
flutter build apk
```

## For Build IOS
```sh
flutter build ios
```
## For intl
```sh
flutter pub global activate intl_utils 

flutter pub global run intl_utils:generate
```
