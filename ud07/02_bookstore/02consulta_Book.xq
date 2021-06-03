<html>
<head>
  <title>Libreria</title>
</head>
  <ol>
     {for $i in doc('book')//book
      where $i/price>30
      order by $i/title
      return<li>{ $i/title/text()}</li>} 
  </ol>
</html>
