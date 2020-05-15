module namespace page = 'http://basex.org/examples/web-page';

declare
  %rest:POST
  %rest:path('/Authorised_dealer/office_cars')
  %rest:form-param("cars","{$cars}","(no cars)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:Authorised_dealer($cars as xs:string) as element (html) {
  <html>
    <head>
      <title>Office_cars</title>
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
      <h1>Office_cars</h1>
        <table class="table">
          <thead>
            <tr>
              <th>Brand</th>
              <th>Model</th>
              <th>Price</th>
            </tr>
          </thead>
        <tbody>
          {
          for $c in doc("authorised_dealer")//car
          where $c/brand/text()=$cars
          order by $c/brand
          return 
            <tr>
              <td>{$c/brand/text()}</td> 
              <td>{$c/model/text()}</td>
              <td>{$c/price/text()}</td>
            </tr>
          }
        </tbody>
      </table>
    </body>
  </html>
};