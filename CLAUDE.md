# ExpBottleBoost

Paper/Spigot Minecraft plugin that customizes experience bottle XP amounts.

**Version**: 1.0.1

## Tech Stack
- Java 17
- Maven
- Paper API 1.20.1

## Build
```bash
mvnw.cmd clean package
```
Output: `target/ExpBottleBoost-1.0.1.jar`

## Project Structure
```
src/main/
├── java/com/example/expbottleboost/
│   └── ExpBottleBoost.java    # Main plugin class + event listener
└── resources/
    ├── plugin.yml             # Plugin descriptor
    └── config.yml             # Default configuration
```

## Patterns

### Event Handling
- Use `@EventHandler(priority = EventPriority.HIGHEST)` for modifying vanilla behavior
- Register listeners in `onEnable()` with `getServer().getPluginManager().registerEvents(this, this)`

### Configuration
- Call `saveDefaultConfig()` in `onEnable()` to create default config
- Use `getConfig().getInt("key", defaultValue)` to read values
- Config file: `plugins/ExpBottleBoost/config.yml`
- **Fixed XP**: Set `min-exp` = `max-exp` for constant value

## Author
re4lity (MIT License)
