for $i in doc('book') //book
where $i/price>30
order by $i/title
return $i/title/text()