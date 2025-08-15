# 📱 Insurance Claims App

A Flutter mobile application built with **Clean Architecture**, **GetX** for state management, **GetIt** for dependency injection, **Dio** for HTTP requests, and **json_serializable** for model serialization.

The app fetches and displays insurance claims data from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/posts).

---

## 🚀 Features

- Display list of insurance claims
- Search/filter claims by keyword
- View detailed information for each claim
- Clean Architecture structure
- Dependency Injection with GetIt
- State management with GetX
- API integration using Dio
- JSON serialization with json_serializable

---

## 🗂 Project Structure

```
lib/
 ├── core/
 │   └── network/
 │       ├── api_client.dart
 │       └── api_config.dart
 ├── features/
 │   └── claims/
 │       ├── data/
 │       │   ├── datasources/
 │       │   │   └── claim_remote_datasource.dart
 │       │   ├── models/
 │       │   │   └── claim_model.dart
 │       │   └── repositories/
 │       │       └── claim_repository_impl.dart
 │       ├── domain/
 │       │   ├── entities/
 │       │   │   └── claim_entity.dart
 │       │   ├── repositories/
 │       │   │   └── claim_repository.dart
 │       │   └── usecases/
 │       │       ├── get_claim.dart
 │       │       └── search_claim.dart
 │       └── presentation/
 │           ├── bindings/
 │           │   └── claim_binding.dart
 │           ├── controllers/
 │           │   └── claim_controller.dart
 │           └── pages/
 │               ├── claim_list_page.dart
 │               └── claim_detail_page.dart
 ├── di.dart
 └── main.dart
```

---

## 🛠 Setup Instructions

### 1️⃣ Clone this repository

```bash
git clone https://github.com/username/insurance_claim_app.git
cd insurance_claim_app
```

### 2️⃣ Install dependencies

```bash
flutter pub get
```

### 3️⃣ Generate model files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4️⃣ Run the app

```bash
flutter run
```

---

## 📷 Screenshots

| List Page                                     | Detail Page                                       |
| --------------------------------------------- | ------------------------------------------------- |
| ![List Screenshot](screenshots/list_page.png) | ![Detail Screenshot](screenshots/detail_page.png) |

_(Place your screenshots in a `screenshots/` folder at the root of the project)_

---

## 🔗 API Used

**Base URL:** `https://jsonplaceholder.typicode.com`  
**Endpoint:** `/posts`
