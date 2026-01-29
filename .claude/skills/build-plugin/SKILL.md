---
name: build-plugin
description: Build the ExpBottleBoost Minecraft plugin JAR using Maven. Use when compiling, packaging, testing the build, or preparing for server deployment.
---

# Build Plugin

## Quick Build

From project root:

```bash
mvnw.cmd clean package
```

## Output

`target/ExpBottleBoost-1.0.0.jar`

## Installation

Copy JAR to server's `plugins/` folder and restart/reload.

## Troubleshooting

- **Java version error**: Ensure JAVA_HOME points to Java 17+
- **Maven not found**: Use `mvnw.cmd` wrapper included in project
