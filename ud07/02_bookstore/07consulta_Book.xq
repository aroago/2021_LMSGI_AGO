<html>
<head>
  <title>index</title>
</head>
<body>
<h1>Listado de Practicas</h1>
{for $tema in (1 to 7), $ejercicio in (1 to 3)
return <div>
<a href="ud($tema)/($ejercicio)">{ concat("Tema ", $tema,
"Ejercicio", $ejercicio)}</a>
</div>}
</body>
</html>