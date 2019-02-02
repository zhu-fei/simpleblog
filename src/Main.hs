{-# LANGUAGE OverloadedStrings , ExtendedDefaultRules#-}
{-# LANGUAGE DeriveGeneric     #-}

{-# LANGUAGE DataKinds #-}


{-# LANGUAGE TemplateHaskell            #-}



{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}

{-# LANGUAGE QuasiQuotes                #-}

{-# LANGUAGE TypeFamilies               #-}

module Main where

import Protocols.AssistAttack
-- import Text.Parsec (parse)

import Control.Monad.IO.Class (liftIO)
import Control.Monad (forM_)
import Control.Monad.Logger
import Control.Monad.Trans
import Control.Monad.Trans.Resource

import Data.Semigroup ((<>))
import Data.HVect
import Data.Text (Text)
import qualified Data.Text as T
import Data.IORef

import Web.Spock.Lucid (lucid)

import Lucid
import Data.String.Conversions
 
import qualified Data.ByteString.Char8 as C

import Web.Spock
import Web.Spock.Config

import           Database.Persist        hiding (get)
import          Database.Persist.Sqlite hiding (get)


import Network.Wai.Middleware.Static

import Data.Aeson hiding (json)
import           Data.Monoid      ((<>))
import           Data.Text        (Text, pack, unpack)
import           GHC.Generics

import Web.Views.Login
import Web.Views.Home
import Web.Model.CoreTypes



data Note = Note {author :: Text,  contents :: Text}

newtype ServerState = ServerState { notes :: IORef [Note]}


type ApiAction a = SpockAction SqlBackend () ServerState a


blaze ::  (MonadIO m) => Html () -> ActionCtxT ctx m a
blaze = lazyBytes .cs . renderText 


loginAction :: ApiAction ()
loginAction = do
  liftIO $ putStrLn "loginAction"

-- app :: Server ()
-- app = return ()
-- app = get root (text "Hello")
-- app = get root (html "<h1>Hello!")
-- app :： SpockM conn sess st ()
baseHook :: ApiAction  ()
baseHook = return ()

app = 
  prehook baseHook $ do
      middleware ( staticPolicy $ addBase "static")
      get "/logi" $ do
        lucid $ do
          loginView 

      getpost "/login" 
         loginAction



      get "/"  $ do
        allPosts <- runSQL $ selectList [] [Desc PostDate]
        liftIO $ print allPosts
        lucid $ do
          homeView allPosts




runSQL :: (HasSpock m, SpockConn m ~ SqlBackend) => SqlPersistT (NoLoggingT (ResourceT IO)) a -> m a
runSQL action =
    runQuery $ \conn ->
        runResourceT $ runNoLoggingT $ runSqlConn action conn



main :: IO ()
main = do

  pool <- runStdoutLoggingT $ createSqlitePool "api.db" 5 
  
  runStdoutLoggingT $ runSqlPool (runMigration migrateCore) pool
  
  serverState <-ServerState <$> newIORef [Note "Alick" "Walk the dog!" ,
                                          Note "jelly" "Get the food!"]
  cfg <- defaultSpockCfg ()  (PCPool pool) serverState

  runSpock 8080 (spock cfg app)









-- data Person = Person
--   { name :: Text
--   , age  :: Int
--   } deriving (Generic, Show)

-- instance ToJSON Person

-- instance FromJSON Person


{-
    if user jsonBody' to paser json body, you should send the json through ajax
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
  <script type="text/javascript" src="https://tugenhua0707.github.io/html5UploadImage/js/jquery.js"></script>
</head>
<body>
  <div id="app">
    <div class="btn">send post request</div>
  </div>

  <script>
    $('.btn').click(function() {
      $.ajax({
        url: 'http://localhost:8080/',
        type: 'POST',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify({ "name": "Bart", "age": 10 }),
        success: function(d) {
          
        }
      })
    });
  </script>
</body>
</html>
    -}


    
  -- get root $ do
  --   notes' <- getState >>= (liftIO . readIORef . notes)
  --   lucid $ do
  --     h1_ "Notes"
  --     ul_ $forM_ notes' $ \note -> li_ $ do
  --       toHtml (author note)
  --       ":"
  --       toHtml (contents note)

  --     h2_ "New Note"
  --     form_ [method_ "post"] $ do
  --       label_ $ do
  --         "Author: "
  --         input_ [name_ "author"]
  --       label_ $ do
  --         "Contents: "
  --         textarea_ [name_ "contents"] "default text"
  --       input_ [ type_ "submit" , value_ "Add Note"]
  -- post root $ do
  --   author <- param' "author"
  --   contents  <- param' "contents"
  --   notesRef <- notes <$> getState
  --   liftIO $ atomicModifyIORef' notesRef $ \notes ->
  --     (notes <> [Note author contents], ())
  --   redirect "/"