# Newverumapp
Forensic engine

## Building the Android APK

### Prerequisites
- Node.js 18 or higher
- Java JDK 17 or higher
- Android SDK (configured in the `android/` directory)

### Quick Build
Run the automated build script:
```bash
./build-apk.sh
```

### Manual Build Steps
1. Install dependencies:
   ```bash
   npm ci
   ```

2. Build the web application:
   ```bash
   npm run build
   ```

3. Sync Capacitor:
   ```bash
   npx cap sync android
   ```

4. Build the APK:
   ```bash
   cd android
   ./gradlew assembleRelease
   cd ..
   ```

5. The APK will be available at:
   - `android/app/build/outputs/apk/release/app-release-unsigned.apk`

### Using GitHub Actions
Alternatively, the APK can be built automatically using GitHub Actions:
1. Go to the [Actions tab](../../actions/workflows/build-apk.yml)
2. Click "Run workflow"
3. Wait for the workflow to complete
4. The APK will be committed to the repository as `verum-omnis.apk`
