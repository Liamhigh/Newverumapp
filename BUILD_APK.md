# Building the APK with API Key

## Prerequisites
- Android SDK installed
- Java JDK installed
- Node.js and npm installed

## Steps to Build APK with API Key

### 1. Configure the API Key

Create a `.env` file in the root directory with your Gemini API key:

```bash
echo "VITE_GEMINI_API_KEY=your_actual_api_key_here" > .env
```

**Important:** Replace `your_actual_api_key_here` with your actual Google Gemini API key from [Google AI Studio](https://aistudio.google.com/app/apikey).

### 2. Build the Web Application

Build the web application to bundle the API key:

```bash
npm install
npm run build
```

This will create the `dist/` directory with the compiled application including the API key.

### 3. Sync to Android

Sync the built web assets to the Android project:

```bash
npx cap sync android
```

This copies the web assets from `dist/` to `android/app/src/main/assets/public/`.

### 4. Build the APK

Navigate to the Android directory and build the APK:

```bash
cd android
./gradlew assembleDebug
```

For a release build (requires signing configuration):

```bash
./gradlew assembleRelease
```

### 5. Locate the APK

The built APK will be located at:

- Debug: `android/app/build/outputs/apk/debug/app-debug.apk`
- Release: `android/app/build/outputs/apk/release/app-release.apk`

### 6. Install the APK

Transfer the APK to your Android device and install it, or use:

```bash
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

## Security Notes

- The `.env` file is excluded from git via `.gitignore` to prevent accidental API key exposure
- The API key is bundled into the JavaScript at build time
- For production builds, consider additional security measures like API key restrictions in Google Cloud Console

## Troubleshooting

### Issue: API Key Not Working

If the app doesn't work after building:

1. Verify the API key is correct in `.env`
2. Ensure you ran `npm run build` after updating `.env`
3. Ensure you ran `npx cap sync android` after building
4. Rebuild the APK

### Issue: Build Failures

If Gradle build fails:

1. Ensure Android SDK is properly installed
2. Check that `ANDROID_HOME` environment variable is set
3. Try cleaning the build: `./gradlew clean`
4. Ensure Java JDK 11 or higher is installed

## Alternative: Runtime Configuration (Advanced)

For more flexibility, you could modify the app to accept the API key at runtime through:
- A settings screen in the app
- Local storage configuration
- Remote configuration service

This would require code changes to prompt for the API key on first launch.
