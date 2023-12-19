# flutter_advisor_clean_architecture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

C80 - Since we are managing from an exception to a message in UI, we create the types of Exception we may have in our app. At least the ones we know and then general one. That exception then escalates up as Failures up to the point State Management track it to Error Messages to the User. 

C81 - Up To Now We have things built somewhat dependent on their concrete instances, aside from Failures, Exceptions and may repositories. But pretty much things been depoendent on each other. Can't be. This class C81 introduces Dependency Injection. With dependency injection, our app will be much more testable, maintanable and each layer will be even more modular. That applies for individual components too. 

We start by giving dependencies in constructor:
    - in advice_remote_datasource (data) triggers the need in advice_repository_impl (data)
    - in advice_repository_impl (data) triggers the need in advice_usecases (domain)
    - in advice_usecases (domain) triggers the need in advice_cubit (presentation)

In order to manage injections and injection contaziner, we will use get_it package.

