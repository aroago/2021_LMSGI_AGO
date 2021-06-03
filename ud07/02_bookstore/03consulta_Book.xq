<books>
{for $x in doc("book")/bookstore/book
return if ($x/@category='CHILDREN') then(
   <child>{data($x/title)}</child>
 )else
   <adult>{data($x/title)}</adult>
}
</books>
