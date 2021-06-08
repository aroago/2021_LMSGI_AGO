<libros>{

  for $book in //book
  let $autores:=$book/author
return
 <libro autores="{count($autores)}">{
  $book/title/text()}

</libro>}
</libros>