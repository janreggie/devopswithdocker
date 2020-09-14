#!/usr/bin/env fish

set -l current_directory (dirname (status --current-filename))
docker build -t rails-example-project $current_directory
docker run -d -p 3000:3000 rails-example-project
sleep 10
curl -v localhost:3000
# Content
#
# <!DOCTYPE html>
# <html>
#   <head>
#     <title>RailsExample</title>
#     <meta name="csrf-param" content="authenticity_token" />
# <meta name="csrf-token" content="Bod31wMbEKKPVeiQ+q+3Aax7+CP0tf9H+0+rLI2p2GuRhn8mxJ1XbpR26eQ0aLJgK/1WCZPl7a3oXk/nerBo1w==" />
#     
# 
#     <link rel="stylesheet" media="all" href="/assets/presses.self-e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855.css?body=1" data-turbolinks-track="reload" />
# <link rel="stylesheet" media="all" href="/assets/scaffolds.self-18a0eff730ed67848b11afc9309a831c6c583fd6a567ab26d51d443d92d365be.css?body=1" data-turbolinks-track="reload" />
# <link rel="stylesheet" media="all" href="/assets/application.self-f0d704deea029cf000697e2c0181ec173a1b474645466ed843eb5ee7bb215794.css?body=1" data-turbolinks-track="reload" />
#     <script src="/assets/rails-ujs.self-d109d8c5c0194c8ad60b8838b2661c5596b5c955987f7cd4045eb2fb90ca5343.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/activestorage.self-1ed4604ac2170045f1ffca4edb81a75246661555e4f9cf682bb8a21825e32e1c.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/turbolinks.self-569ee74eaa15c1e2019317ff770b8769b1ec033a0f572a485f64c82ddc8f989e.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/action_cable.self-69fddfcddf4fdef9828648f9330d6ce108b93b82b0b8d3affffc59a114853451.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/cable.self-8484513823f404ed0c0f039f75243bfdede7af7919dda65f2e66391252443ce9.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/presses.self-877aef30ae1b040ab8a3aba4e3e309a11d7f2612f44dde450b5c157aa5f95c05.js?body=1" data-turbolinks-track="reload"></script>
# <script src="/assets/application.self-66347cf0a4cb1f26f76868b4697a9eee457c8c3a6da80c6fdd76ff77e911715e.js?body=1" data-turbolinks-track="reload"></script>
#   </head>
# 
#   <body>
#     <h1>New Press</h1>
# 
# <p> Total presses: 0 </p>
# 
# <p id="notice"></p>
# 
# <form action="/presses" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="1NS/Z4W1ghneID09zgXdXjzcbkukfG2EfKFuPa+hiHkhNTqPw3ygBYvfNal0aOuzXeMgMSAUHsLhQ91nueJ24A==" />
#   
#   <div class="actions">
#     <input type="submit" name="commit" value="Press" data-disable-with="Press" />
#   </div>
# </form>
# 
# <a href="/presses">List presses</a>
# 
#   </body>
# </html>
