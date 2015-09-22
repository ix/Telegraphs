{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.Document where

import Data.Aeson
import GHC.Generics

import Network.Telegraphs.PhotoSize

data Document =
  Document { file_id   :: String
           , thumb     :: Maybe PhotoSize
           , file_name :: Maybe String
           , mime_type :: Maybe String
           , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON Document
instance ToJSON Document
