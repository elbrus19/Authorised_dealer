module namespace page = 'http://basex.org/examples/web-page';

declare
  %rest:POST
  %rest:path('/Authorised_dealer/update_cars')
  %rest:form-param("brand","{$brand}","(no brand)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:Update_cars($brand as xs:string) as element (html) {
  <html>
    <head>
      <title>Update_cars</title>
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

       <!-- Latest compiled JavaScript -->
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
    <table class="table">
          <thead>
            <tr>
              <th>Id</th>
              <th>Brand</th>
              <th>Model</th>
              <th>Price</th>
            </tr>
          </thead>
        <tbody>
          {
          for $c in doc("authorised_dealer")//car
          where $c/brand/text()=$brand
          order by $c/brand
          return 
            <tr>
              <td>{$c/id/text()}</td>
              <td>{$c/brand/text()}</td> 
              <td>{$c/model/text()}</td>
              <td>{$c/price/text()}</td>
            </tr>
          }
        </tbody>
      </table>
      <div class="container">
      <form action="/Authorised_dealer/update_cars2" method="POST">
        <div class="form-group">
            <label for="id">ID:</label>
            <input type="number" name="id" class="form-control"/>
          </div>
        <div class="form-group">
            <label for="brand">Brand:</label>
            <input type="text" name="brand" class="form-control"/>
          </div>
        <div class="form-group">
            <label for="model">Model:</label>
            <input type="text" name="model" class="form-control"/>
          </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" name="price" class="form-control"/>
          </div>
          <button class="btn btn-primary">Update</button>
      </form>
      </div>
    </body>
  </html>
};

declare
  %rest:POST
  %rest:path('/Authorised_dealer/update_cars2')
  %rest:form-param("id","{$id}","(no id)")
  %rest:form-param("brand","{$brand}","(no brand)")
  %rest:form-param("model","{$model}","(no model)")
  %rest:form-param("price","{$price}","(no price)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
  updating function page:update_cars( $id as xs:integer, $brand as xs:string, $model as xs:string, $price as xs:integer) {
   update:output(web:redirect('/Authorised_dealer')),
   for $c in doc("authorised_dealer")//car
   where $c/id = $id
   return 
   replace node $c with 
         <car>
          <id>{$id}</id>
          <brand>{$brand}</brand>
          <model>{$model}</model>
          <price>{$price}</price>
        </car> 
 };