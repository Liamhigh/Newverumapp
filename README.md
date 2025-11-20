# Newverumapp
Forensic engine

## Building the APK

To build the APK with your API key, you can use the automated build script:

```bash
./build-apk.sh
```

The script will:
1. Check for a `.env` file with your API key
2. Install dependencies
3. Build the web application
4. Sync to Android
5. Build the APK

For detailed manual instructions, see [BUILD_APK.md](BUILD_APK.md).

## Quick Start

1. Set your Gemini API key in `.env`:
   ```bash
   echo "VITE_GEMINI_API_KEY=your_api_key_here" > .env
   ```

2. Run the build script:
   ```bash
   chmod +x build-apk.sh
   ./build-apk.sh
   ```

3. The APK will be at `android/app/build/outputs/apk/debug/app-debug.apk`
