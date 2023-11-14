#!/usr/bin/zsh

# Check if the first argument is "-h" or "--help" to display usage information.
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 <pattern> <file> [-p/--progress]"
    echo "  <pattern>    : The search pattern."
    echo "  <file>       : The file to search in."
    echo "  -p, --progress: Enable progress tracking (optional)."
    exit 0
fi

# Check if at least two arguments (pattern and file) are provided; otherwise, display usage instructions and exit.
if [[ $# -lt 2 ]]; then
    echo "Usage: $0 <pattern> <file> [-p/--progress]"
    exit 1
fi

# Assign the provided arguments to variables.
pattern="$1"
file="$2"
total_lines=$(wc -l < "$file")

# Check if the third argument is "--progress" or "-p" to enable progress tracking.
if [[ "$3" == "--progress" || "$3" == "-p" ]]; then
    # Use grep -E to search for the pattern, pipe the output through 'pv' for progress tracking,
    # and then process the results with sorting, counting, and formatting.
    grep -E -io "$pattern" "$file" | pv -l -s "$total_lines" -N "grep progress" | sort | uniq -c | sort -nr | awk '{lines[NR]=$0; if (length($1) > max) max = length($1);} END { for (i=1; i<=NR; i++) { split(lines[i], fields); printf "%" max "d %s\n", fields[1], fields[2]; }}'
else
    # Use grep -E to search for the pattern and process the results with sorting, counting, and formatting.
    grep -E -io "$pattern" "$file" | sort | uniq -c | sort -nr | awk '{lines[NR]=$0; if (length($1) > max) max = length($1);} END { for (i=1; i<=NR; i++) { split(lines[i], fields); printf "%" max "d %s\n", fields[1], fields[2]; }}'
fi
