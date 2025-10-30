# Docker Practice

[![CI](https://github.com/tohruyaginuma/docker-practice/actions/workflows/ci.yml/badge.svg)](https://github.com/tohruyaginuma/docker-practice/actions/workflows/ci.yml)
[![Build Docker Image](https://github.com/tohruyaginuma/docker-practice/actions/workflows/deploy.yml/badge.svg)](https://github.com/tohruyaginuma/docker-practice/actions/workflows/deploy.yml)

This repository demonstrates Docker containerization with a Next.js application.

## GitHub Actions Workflows

This repository includes automated CI/CD workflows:

### CI Workflow (`.github/workflows/ci.yml`)
Runs on every push to main and on pull requests:
- **Linting**: Checks code quality with Biome
- **Build**: Builds the Next.js application
- **Docker Build**: Verifies the Docker image can be built successfully

### Deploy Workflow (`.github/workflows/deploy.yml`)
Builds and saves the Docker image as an artifact:
- Builds the Docker image for the specified platform
- Uses GitHub Actions cache for faster builds
- Uploads the image as an artifact for deployment

## Project Structure

```
.
├── .github/
│   └── workflows/        # GitHub Actions workflows
├── my-app/              # Next.js application
│   ├── src/             # Source code
│   ├── public/          # Static assets
│   └── package.json     # Node.js dependencies
├── Dockerfile           # Docker image definition
└── README.md            # This file
```

## Local Development

### Running the Next.js app locally

```bash
cd my-app
pnpm install
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) to view the application.

### Building with Docker

```bash
docker build -t myapp .
docker run -p 3000:3000 myapp
```

## Available Scripts

Inside the `my-app` directory:

- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm start` - Start production server
- `pnpm lint` - Run linting with Biome
- `pnpm format` - Format code with Biome

## Technologies

- **Next.js 16** - React framework
- **React 19** - UI library
- **TypeScript** - Type safety
- **Tailwind CSS** - Styling
- **Biome** - Linting and formatting
- **Docker** - Containerization
- **pnpm** - Package manager
