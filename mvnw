#!/bin/sh
# Maven wrapper for Linux/Mac
# Downloads and runs Maven if not installed

set -e

MAVEN_VERSION="3.9.6"
MAVEN_SHA512="0eb0432004a91ebf399314ad33e5aaffec3d3b29279f2f143b2f43ade26f4db7bd1c0f08e436e9445ac6dc4a564a2945d13072a160ae54a930e90581284d6461"
WRAPPER_DIR="$HOME/.m2/wrapper"
MAVEN_HOME="$WRAPPER_DIR/apache-maven-$MAVEN_VERSION"
MAVEN_BIN="$MAVEN_HOME/bin/mvn"

# --- Java Detection ---
if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/bin/java" ]; then
        JAVA_CMD="$JAVA_HOME/bin/java"
    fi
fi

if [ -z "$JAVA_CMD" ]; then
    if command -v java >/dev/null 2>&1; then
        JAVA_CMD="java"
    else
        echo "Error: JAVA_HOME is not set and no 'java' command could be found in your PATH."
        echo "Please set JAVA_HOME to the path of a valid JDK or install Java."
        exit 1
    fi
fi

# --- Maven Installation Check ---
if [ ! -f "$MAVEN_BIN" ]; then
    echo "Maven $MAVEN_VERSION not found. Installing..."
    
    # Check dependencies
    if ! command -v unzip >/dev/null 2>&1; then
        echo "Error: 'unzip' is required but not installed."
        exit 1
    fi

    # Create safe temp file
    TMP_FILE=$(mktemp /tmp/maven-wrapper-XXXXXX.zip)
    trap 'rm -f "$TMP_FILE"' EXIT INT TERM

    DOWNLOAD_URL="https://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.zip"
    
    echo "Downloading from $DOWNLOAD_URL"
    if command -v curl >/dev/null 2>&1; then
        curl -L -o "$TMP_FILE" "$DOWNLOAD_URL"
    elif command -v wget >/dev/null 2>&1; then
        wget -O "$TMP_FILE" "$DOWNLOAD_URL"
    else
        echo "Error: Neither 'curl' nor 'wget' found. Please install one of them."
        exit 1
    fi

    # Checksum Verification
    echo "Verifying checksum..."
    if command -v sha512sum >/dev/null 2>&1; then
        echo "$MAVEN_SHA512  $TMP_FILE" | sha512sum -c -
    elif command -v shasum >/dev/null 2>&1; then
        echo "$MAVEN_SHA512  $TMP_FILE" | shasum -a 512 -c -
    else
        echo "Warning: Neither 'sha512sum' nor 'shasum' found. Skipping checksum verification."
        echo "Proceeding with caution..."
    fi

    mkdir -p "$WRAPPER_DIR"
    unzip -q -o "$TMP_FILE" -d "$WRAPPER_DIR"
    echo "Maven $MAVEN_VERSION installed to $WRAPPER_DIR"
fi

# --- Run Maven ---
# Use the detected Java if possible, usually mvn script handles it by checking JAVA_HOME
# but explicitly validting Java environment beforehand helps diagnosis.
exec "$MAVEN_BIN" "$@"
