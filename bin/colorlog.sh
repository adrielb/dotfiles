tail -F $1 | awk '
  BEGIN   {IGNORECASE=1}
  /DEBUG/ {print "\033[34m" $0 "\033[39m"; next}
  /INFO/  {print "\033[32m" $0 "\033[39m"; next}
  /WARNING/ {print "\033[33m" $0 "\033[39m"; next}
  /ERROR/ {print "\033[31m" $0 "\033[39m"; next}
          {print; next}
'
