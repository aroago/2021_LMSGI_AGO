<libros>{

  for $book in //book
return
 <libro>
{$book/title}
{$book/author}
</libro>}
</libros>