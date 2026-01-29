# Event Listeners

## Adding a New Event Listener

### 1. Add Method to Main Class

```java
@EventHandler(priority = EventPriority.HIGHEST)
public void onEventName(EventType event) {
    // Handle event
}
```

### 2. Common Events

| Event | Description |
|-------|-------------|
| `ExpBottleEvent` | Experience bottle breaks |
| `PlayerJoinEvent` | Player joins server |
| `BlockBreakEvent` | Block is broken |
| `EntityDamageEvent` | Entity takes damage |

### 3. Event Priority

- `LOWEST` - First to run, can be overridden
- `NORMAL` - Default
- `HIGHEST` - Last to run before MONITOR
- `MONITOR` - Read-only, for logging

### 4. Existing Example

See `ExpBottleBoost.java`:
```java
@EventHandler(priority = EventPriority.HIGHEST)
public void onExpBottle(ExpBottleEvent event) {
    event.setExperience(newExp);
}
```

## Resources

- [Paper API Javadoc](https://jd.papermc.io/paper/1.20/)
- [Spigot Event List](https://hub.spigotmc.org/javadocs/spigot/org/bukkit/event/package-summary.html)
