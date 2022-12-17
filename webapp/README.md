This is the folder of the Nextjs webapp which also provides the API backend 
for the Flutter client

[![CI webapp](https://github.com/DerLev/teachers-bingo/actions/workflows/integration-webapp.yml/badge.svg?branch=main&event=push)](https://github.com/DerLev/teachers-bingo/actions/workflows/integration-webapp.yml)

### Running the webapp

#### Locally

```bash
yarn dev
# or for production builds
yarn build
yarn start
```

In both cases the app will be available on http://localhost:3000/

#### On Vercel

Everytime a commit or pull request is made the GitHub Actions workflow lints, 
type checks and builds the app and publishes it on Vercel in the preview 
channel. [Deployments](https://github.com/DerLev/teachers-bingo/deployments/activity_log?environment=Preview)
