Write-Host "Installing Go..."
winget install --id GoLang.Go -e --source winget --accept-source-agreements --accept-package-agreements

Write-Host "Installing GitHub CLI..."
winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements

Write-Host "Refreshing Environment Variables..."
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Running go mod tidy..."
go mod tidy

Write-Host "Authenticating with GitHub CLI..."
gh auth login

Write-Host "Creating GitHub Issue..."
gh issue create --title "Implement Advanced Compose MCP Proxy Server with handrails, guardrails, and Pod isolation" --body "This issue covers the implementation of the MCP proxy server, focusing on Pod isolation, RBAC guardrails, and dry-run handrails. Checklist of files: main.go, config/config.go, handrails/state.go, handrails/dryrun.go, guardrails/rbac.go, mcp/server.go, mcp/tools.go."

Write-Host "Committing and Pushing Code..."
git add .
git commit -m "Implement Advanced Compose MCP Proxy Server"
git branch -M main
# Note: You may need to add a remote here if not already done: git remote add origin <URL>
git push -u origin main

Write-Host "Creating Pull Request..."
gh pr create --title "Implement Advanced Compose MCP Proxy Server" --body "Implementation of the Advanced Compose MCP Proxy Server. All guardrails and handrails are in place. Addresses the issue."

Write-Host "Setup Complete!"
