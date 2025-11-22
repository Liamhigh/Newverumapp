#!/bin/bash

echo "🏗️  Verum Omnis APK Build Script"
echo "=================================="
echo ""

# Exit on error
set -e

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Java is not installed. Please install Java JDK 17 or higher."
    exit 1
fi

echo "✅ Prerequisites check passed"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Build web application
echo "🌐 Building web application..."
npm run build

# Sync Capacitor
echo "🔄 Syncing Capacitor..."
npx cap sync android

# Build APK
echo "📱 Building Android APK..."
cd android
./gradlew assembleRelease
cd ..

# Copy APK to root
echo "📋 Copying APK to repository root..."
if [ -f "android/app/build/outputs/apk/release/app-release-unsigned.apk" ]; then
    cp android/app/build/outputs/apk/release/app-release-unsigned.apk verum-omnis.apk
    echo "✅ APK built successfully: verum-omnis.apk"
    ls -lh verum-omnis.apk
elif [ -f "android/app/build/outputs/apk/release/app-release.apk" ]; then
    cp android/app/build/outputs/apk/release/app-release.apk verum-omnis.apk
    echo "✅ APK built successfully: verum-omnis.apk"
    ls -lh verum-omnis.apk
else
    echo "❌ APK file not found. Build may have failed."
    echo "Looking for APK files..."
    find android/app/build/outputs/apk -name "*.apk" -type f
    exit 1
fi

echo ""
echo "🎉 Build complete!"
echo ""
echo "The APK is ready: verum-omnis.apk"
