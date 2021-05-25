for $b in doc('prediccion')//dia
where $b/@fecha="2013-06-11"
return $b/estado_cielo/text()