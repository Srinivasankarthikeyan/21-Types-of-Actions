# Docker Container Action - Greeting Example

## Overview
This is a **Docker Container Action** that generates personalized greeting messages based on inputs.

## Why Docker Container Actions?
- ✅ Consistent and reliable environment (all dependencies packaged)
- ✅ Good for complex environments requiring specific OS/tools
- ✅ Language agnostic (can use any language)
- ❌ Slower than JavaScript actions (container build time)

## Files Breakdown

### `action.yml`
Metadata file that defines:
- **inputs**: What the action accepts (name, greeting-style)
- **outputs**: What the action returns (greeting-message)
- **runs**: Specifies `docker` as the runtime and points to `Dockerfile`

### `Dockerfile`
Defines the Docker image:
- Starts from Ubuntu 22.04 base
- Installs dependencies (curl, jq)
- Copies entrypoint script
- Sets entrypoint to run the script

### `entrypoint.sh`
Shell script that:
- Receives inputs from action.yml args
- Processes the inputs (greeting logic)
- Sets outputs using `$GITHUB_OUTPUT`
- Performs action logic

### `example-workflow.yml`
Sample workflow showing how to use this action.

## How to Use

1. Commit all files to your GitHub repository
2. Reference the action in a workflow:
   ```yaml
   - uses: your-org/docker-action-repo@main
     with:
       name: "Alice"
       greeting-style: "excited"
   ```
3. Access the output:
   ```yaml
   - run: echo "${{ steps.greet.outputs.greeting-message }}"
   ```

## Exam Tips
- Docker actions are slower than JavaScript because Docker builds/pulls the image
- Use when you need a specific OS environment or complex dependencies
- Always set `runs: using: docker` and `runs: image: Dockerfile`
- Outputs must be set using `echo "key=value" >> $GITHUB_OUTPUT`
