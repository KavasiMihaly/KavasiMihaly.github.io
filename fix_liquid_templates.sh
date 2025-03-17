#!/bin/bash

# Script to wrap code blocks containing curly braces with raw/endraw tags
# This prevents Jekyll from interpreting them as Liquid template directives

# Find all HTML and MD files
find . -type f \( -name "*.html" -o -name "*.md" \) | while read file; do
  # Check for code blocks containing curly braces without raw tags
  if grep -q '<pre' "$file" && grep -q '{{' "$file" && ! grep -q '{% raw %}' "$file"; then
    echo "Fixing $file"
    # Add raw tags to code blocks
    sed -i 's/<pre class="wp-block-code"><code>/<pre class="wp-block-code"><code>{% raw %}/g' "$file"
    sed -i 's/<\/code><\/pre>/<\/code>{% endraw %}<\/pre>/g' "$file"
    
    # Also fix syntax highlighter blocks
    sed -i 's/<pre class="wp-block-syntaxhighlighter-code">/<pre class="wp-block-syntaxhighlighter-code">{% raw %}/g' "$file"
    sed -i 's/<\/pre>/<\/code>{% endraw %}<\/pre>/g' "$file"
  fi
  
  # Protect {{site.baseurl}} references outside of code blocks
  if grep -q '{{site.baseurl}}' "$file" && ! grep -q '{% raw %}{{site.baseurl}}{% endraw %}' "$file"; then
    echo "Fixing site.baseurl references in $file"
    sed -i 's/{{site.baseurl}}/{% raw %}{{site.baseurl}}{% endraw %}/g' "$file"
  fi
done

echo "All files fixed!"
