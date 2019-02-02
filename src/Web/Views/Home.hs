{-# LANGUAGE OverloadedStrings , ExtendedDefaultRules#-}
module Web.Views.Home where
import Control.Monad  
import Lucid
import Database.Persist
import Web.Model.CoreTypes


homeView :: [Entity Post] -> Html ()
homeView posts = do
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
    --   link_ [ type_ "text/css", rel_ "stylesheet", href_ "/css/home.css" ]
    --   ""
      title_ "HTML, CSS and JavaScript demo"
      ""
    ""
    body_ $ do
      ""
      toHtmlRaw  "<!-- Start your code here -->"
      ""
      table_ [ class_ "table" ] $ do
        ""
        thead_ $ do
          ""
          tr_ $ do
            ""
            th_ [ style_ "width: 50% ", scope_ "col" ] $ "Topic"
            ""
            th_ [ style_ "width: 20% ", scope_ "col" ] $ "user"
            ""
            th_ [ style_ "width: 5%", scope_ "col" ] $ "Reply"
            ""
            th_ [ style_ "width: 10%", scope_ "col" ] $ "Views"
            ""
            th_ [ style_ "width: 10%", scope_ "col" ] $ "actitive"
            ""
          ""
        ""
        tbody_ $
          forM_ posts $ \post ->
          tr_ $ do
            ""
            th_ [ scope_ "row" ] $ toHtmlRaw (postTitle (entityVal post))
            ""
            td_ $ do
              ""
              img_ [ width_ "50", height_ "50", class_ "figure-img img-fluid  rounded-circle", alt_ "Responsive image", src_ "http://api.randomuser.me/portraits/women/46.jpg", alt_ "Rosemary Porter", class_ "img-responsive img-circle" ]

              ""
            ""
            td_ "2"
            ""
            td_ "21k"
            ""
            td_ "2018"