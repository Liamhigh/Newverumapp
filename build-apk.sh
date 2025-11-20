#!/bin/bash

echo "🔧 Verum Omnis APK Build Script"
echo "================================"
echo ""

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found!"
    echo ""
    echo "Creating .env template..."
    echo "VITE_GEMINI_API_KEY=your_api_key_here" > .env
    echo ""
    echo "❌ Please edit the .env file and add your actual Gemini API key."
    echo "   Get your API key from: https://aistudio.google.com/app/apikey"
    echo ""
    echo "After adding your API key, run this script again."
    exit 1
fi

# Check if API key is still the placeholder
if grep -q "your_api_key_here" .env; then
    echo "⚠️  API key appears to be the placeholder value!"
    echo ""
    echo "Please edit .env and replace 'your_api_key_here' with your actual Gemini API key."
    echo "Get your API key from: https://aistudio.google.com/app/apikey"
    echo ""
    read -p "Have you updated the API key? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Please update the .env file and run this script again."
        exit 1
    fi
fi

echo "✅ .env file found"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
if ! npm install; then
    echo "❌ Failed to install dependencies"
    exit 1
fi
echo ""

# Build web app
echo "🏗️  Building web application..."
if ! npm run build; then
    echo "❌ Failed to build web application"
    exit 1
fi
echo ""

# Sync to Android
echo "📱 Syncing to Android platform..."
if ! npx cap sync android; then
    echo "❌ Failed to sync to Android"
    exit 1
fi
echo ""

# Build APK
echo "🔨 Building APK..."
cd android
if ! ./gradlew assembleDebug; then
    echo "❌ Failed to build APK"
    echo ""
    echo "Make sure you have:"
    echo "  - Android SDK installed"
    echo "  - ANDROID_HOME environment variable set"
    echo "  - Java JDK 11 or higher installed"
    exit 1
fi
cd ..
echo ""

# Success message
echo "✅ APK built successfully!"
echo ""
echo "📂 APK Location:"
echo "   android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "📲 To install on device:"
echo "   adb install android/app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "Or transfer the APK file to your Android device and install it manually."
