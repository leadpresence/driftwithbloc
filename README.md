 
# DriftWithBloc- Transaction Manager

A Flutter app for managing financial transactions with local database storage.

## Features

- ✅ **CRUD Operations** - Create, Read, Update, Delete transactions
- 📅 **Date Range Filtering** - Filter transactions by date range
- 📊 **Summary Analytics** - View transaction summaries and statistics
- 🎯 **Mock Data** - Test with fake successful/failed transactions
- 🗄️ **Local Database** - SQLite database using Drift
- 🏗️ **Clean Architecture** - SOLID principles with BLoC pattern

## Setup

1. **Clone and install dependencies:**
```bash
flutter create transaction_app
cd transaction_app
# Copy all the provided files to their respective directories
flutter pub get
```

2. **Create directory structure:**
```bash
mkdir -p lib/core/error lib/core/di lib/data/database lib/data/repositories lib/data/mappers lib/domain/models lib/domain/repositories lib/domain/usecases lib/presentation/bloc lib/presentation/pages lib/presentation/widgets
```

3. **Generate database files:**
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app:**
```bash
flutter run
```

## Usage

### Adding Transactions
- **Green FAB** - Add successful transaction
- **Red FAB** - Add failed transaction

### Filtering
- **Calendar icon** - Filter by date range
- **Analytics icon** - Toggle between list and summary view
- **Refresh icon** - Reload data

### Date Range
- Quick select buttons (Today, Yesterday, This Week, etc.)
- Custom date selection with calendar
- Auto-defaults to present date when end date not specified

## Architecture

```
lib/
├── core/                 # Core utilities
│   ├── di/              # Dependency injection
│   └── error/           # Error handling
├── data/                # Data layer
│   ├── database/        # Drift database
│   ├── mappers/         # Entity mappers
│   └─
 
