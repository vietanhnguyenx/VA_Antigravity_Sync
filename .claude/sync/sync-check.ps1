# sync-check.ps1 — PostToolUse hook for dual-scope sync reminder
# Triggered after Edit/Write tool calls. Reads tool input from stdin (JSON),
# checks whether the edited path is in a tracked scope, and prints a reminder.

param()

try {
    $payload = [Console]::In.ReadToEnd() | ConvertFrom-Json
    $filePath = $payload.tool_input.file_path

    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

    # Normalize path separators
    $normalized = $filePath.Replace('\', '/')

    # Map a file path to its mirror counterpart
    $mirror = $null
    $scope = $null

    if ($normalized -match '/CLAUDE\.md$') {
        $mirror = $normalized -replace '/CLAUDE\.md$', '/HUMAN.md'
        $scope = 'AGENTS'
    }
    elseif ($normalized -match '/HUMAN\.md$') {
        $mirror = $normalized -replace '/HUMAN\.md$', '/CLAUDE.md'
        $scope = 'HUMAN'
    }
    elseif ($normalized -match '\.claude/human/') {
        $mirror = $normalized -replace '\.claude/human/', '.claude/'
        $scope = 'HUMAN'
    }
    elseif ($normalized -match '\.claude/(agents|commands|templates|glossary)/') {
        $mirror = $normalized -replace '\.claude/', '.claude/human/'
        $scope = 'AGENTS'
    }

    if ($null -ne $mirror) {
        $target = if ($scope -eq 'AGENTS') { 'HUMAN scope (Vietnamese)' } else { 'AGENTS scope (English)' }
        Write-Output "[SYNC] You edited a file in the $scope scope. Per .claude/sync/SYNC-PROTOCOL.md, you MUST also update its mirror in the $target before completing the task: $mirror"
    }
}
catch {
    # Silent on parse failures — do not block tool execution
    exit 0
}
