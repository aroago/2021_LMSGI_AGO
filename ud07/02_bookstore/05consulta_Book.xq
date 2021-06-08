for $libro in doc('book')//book
where $libro/prize>30
order by $libro/title
return concat(data($libro/title/text()),':',data($libro/price),'$')
 