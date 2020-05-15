module namespace page = 'http://basex.org/examples/web-page';

declare
  %rest:GET
  %rest:path('/Authorised_dealer')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:Authorised_dealer() as element (html) {
  <html>
    <head>
      <title>Authorised_dealer</title>
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
      <form action="/Authorised_dealer/office_cars" method="POST">
        Cars:<input type="text" name="cars"/>
        <button type="submit">Send</button>
      </form>
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