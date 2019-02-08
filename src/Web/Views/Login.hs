{-# LANGUAGE OverloadedStrings , ExtendedDefaultRules#-}
module Web.Views.Login where

import Lucid






-- loginView :: Html ()
-- loginView = do
--   doctype_
--   ""
--   html_ $ do
--     ""
--     head_ $ do
--       ""
--       link_ [ href_ "/bootstrap4.2.1/bootstrap.min.css", rel_ "stylesheet", id_ "bootstrap-css" ]
--       ""
--       script_ [ src_ "/bootstrap4.2.1/bootstrap.min.js" ] $ ""
--       ""
--       script_ [ src_ "/bootstrap4.2.1/jquery-3.3.1.slim.min.js" ] $ ""
--       ""
--       link_ [ type_ "text/css", rel_ "stylesheet", href_ "/css/login.css" ]
--       ""
--       title_ "HTML, CSS and JavaScript demo"
--       ""
--     ""
--     body_ $ do
--       ""
--       toHtmlRaw  "<!-- Start your code here -->"
--       ""
--       div_ [ id_ "login" ] $ do
--         ""
--         h3_ [ class_ "text-center text-white pt-5" ] $ "Login form"
--         ""
--         div_ [ class_ "container" ] $ do
--           ""
--           div_ [ id_ "login-row", class_ "row justify-content-center align-items-center" ] $ do
--             ""
--             div_ [ id_ "login-column", class_ "col-md-6" ] $ do
--               ""
--               div_ [ class_ "login-box col-md-12" ] $ do
--                 ""
--                 form_ [ id_ "login-form", class_ "form", action_ "", method_ "post" ] $ do
--                   ""
--                   h3_ [ class_ "text-center text-info" ] $ "Login"
--                   ""
--                   div_ [ class_ "form-group" ] $ do
--                     ""
--                     label_ [ for_ "username", class_ "text-info" ] $ "Username:"
--                     br_ []
--                     ""
--                     input_ [ type_ "text", name_ "username", id_ "username", class_ "form-control" ]
--                     ""
--                   ""
--                   div_ [ class_ "form-group" ] $ do
--                     ""
--                     label_ [ for_ "password", class_ "text-info" ] $ "Password:"
--                     br_ []
--                     ""
--                     input_ [ type_ "text", name_ "password", id_ "password", class_ "form-control" ]
--                     ""
--                   ""
--                   div_ [ class_ "form-group" ] $ do
--                     ""
--                     label_ [ for_ "remember-me", class_ "text-info" ] $ do
--                       span_ "Remember me"
--                       "?"
--                       span_ $ input_ [ id_ "remember-me", name_ "remember-me", type_ "checkbox" ]
--                     br_ []
--                     ""
--                     input_ [ type_ "submit", name_ "submit", class_ "btn btn-info btn-md", value_ "submit" ]
--                     ""
--                   ""
--                   div_ [ id_ "register-link", class_ "text-right" ] $ do
--                     ""
--                     a_ [ href_ "#", class_ "text-info" ] $ "Register here"
--                     ""
--                   ""
--                 ""
--               ""
--             ""
--           ""
--         ""
--       ""
--       toHtmlRaw  "<!-- End your code here -->"
--       ""
--     ""