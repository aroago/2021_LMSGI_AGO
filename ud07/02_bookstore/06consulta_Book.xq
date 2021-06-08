<books>{
  for $num in doc('book')//book
  return 
  <book>{$num}. {$num/title/text()}
  </book>}
</books>