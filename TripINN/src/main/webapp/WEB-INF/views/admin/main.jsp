<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap | Get Started</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <div class="jumbotron">
            <h1><span class="glyphicon glyphicon-thumbs-up"></span> Hello, world!</h1>
            <p>Lorem Ipsum Dolor</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button" data-toggle="tooltip" data-placement="bottom" title="Tooltip on bottom">Learn more</a></p>
          </div>
        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      $( function () {
        $( '[data-toggle="tooltip"]' ).tooltip();
      } );
    </script>
  </body>
</html>