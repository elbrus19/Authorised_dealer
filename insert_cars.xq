module namespace page = 'http://basex.org/examples/web-page';

declare
  %rest:POST
  %rest:path('/Authorised_dealer/insert_cars')
  %rest:form-param("id","{$id}","(no id)")
  %rest:form-param("brand","{$brand}","(no brand)")
  %rest:form-param("model","{$model}","(no model)")
  %rest:form-param("price","{$price}","(no price)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
  updating function page:insert_cars($brand as xs:string, $model as xs:string, $price as xs:integer, $id as xs:integer ) {
      update:output(web:redirect('/Authorised_dealer')),
      for $c in doc("authorised_dealer")//cars
      return insert node
        <car>
          <id>{$id}</id>
          <brand>{$brand}</brand>
          <model>{$model}</model>
          <price>{$price}</price>
        </car>
      as first into $c
};