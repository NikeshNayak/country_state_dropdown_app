# 🌍 Country-State Dropdown App

This Flutter application allows users to select a country and then dynamically loads the states associated with it. Upon form submission, the selected country and state are passed to a new screen.

---

## 📐 Architecture Overview

This project follows the **Domain-Driven Design (DDD)** inspired clean architecture with a modular folder structure:

```
lib/
├── config/          # App-wide configurations like routing, themes, etc.
├── core/            # Shared core logic (DataState, utilities)
├── features/
│   └── location/    # Feature module for location (country + state)
│       ├── data/      # Data models, API services, repository implementation
│       ├── domain/    # Entities, repository contracts, use cases
│       └── presentation/ # UI layer with blocs and widgets
├── utils/           # General-purpose helper functions/constants
```

---

## 🧠 Why DDD?

- **Separation of concerns**: Every layer has a distinct responsibility.
- **Testability**: Business logic is isolated and easily testable.
- **Scalability**: Easy to extend or plug-in new features.
- **Maintainability**: Clean boundaries between UI, domain, and data.

---

## 🛠️ Technologies & Tools

- **Flutter** & **Dart**
- **BLoC** (flutter_bloc) – for predictable state management
- **Retrofit** for API calls
- **Freezed & Json Serializable** for immutable models
- **Dio** – for HTTP client
- **build_runner** - for auto generated files
- **Mockito** – for unit & widget tests
- **flutter_test / bloc_test** – testing tools

---

## 📦 Core Components

### 📁 `features/location/`

#### ✅ `data/`
- **Models**: `CountriesModel`, `StatesModel` – immutable via Freezed.
- **Remote API Service**: Handles API calls using Dio.
- **Repository Implementation**: `LocationRepositoryImpl` maps raw data to domain use.

#### ✅ `domain/`
- **Entities**: Optional (merged with models for simplicity).
- **Repositories**: Abstract contracts.
- **UseCases**: Exposes clean interface for the app to call business logic.

#### ✅ `presentation/`
- **BLoCs**:
  - `GetCountriesListBloc`
  - `GetStatesListBloc`
- **UI**: `HomeScreen`, dropdowns, and navigation.

---

## 🧪 Testing

The app supports unit and widget testing for core business logic and UI interaction.

### ✅ Unit Tests
- `location_usecase_test.dart`: Tests that use cases return expected data.
- `location_repository_impl_test.dart`: Mocks API response and verifies logic.

### ✅ BLoC Tests
- `get_countries_list_bloc_test.dart`: Ensures correct states are emitted based on events.
- `get_states_list_bloc_test.dart`: Similar testing for state logic.

### ✅ Widget Tests
- `home_screen_test.dart`: Ensures dropdowns render properly, mock BLoCs return expected UI changes.

Run all tests using:
```bash
flutter test
```


## 🔧 Code Generation

This project uses code generation tools with `freezed`, `json_serializable`, and `retrofit`.

### Before Running the Project

After cloning the repo and running `flutter pub get`, run:

```bash
dart run build_runner build
```

> 🔁 Optional (for development):
```bash
dart run build_runner watch
```

This will generate:

- `.g.dart` and `.freezed.dart` files for data models.
- API client code with `retrofit`.

---

## ▶️ How to Run

1. Clone the repository.
2. Run `flutter pub get`.
3. Run `dart run build_runner build`.
4. Launch the app using `flutter run`.

---

## 📄 Notes

- This project uses static mock API endpoints to simulate country-state data.
- Error handling includes both `DataFailed` and `DataDioException` for robustness.
- Form validation ensures country and state are selected before navigating forward.

---

## ✍️ Author

Developed as part of a coding challenge. Structured and documented as would be expected in a production team environment.

---

## 📎 License

MIT License – use freely and contribute if you'd like!
