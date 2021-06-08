<html>
<head>
<title>Libreria</title>
<link rel="stylesheet" href="estilos.css" type="text/css" />
</head>
<body>
<h1>Bookstore</h1>
  <table>
    <tr>
      <th>Titulo</th>
      <th>Categoria</th>
    </tr>
      {for $titulo in doc('book')//book
        order by $titulo/title
        return
        <tr>
           <td>{ $titulo/title/text()}</td>
           <td>{data($titulo/@category)}</td>
        </tr>
      }
  </table>
  <ul>
      {for $titulo in doc('book')//book
      order by $titulo/title
       return
       <li class="{data($titulo/@category)}">
         { $titulo/title/text()}
       </li>
       }
  </ul>
</body>
</html>