for $i in doc('prediccion')//estado_cielo/@descripcion
order by($i)
return data( $i)