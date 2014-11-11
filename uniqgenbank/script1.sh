 while IFS= read -r line; do
      printf '%s\n' "$line"
    done < "$largestfirst.out"

cat largestfirst.out | while read -r line; do  printf '%s\n' "$line" ; done

cat largestfirst.out | while read -r line; do  cat $line | wc ; done

#mkdir
cat largestfirst.out | while read -r line; do mkdir ../output/$line ; done

#cut the four extensions
| cut -d'.' --complement -f4-
