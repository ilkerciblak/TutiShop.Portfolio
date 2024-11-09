# suvido.interview

An experimental project repository that will include a Asp.Net API Project with Microservice or Modular Monolith Architecture and a Mobile Application built with Flutter Framework also with Clean Architecture.



### Project Scope and Purpose
First of all, main goal of the project is practicing Design Patterns and some development technologies. Actually, mobile application and API projects have different goals to be achieved.

-   To develop an flutter template repository using this project as an experimental project
-   To develop an portfolio project for both backend and frontend technologies
-   To develop a backend project to improve backend skills




### Project Roadmap
- [ ] Mobile Application
    - [x] Construct Project Core (Shared)
        - [x] Project Core Dependencies
        - [x] Project Dummy Variables (Onboarding Content)
        - [x] Project Core Enums
        - [x] Project ThemeData
    - [x] Construct Shared Screens
        - [x] Project Onboarding Screen
        - [x] Project Login Screen
        - [x] Project Home Screen with Bottom Navigation
    - [ ] Construct Features
        - [x] Authentication// User
        - [x] Catalog Feature
            - [x] Product
            - [x] Category
        - [ ] Basket Feature
            - [ ] Hive Repo

    - [ ] Next Todos
        - [ ] Secure Shared Preferences
        - [ ] Secure Shared Preferences implementation on Authentication
        - [ ] Authentication Consumer Flow that Based on Refresh Token
            - Auth Manager tekil bir sey degil her sikko servis icin bir manager kullandik  
        - [ ] Implement Error Statuses
        - [ ] Go on to Basket Feature
# Project Structure

## Mobile Application

> [!Note]
> This part will be transferred to mobile_application's readme file.

### :white_small_square: System Design Description

<!-- TODO --> 

later

<br/>

<!-- ### :white_small_square: Tech Stack
// Client - Server - DevOps - Db Teknolojileri hakkinda yaz
- Mobile Application : Flutter Framework

<br/> -->

### :white_small_square: Environment Variables

> [!Note]
> There are no environment variable for now to configure

<br/>

### :white_small_square: Dependencies
- Flutter 3.24.4
- XCode and/or Android Studio Simulators

<br/>

### :white_small_square: Installation and Running Project Locally

Clone the project
```bash
$ git clone https://github.com/ilkerciblak/TutiShop.Portfolio.git
```

Go to the Mobile Application Directory
```bash
$ cd mobile_application/suvido_eshop
```

Run the application with flutter cli
```bash
$ flutter run
```

<br/>

### :white_small_square: Used Packages and APIs
- [DummyJson API](https://dummyjson.com) : Free Fake REST API for Placeholder JSON Data, where project fetches product, catalog information and mimics authentication.
- [Get-It](https://pub.dev/packages/get_it) : a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired. 
- [Bloc](https://pub.dev/packages/bloc): A dart package that helps implement the BLoC pattern.
- [Hive](https://pub.dev/packages/hive): Hive is a lightweight and blazing fast key-value database written in pure Dart.
- [Go-Router](https://pub.dev/packages/go_router): A declarative routing package for Flutter that uses the Router API to provide a convenient, url-based API for navigating between different screens

### :white_small_square: Resources and Acknowledgements
- [Medium - Flutter Architectures Deep Dive](https://medium.com/@yusrasajjad613/architecture-patterns-in-flutter-an-in-depth-guide-0ca2d65c723c)

- [Medium - Optimizing Network Images in Flutter](https://medium.com/make-android/save-your-memory-usage-by-optimizing-network-image-in-flutter-cbc9f8af47cd)

- [A Reddit Discussion on Flutter Architectures](https://www.reddit.com/r/FlutterDev/comments/192h8l0/how_do_you_architect_your_flutter_apps_research/)

- [Flutter Singleton pattern and Get-it](https://salmanbediya-medium-com.translate.goog/getit-simplifying-dependency-injection-with-service-locator-pattern-in-dart-and-flutter-62a2d7d105b8?_x_tr_sl=en&_x_tr_tl=tr&_x_tr_hl=tr&_x_tr_pto=tc&_x_tr_hist=true)

- [UI Inspirations](https://dribbble.com/)

- [Public APIs Repository on GitHub](https://github.com/public-apis/public-apis?tab=readme-ov-file#shopping)
