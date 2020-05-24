module namespace page = 'http://basex.org/examples/web-page';

declare
  %rest:POST
  %rest:path('/Authorised_dealer/delete_cars')
  %rest:form-param("id","{$id}","(no id)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
  updating function page:delete_cars($id as xs:integer) {
      update:output(web:redirect('/Authorised_dealer')),
      for $c in doc("authorised_dealer")//car
      where $c/id = $id
      return delete node $c
};