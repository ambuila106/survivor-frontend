# Survivor Frontend

Una aplicación móvil Flutter.

## 📱 Descripción

Survivor Frontend es una aplicación móvil desarrollada en Flutter que permite a los usuarios participar en un juego de supervivencia de fútbol. Los jugadores pueden unirse a diferentes "survivors", hacer apuestas en cada jornada, y competir por mantenerse vivos hasta el final del torneo.


## 🚀 Instrucciones de Ejecución

### Prerrequisitos

1. **Flutter SDK** (versión 3.9.2 o superior)
   ```bash
   flutter --version
   ```

2. **Dart SDK** (incluido con Flutter)

3. **Android Studio** / **Xcode** 



### Instalación

1. **Clonar el repositorio:**
   ```bash
   git clone <url-del-repositorio>
   cd survivor_frontend
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Verificar configuración de Flutter:**
   ```bash
   flutter doctor
   ```

### Ejecución

#### Modo Debug (Desarrollo)
```bash
flutter run
```


#### Para dispositivos específicos
```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en dispositivo específico
flutter run -d <device-id>
```

### Construcción (Build)

#### Android APK
```bash
flutter build apk --release
```

#### Android App Bundle
```bash
flutter build appbundle --release
```

#### iOS
```bash
flutter build ios --release
```

## 🏗️ Arquitectura del Proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── screens/                    # Pantallas principales
│   ├── survivors_screen.dart   # Lista de survivors disponibles
│   └── survival_screen.dart    # Pantalla principal del juego
├── components/                 # Componentes reutilizables
│   ├── header_banner.dart      # Banner superior con estadísticas
│   ├── leaderboard_table.dart  # Tabla de posiciones
│   ├── penka_logo.dart        # Logo de la marca
│   ├── stat_card.dart         # Tarjetas de estadísticas
│   └── match_accordion/       # Componentes de partidos
│       ├── match_accordion.dart
│       ├── match_tile.dart
│       └── team_selector.dart
└── services/                  # Servicios de la aplicación
    └── api_service.dart       # Servicio de API REST
```

## 🌐 Configuración de API

La aplicación se conecta a la API backend en tu local sería:

```dart
static const String baseUrl = "http://localhost:4300/api";
```

## 📱 Funcionalidades

### Pantallas Principales:

1. **Survivors Screen** ([`lib/screens/survivors_screen.dart`](lib/screens/survivors_screen.dart))
   - Lista de torneos disponibles

2. **Survival Screen** ([`lib/screens/survival_screen.dart`](lib/screens/survival_screen.dart))
   - Vista principal del juego
   - Pestañas: Por jugar, Resultados, Tabla
   - Selección de equipos por jornada

### Componentes Clave:

- **Match Accordion**: Agrupa partidos por jornada
- **Team Selector**: Permite seleccionar equipos
- **Leaderboard Table**: Muestra clasificación actual
- **Header Banner**: Información del jugador y estadísticas
