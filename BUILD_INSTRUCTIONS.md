# APK Build Setup - Next Steps

## What Has Been Done

This PR has set up the complete infrastructure needed to rebuild the Android APK for the Verum Omnis Forensic Engine app. Due to network restrictions in the automated environment (dl.google.com is blocked), the APK cannot be built automatically here, but all the necessary tools have been created.

## Files Added/Modified

1. **`.github/workflows/build-apk.yml`** - GitHub Actions workflow for automated APK building
2. **`build-apk.sh`** - Shell script for local APK building
3. **`README.md`** - Updated with comprehensive build instructions

## How to Build the APK

### Option 1: Use GitHub Actions (Recommended)

1. Go to the repository on GitHub
2. Navigate to the **Actions** tab
3. Click on the **"Build Android APK"** workflow in the left sidebar
4. Click the **"Approve and run"** button (for first-time workflow approval)
5. Once approved, click **"Run workflow"** → select the branch → **"Run workflow"**
6. Wait for the workflow to complete (~5-10 minutes)
7. The APK will be automatically committed to the repository as `verum-omnis.apk`

### Option 2: Build Locally

If you have a local development environment with network access:

```bash
# Clone the repository (if not already done)
git clone https://github.com/Liamhigh/Newverumapp.git
cd Newverumapp

# Make the script executable
chmod +x build-apk.sh

# Run the build script
./build-apk.sh
```

**Prerequisites for local building:**
- Node.js 18 or higher
- Java JDK 17 or higher
- Internet access (to download Android SDK dependencies from dl.google.com)

## What the Build Process Does

1. Installs npm dependencies
2. Builds the React web application using Vite
3. Syncs the web build to the Capacitor Android project
4. Builds the Android APK using Gradle
5. Copies the APK to the repository root as `verum-omnis.apk`

## Technical Details

- **App ID**: `com.verumomnis.engine`
- **App Name**: Verum Omnis - Forensic Engine
- **Build Output**: Release APK (unsigned)
- **Target Platform**: Android

## Troubleshooting

If the GitHub Actions workflow shows "action_required":
- This is normal for first-time workflows from PRs
- You need to approve the workflow in the Actions tab before it can run
- Once approved, future runs will execute automatically

If local build fails with network errors:
- Ensure you have internet access
- Check that dl.google.com is accessible from your network
- Verify Java and Node.js are properly installed

## Support

For any issues, please check the logs in the GitHub Actions tab or review the terminal output from the build script.
