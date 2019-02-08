{-# LANGUAGE OverloadedStrings , ExtendedDefaultRules#-}



module Web.Forms.Login where 

import qualified Data.Text as T

import Lucid

import Text.Digestive

import Text.Digestive.Lucid.Html5




data LoginRequest  = LoginRequest { lr_user :: T.Text 
                                   ,lr_password :: T.Text
                                  } deriving (Show)

loginForm :: Monad m => Form (Html ()) m LoginRequest
loginForm = LoginRequest <$> "name" .: text Nothing 
                         <*> "password" .: text Nothing 





loginFormView :: View (Html ()) -> Html ()
loginFormView view= do
  doctype_
  ""
  html_ $ do
    ""
    head_ $ do
      ""
      link_ [ href_ "/bootstrap4.2.1/bootstrap.min.css", rel_ "stylesheet", id_ "bootstrap-css" ]
      ""
      script_ [ src_ "/bootstrap4.2.1/bootstrap.min.js" ] $ ""
      ""
      script_ [ src_ "/bootstrap4.2.1/jquery-3.3.1.slim.min.js" ] $ ""
      ""
      link_ [ type_ "text/css", rel_ "stylesheet", href_ "/css/login.css" ]
      ""
      title_ "HTML, CSS and JavaScript demo"
      ""
    ""
    body_ $ do
      ""
      toHtmlRaw  "<!-- Start your code here -->"
      ""
      div_ [ id_ "login" ] $ do
        ""
        h3_ [ class_ "text-center text-white pt-5" ] $ "Login form"
        ""
        div_ [ class_ "container" ] $ do
          ""
          div_ [ id_ "login-row", class_ "row justify-content-center align-items-center" ] $ do
            ""
            div_ [ id_ "login-column", class_ "col-md-6" ] $ do
              ""
              div_ [ class_ "login-box col-md-12" ] $ do
                ""
                form_ [ id_ "login-form", class_ "form", action_ "", method_ "post" ] $ do
                  ""
                  h3_ [ class_ "text-center text-info" ] $ "Login"
                  ""
                  div_ [ class_ "form-group" ] $ do
                    ""
                    label_ [ for_ "username", class_ "text-info" ] $ "Username:"
                    br_ []
                    ""
                    inputWithType "text" [class_ "form-control"] "name" view
                    -- inputText "name" v
                    -- input_ [ type_ "text", name_ "username", id_ "username", class_ "form-control" ]
                    ""
                  ""
                  div_ [ class_ "form-group" ] $ do
                    ""
                    label_ [ for_ "password", class_ "text-info" ] $ "Password:"
                    br_ []
                    ""
                    
                    inputWithType "password" [class_ "form-control"] "password" view
                    -- inputText "password" v
                    -- input_ [ type_ "text", name_ "password", id_ "password", class_ "form-control" ]
                    ""
                  ""
                  div_ [ class_ "form-group" ] $ do
                    ""
                    label_ [ for_ "remember-me", class_ "text-info" ] $ do
                      span_ "Remember me"
                      "?"
                      span_ $ input_ [ id_ "remember-me", name_ "remember-me", type_ "checkbox" ]
                    br_ []
                    ""
                    input_ [ type_ "submit", name_ "submit", class_ "btn btn-info btn-md", value_ "submit" ]
                    ""
                  ""
                  div_ [ id_ "register-link", class_ "text-right" ] $ do
                    ""
                    a_ [ href_ "#", class_ "text-info" ] $ "Register here"
                    ""
                  ""
                ""
              ""
            ""
          ""
        ""
      ""
      toHtmlRaw  "<!-- End your code here -->"
      ""
    ""


-- renderLoginForm :: View (Html ()) -> (Html ())
-- renderLoginForm v = do
--     loginHead
--     form v "login" $ do
--         div_ $ do
--             label "name" v "pls input your name: "
--             inputText "name" v
            
--             br_ []
    
--             label "password" v "pls input your pwd: "
--             inputText "password" v
            
--         inputSubmit "Submit"






-- loginHead :: Html ()
-- loginHead = do
--   doctype_
--   html_ $ do
--     body_ $ do
--       toHtmlRaw  $ "<!-- Start your code here -->"


