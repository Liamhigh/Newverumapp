#!/bin/bash

echo "🚀 Verum Omnis Deployment Script"
echo "================================="
echo ""

# Check if Firebase CLI is logged in
if ! firebase projects:list &>/dev/null; then
    echo "❌ Not logged into Firebase."
    echo ""
    echo "Please authenticate:"
    echo "1. Run: firebase login --no-localhost"
    echo "2. Visit the URL provided"
    echo "3. Sign in and copy the authorization code"
    echo "4. Paste the code back in the terminal"
    echo ""
    echo "After authentication, run this script again."
    exit 1
fi

echo "✅ Firebase authentication confirmed"
echo ""

# Check if Firebase project is initialized
if [ ! -f ".firebaserc" ]; then
    echo "🔧 Initializing Firebase project..."
    echo ""
    echo "Please select or create a project when prompted."
    firebase init hosting
else
    echo "✅ Firebase project already configured"
fi

echo ""
echo "📦 Building web app..."
npm run build

echo ""
echo "🌐 Deploying to Firebase Hosting..."
firebase deploy --only hosting

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📱 APK is available in repository: verum-omnis.apk"
