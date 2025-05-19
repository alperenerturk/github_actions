# GitHub Actions for Tag Update and Docker Deployment

This repository demonstrates a complete CI/CD workflow using GitHub Actions to:
1. Update a tag in a configuration file
2. Commit changes back to the repository using GitHub token
3. Build and push a Docker image to GitHub Container Registry (ghcr.io)

## Project Structure

```
.
├── .github
│   └── workflows
│       ├── tag-updater-action.yml  # Reusable workflow to update tags
│       └── main-workflow.yml       # Main workflow that uses the reusable workflow
├── src
│   └── config.txt                  # Configuration file with the tag to be updated
├── Dockerfile                      # Docker image definition
└── README.md                       # This file
```

## How It Works

### 1. Tag Update Process

The workflow automatically updates the text in `src/config.txt` from "tag 1" to "tag 2" (or a custom tag specified via workflow dispatch) using a reusable GitHub Action. The changes are then committed back to the repository using the default `GITHUB_TOKEN`.

### 2. Reusable Workflow

The `tag-updater-action.yml` is a reusable workflow that:
- Takes parameters for file path, old tag, new tag, and commit message
- Updates the specified file by replacing the old tag with the new tag
- Commits and pushes the changes back to the repository

### 3. Docker Integration

After the tag update, the main workflow:
- Builds a Docker image that includes the updated configuration file
- Authenticates with GitHub Container Registry using `GITHUB_TOKEN`
- Pushes the Docker image to ghcr.io with appropriate tags

## How to Use

### Automatic Trigger

The workflow automatically runs when you push to the `main` branch.

### Manual Trigger

You can manually trigger the workflow from the GitHub Actions tab and specify a custom tag:

1. Go to the Actions tab in your GitHub repository
2. Select "Update Tag and Deploy Docker Image" workflow
3. Click "Run workflow"
4. Optionally enter a custom tag value (default is "tag 2")
5. Click "Run workflow" button

## Prerequisites

To use this workflow in your repository:

1. Enable GitHub Actions in your repository
2. Enable GitHub Container Registry for your account/organization
3. Ensure your repository has the appropriate permissions set:
   - Go to Settings > Actions > General > Workflow permissions
   - Select "Read and write permissions"

## Best Practices Implemented

1. **Reusable Workflows**: Modular design allows for code reuse
2. **Secure Authentication**: Using built-in `GITHUB_TOKEN` for authentication
3. **Input Parametrization**: Configurable inputs for flexibility
4. **Proper Error Handling**: Validation and error checking in scripts
5. **Docker Best Practices**: 
   - Using specific version tags for base images
   - Minimalist container with only necessary dependencies
   - Proper layer caching
6. **CI/CD Pipeline**: Fully automated workflow from code change to deployment

## Security Considerations

This workflow uses the default `GITHUB_TOKEN` which:
- Is automatically created for each workflow run
- Has the minimum required permissions
- Expires after the workflow completes
- Does not require storing any secrets in your repository

## License

[Specify your license here] 