# Firebase Deployment Instructions

## Prerequisites
- Firebase CLI installed: `npm install -g firebase-tools`
- Google account with Firebase access

## Steps to Deploy

### 1. Authenticate with Firebase
```bash
firebase login --no-localhost
```

You'll receive:
- A session ID (e.g., `0FACD`)
- A URL to visit: `https://auth.firebase.tools/login?...`

1. Visit the URL in your browser
2. Sign in with your Google account
3. Copy the authorization code shown
4. Paste it back in the terminal when prompted

### 2. Initialize Firebase Project (First Time Only)
```bash
firebase init hosting
```

When prompted:
- Select "Use an existing project" or "Create a new project"
- Choose your project from the list
- Accept the default public directory: `dist`
- Configure as single-page app: `Yes`
- Set up automatic builds with GitHub: `No` (optional)

### 3. Deploy to Firebase
```bash
npm run build
firebase deploy --only hosting
```

Or use the provided script:
```bash
./deploy.sh
```

## Quick Deploy Script

The `deploy.sh` script automates the entire process:
```bash
chmod +x deploy.sh
./deploy.sh
```

## Files Included
- **verum-omnis.apk** - Android APK (available in repository)
- **dist/** - Built web application
- **firebase.json** - Firebase hosting configuration

## Environment Variables
Make sure `.env` file exists with:
```
VITE_GEMINI_API_KEY=your_api_key_here
```

## After Deployment
Your app will be available at:
- `https://your-project-id.web.app`
- `https://your-project-id.firebaseapp.com`

The APK can be downloaded directly from the GitHub repository.
