# 💱 Currency Converter

A Flutter application for converting currencies with real-time exchange rates.  
The project is built using **Clean Architecture** and **BLoC** for state management.  

---

## 🚀 Features
- 📌 Fetch a list of currencies from API  
- 🔄 Select "from" and "to" currencies via BottomSheet  
- 💱 Convert between currencies  
- 🌀 State management with **BLoC**  
- 🧩 Dependency injection with **get_it**  

---

## 🛠️ Tech Stack
- **Flutter**  
- **Dart**  
- **BLoC** (`flutter_bloc`)  
- **get_it** (Dependency Injection)  
- **Dio** (API requests)  

---

## 🏗️ Architecture
The project follows **Clean Architecture** principles:

lib/
│── core/ # Common dependencies, themes, constants
│── features/
│ └── converter/
│ ├── data/ # API handling, DTO models, repositories impl
│ ├── domain/ # Entities, repositories, use cases
│ └── presentation/
│ ├── blocs/ # BLoC state management
│ └── screens & widgets
