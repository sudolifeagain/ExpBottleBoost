# Config Options

## Adding a Configuration Option

### 1. Add to config.yml

```yaml
# src/main/resources/config.yml
new-option: defaultValue
```

### 2. Load in Java

```java
private void loadConfig() {
    reloadConfig();
    newOption = getConfig().getInt("new-option", defaultValue);
}
```

### 3. Available Methods

| Method | Returns |
|--------|---------|
| `getConfig().getInt(key, default)` | int |
| `getConfig().getDouble(key, default)` | double |
| `getConfig().getString(key, default)` | String |
| `getConfig().getBoolean(key, default)` | boolean |
| `getConfig().getStringList(key)` | List<String> |

### 4. Existing Example

See `ExpBottleBoost.java`:
```java
minExp = getConfig().getInt("min-exp", 50);
maxExp = getConfig().getInt("max-exp", 100);
```

## Config File Location

Runtime: `plugins/ExpBottleBoost/config.yml`

## Reload Config

Call `reloadConfig()` to refresh values from disk.

## Tips

**Fixed XP**: Set `min-exp` and `max-exp` to the same value for constant XP per bottle.
