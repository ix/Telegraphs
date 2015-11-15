{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Network.Telegraphs.Chat where

import Data.Aeson
import GHC.Generics
import Data.Functor
import Control.Applicative
import Control.Monad

data Chat =
  Chat { id         :: Integer
       , type_      :: String
       , title      :: Maybe String
       , username   :: Maybe String
       , first_name :: Maybe String
       , last_name  :: Maybe String }
  deriving (Read, Show, Generic)

instance FromJSON Chat where
  parseJSON (Object v) =
    Chat <$> v .: "id"
         <*> v .: "type"
         <*> v .: "title"
         <*> v .: "username"
         <*> v .: "first_name"
         <*> v .: "last_name"
  parseJSON _ = mzero
instance ToJSON Chat
