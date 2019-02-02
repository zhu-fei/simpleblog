{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}

import Lucid
import Lucid.Supplemental
import System.IO (stdout, hSetEncoding, utf8)
import Data.Text.Lazy.IO as L

main :: IO ()
main = do
  hSetEncoding stdout utf8
  L.hPutStr stdout (renderText template1)


-- Template for file: home.html
template1 :: Html ()
template1 = do
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
      link_ [ type_ "text/css", rel_ "stylesheet", href_ "/css/home.css" ]
      ""
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
        tbody_ $ do
          ""
          tr_ $ do
            ""
            th_ [ scope_ "row" ] $ "1"
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
            ""
          ""
          tr_ $ do
            ""
            th_ [ scope_ "row" ] $ "1"
            ""
            td_ $ do
              ""
              img_ [ width_ "50", height_ "50", src_ "http://api.randomuser.me/portraits/women/46.jpg", alt_ "Rosemary Porter", class_ "img-responsive rounded-circle" ]
              ""
            ""
            td_ "2"
            ""
            td_ "21k"
            ""
            td_ "2018"
            ""
          ""
        ""
      ""
      toHtmlRaw  "<!-- End your code here -->"
      ""
    ""

