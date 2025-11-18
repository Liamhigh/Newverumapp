# Newverumapp
Forensic engine

## Building the APK

To build the APK with your API key, see [BUILD_APK.md](BUILD_APK.md) for detailed instructions.

## Quick Start

1. Set your Gemini API key in `.env`:
   ```bash
   echo "VITE_GEMINI_API_KEY=your_api_key_here" > .env
   ```

2. Build and sync:
   ```bash
   npm install
   npm run build
   npx cap sync android
   cd android && ./gradlew assembleDebug
   ```

3. The APK will be at `android/app/build/outputs/apk/debug/app-debug.apk`
