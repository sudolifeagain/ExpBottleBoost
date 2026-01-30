#!/bin/bash
# Maven wrapper for Linux/Mac
# Downloads and runs Maven if not installed

MAVEN_VERSION="3.9.6"
WRAPPER_DIR="$HOME/.m2/wrapper"
MAVEN_HOME="$WRAPPER_DIR/apache-maven-$MAVEN_VERSION"
MAVEN_BIN="$MAVEN_HOME/bin/mvn"

if [ ! -f "$MAVEN_BIN" ]; then
    echo "Downloading Apache Maven $MAVEN_VERSION..."
    mkdir -p "$WRAPPER_DIR"
    
    # Download using curl or wget
    if command -v curl &> /dev/null; then
        curl -L "https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip" -o "/tmp/maven.zip"
    elif command -v wget &> /dev/null; then
        wget "https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip" -O "/tmp/maven.zip"
    else
        echo "Error: Neither curl nor wget found. Please install one of them."
        exit 1
    fi
    
    # Unzip
    if command -v unzip &> /dev/null; then
        unzip -q "/tmp/maven.zip" -d "$WRAPPER_DIR"
    else
        echo "Error: unzip command not found. Please install unzip."
        exit 1
    fi
    
    rm "/tmp/maven.zip"
fi

# Run Maven
exec "$MAVEN_BIN" "$@"
