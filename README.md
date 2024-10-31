# suvido.interview
Interview project repository for a simplistic e-shop application with following instructions

### Project Instructions
- Features are : Product, Categories and Basket where
    - Each product should have at least one category
    - Basket should be avaliable when application is offline
    - On Basket Screen, products should be shown seperated by their categories
    - For each product added from the same category, other products in the basket should be discounted by 5%.
    - There should be a maximum cost limit for basket, whether this limit is exceeded application should suggest the best viable product to drop in order to catch the limit
        - Priority should be given to removing more than one in the same category from the basket

### Project Roadmap
- [ ] Mobile Application
    - [ ] Construct Project Core (Shared)
        - [x] Project Core Dependencies
        - [x] Project Dummy Variables (Onboarding Content)
        - [x] Project Core Enums
        - [x] Project ThemeData
    - [ ] Construct Shared Screens
        - [x] Project Onboarding Screen
        - [ ] Project Login Screen
        - [ ] Project Home Screen with Bottom Navigation
    - [ ] Construct Features
        - [ ] Authentication// User
        - [ ] Catalog Feature
            - [ ] Product
            - [ ] Category
        - [ ] Basket Feature
            - [ ] Hive Repo


## Project Structure


### :white_small_square: Project Scope and System Design Description

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
$ git clone https://github.com/ilkerciblak/suvido.interview.git
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

- [A Reddit Discussion on Flutter Architectures](https://www.reddit.com/r/FlutterDev/comments/192h8l0/how_do_you_architect_your_flutter_apps_research/)

- [Flutter Singleton pattern and Get-it](https://salmanbediya-medium-com.translate.goog/getit-simplifying-dependency-injection-with-service-locator-pattern-in-dart-and-flutter-62a2d7d105b8?_x_tr_sl=en&_x_tr_tl=tr&_x_tr_hl=tr&_x_tr_pto=tc&_x_tr_hist=true)

- [UI Inspirations](https://dribbble.com/)

- [Public APIs Repository on GitHub](https://github.com/public-apis/public-apis?tab=readme-ov-file#shopping)

