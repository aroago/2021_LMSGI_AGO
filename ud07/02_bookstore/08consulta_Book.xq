for $book in //book
let $autores:=$book/author
where count($autores)>2
return $book/title/text()