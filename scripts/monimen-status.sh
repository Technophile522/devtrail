#!/bin/bash
# monimen-status.sh - Check Monimen documentation compliance
# Usage: ./scripts/monimen-status.sh

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

MONIMEN_DIR=".monimen"
TODAY=$(date +%Y-%m-%d)

echo ""
echo "Monimen Status"
echo "================================================================================"
echo ""

# Check if .monimen exists
if [ ! -d "$MONIMEN_DIR" ]; then
    echo -e "${RED}Error: .monimen directory not found.${NC}"
    echo "Monimen Framework may not be installed in this project."
    exit 1
fi

# Check if git repo
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${YELLOW}Warning: Not a git repository. Limited functionality.${NC}"
    echo ""
fi

# Recent Monimen documents
echo -e "${BLUE}Recent Documents (last hour):${NC}"
recent_docs=$(git log --since="1 hour ago" --name-only --pretty=format: -- ".monimen/**/*.md" 2>/dev/null | sort -u | grep -v "^$" || true)

if [ -z "$recent_docs" ]; then
    # Try today's documents
    recent_docs=$(find "$MONIMEN_DIR" -name "*-${TODAY}-*.md" -type f 2>/dev/null || true)
fi

if [ -z "$recent_docs" ]; then
    echo "  (none)"
else
    echo "$recent_docs" | while read -r doc; do
        if [ -n "$doc" ]; then
            echo -e "  ${GREEN}✅${NC} $(basename "$doc")"
        fi
    done
fi

echo ""

# Modified source files
echo -e "${BLUE}Modified Source Files:${NC}"
modified_files=$(git diff --name-only HEAD~1 2>/dev/null || git diff --name-only 2>/dev/null || true)

# Filter to source files only
source_files=$(echo "$modified_files" | grep -E '\.(ts|js|tsx|jsx|py|go|rs|java|cs|rb|php|c|cpp|h|hpp)$' || true)

if [ -z "$source_files" ]; then
    echo "  (no source files modified)"
else
    echo "$source_files" | while read -r file; do
        if [ -n "$file" ]; then
            lines=$(git diff --numstat HEAD~1 -- "$file" 2>/dev/null | awk '{print $1"+"$2"-"}' || echo "?")
            echo -e "  ${YELLOW}⚠️${NC} $file ($lines lines)"
        fi
    done
fi

echo ""

# Count summary
doc_count=$(echo "$recent_docs" | grep -c "^" 2>/dev/null || echo "0")
file_count=$(echo "$source_files" | grep -c "^" 2>/dev/null || echo "0")

echo -e "${BLUE}Summary:${NC}"
echo "  Documents created today: $doc_count"
echo "  Source files modified: $file_count"

if [ "$file_count" -gt 0 ] && [ "$doc_count" -eq 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Source files modified but no documentation created.${NC}"
    echo "   Consider running: ./scripts/monimen-new.sh"
fi

echo ""
