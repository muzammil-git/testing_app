# What I learned
- To create widget tests using the widget testing framework
- To create an integration test to test the app's UI and performance using the integration_test library
- To test data classes (providers) with the help of unit tests

# Performing Test On
- Unit tests to validate the add and remove operations
- Widgets tests for the Landing and favorites pages
- UI and performance tests for the entire app using integration tests

# Keynotes
- A unit test verifies that every individual unit of software, be it a function, object or a widget, performs its intended task correctly
- All the test files in a Flutter app, except for integration tests, are placed in the test directory. Convention of giving name to integration_test is fixed and the file is placed at apps root directory.
- Widget Test (flutter_test) vs Integration Test (integration_test): They both render UI and test on device, but the major difference is widget test is for a particular widget it doesnt need whole app environment where as in integration test its need apps environement in my case mock goRouter, integration test covers whole app testing.

# Flutter Boiler Plate
- Scalable State Mgmt - Provider - models
- Scalable Dialog - DialogManager
- Scalable Navigation - routes folder
- Singleton Internet Connectivity Checker
- Singleton Local Storage - SharedPrefHelper
- Scalable Validators - constants/validators
- Set Scalable App theme
