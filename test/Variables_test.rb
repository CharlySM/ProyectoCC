
$expected_raiz="<!DOCTYPE html>\r
<html>\r
\t<head>\r
\t\t<!--<link rel=styleSheet href=\"css/styles.css\" type=\"text/css\">-->\r
    <meta charset=\"utf-8\">\r
\t\t<title>\r
\t\t\t\tStatistics Football\r
\t\t\t</title>\r
\t</head>\r
  <body>\r
    <header>\r
      <h1>Statistic Football</h1>\r
    </header>\r
\r
    <form class=\"\" action=\"/registro\" method=\"get\">\r
\t\t\t\t\t<input type=\"submit\" name=\"Registro\" value=\"Registro\">\r
\t\t</form>\r
\r
    <form class=\"\" action=\"/login\" method=\"post\">\r
          <input type=\"submit\" name=\"Login\" value=\"Login\">\r
\t  </form>\r
\r
  </body>\r
</html>\r
"

$expectedRegistro="<!DOCTYPE html>\r
<html>\r
\t<head>\r
\t\t<!--<link rel=styleSheet href=\"css/styles.css\" type=\"text/css\">-->\r
    <meta charset=\"utf-8\">\r
\t\t<title>\r
\t\t\t\tStatistics Football\r
\t\t\t</title>\r
\t</head>\r
  <body>\r
    <header>\r
      <h1>Registro</h1>\r
    </header>\r
    <form class=\"\" action=\"/registrado\" method=\"post\">\r
        <p>Nombre: </p>\r
        <input type=\"text\" name=\"nombre\" value=\"\"><br>\r
        <p>Email: </p>\r
        <input type=\"text\" name=\"email\" value=\"\"><br>\r
        <p>Nombre usuario: </p>\r
        <input type=\"text\" name=\"userName\" value=\"\"><br>\r
        <p>Password: </p>\r
        <input type=\"password\" name=\"password\" value=\"\"><br>\r
\t\t\t\t<input type=\"submit\" name=\"Registrar\" value=\"Registrar\">\r
\t\t</form>\r
\r
  </body>\r
</html>\r
"

$expected_registrado="<!DOCTYPE html>
<html>
<head>
  <style type=\"text/css\">
  body { text-align:center;font-family:helvetica,arial;font-size:22px;
    color:#888;margin:20px}
  #c {margin:0 auto;width:500px;text-align:left}
  </style>
</head>
<body>
  <h2>Sinatra doesn’t know this ditty.</h2>
  <img src='http://example.org/__sinatra__/404.png'>
  <div id=\"c\">
    Try this:
    <pre>get &#x27;&#x2F;registrado&#x27; do
  &quot;Hello World&quot;
end
</pre>
  </div>
</body>
</html>
"

$expectedRegistroErroneo="Email erroneo o nombre usuario repetido"

$expectedLogin="<!DOCTYPE html>
<html>
<head>
  <style type=\"text/css\">
  body { text-align:center;font-family:helvetica,arial;font-size:22px;
    color:#888;margin:20px}
  #c {margin:0 auto;width:500px;text-align:left}
  </style>
</head>
<body>
  <h2>Sinatra doesn’t know this ditty.</h2>
  <img src='http://example.org/__sinatra__/404.png'>
  <div id=\"c\">
    Try this:
    <pre>get &#x27;&#x2F;login&#x27; do
  &quot;Hello World&quot;
end
</pre>
  </div>
</body>
</html>
"

$expectedLoginErroneo="Email erroneo o password erronea"

$expectedPrincipal="<!DOCTYPE html>\r
<html>\r
\t<head>\r
\t\t<!--<link rel=styleSheet href=\"css/styles.css\" type=\"text/css\">-->\r
    <meta charset=\"utf-8\">\r
\t\t<title>\r
\t\t\t\tStatistics Football\r
\t\t\t</title>\r
\t</head>\r
  <body>\r
    <header>\r
      <h1>Principal</h1>\r
    </header>\r
\r
    <h2>Bienvenido</h2>\r
\r
\t\t<form class=\"\" action=\"/equipoStatistics\" method=\"post\">\r
\t\t\t\t\t<input type=\"text\" name=\"equipo\" value=\"equipo\">\r
\t\t\t\t\t<input name=\"tipoRequest\" type=\"hidden\" value=\"1\">\r
\t\t\t\t\t<input type=\"submit\" name=\"equipoStatistics\" value=\"equipoStatistics\">\r
\t\t</form>\r
\r
\t\t<form class=\"\" action=\"/manyStatistics\" method=\"post\">\r
\t\t\t\t\t<input type=\"text\" name=\"equipo1\" value=\"equipo1\">\r
\t\t\t\t\t<input type=\"text\" name=\"equipo2\" value=\"equipo2\">\r
\t\t\t\t\t<input name=\"tipoRequest\" type=\"hidden\" value=\"2\">\r
\t\t\t\t\t<input type=\"submit\" name=\"manyStatistics\" value=\"manyStatistics\">\r
\t\t</form>\r
\r
\r
  </body>\r
</html>\r
"

def getRaiz
  $expected_raiz
end

def getRegistro
  $expectedRegistro
end

def getRegistrado
  $expected_registrado
end

def expectedRegistroErroneo
  $expectedRegistroErroneo
end

def expectedLogin
  $expectedLogin
end

def expectedLoginErroneo
  $expectedLoginErroneo
end

def expectedPrincipal
  $expectedPrincipal
end
