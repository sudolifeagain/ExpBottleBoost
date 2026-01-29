# ExpBottleBoost

A simple Paper/Spigot plugin that allows server administrators to customize the amount of experience (XP) gained from throwing Experience Bottles (Bottles o' Enchanting).

## Features

- Configurable minimum and maximum XP per bottle
- Server-side only (no client mods required)
- Zero dependencies

## Installation

1. Build the plugin (see below)
2. Copy `ExpBottleBoost-1.0.0.jar` to your server's `plugins/` folder
3. Restart or reload the server
4. Edit `plugins/ExpBottleBoost/config.yml` to customize XP values
5. Reload with `/reload` or restart the server

## Configuration

```yaml
# plugins/ExpBottleBoost/config.yml

# Minimum XP per bottle (vanilla default: 3)
min-exp: 50

# Maximum XP per bottle (vanilla default: 11)
max-exp: 100
```

## Building

### Prerequisites
- Java 17+
- Maven 3.6+ (or use the included wrapper)

### Build Commands

**Using Maven wrapper (recommended):**
```bash
# Windows
mvnw.cmd clean package

# Linux/Mac
./mvnw clean package
```

**Using system Maven:**
```bash
mvn clean package
```

The built JAR will be in `target/ExpBottleBoost-1.0.0.jar`

## Project Structure

```
ExpBottleBoost/
├── pom.xml                    # Maven build configuration
├── mvnw.cmd                   # Maven wrapper (Windows)
├── README.md                  # This file
└── src/
    └── main/
        ├── java/
        │   └── com/example/expbottleboost/
        │       └── ExpBottleBoost.java    # Main plugin class
        └── resources/
            ├── plugin.yml     # Plugin descriptor
            └── config.yml     # Default configuration
```

## Technical Details

- **Event**: Listens to `ExpBottleEvent` with `HIGHEST` priority
- **API**: Paper/Spigot API 1.20.1
- **Compatibility**: Paper, Spigot, Bukkit (1.20.x)

## License

MIT License
