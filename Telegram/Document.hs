{-# LANGUAGE DeriveGeneric #-}
module Telegram.Document where

import Data.Aeson
import GHC.Generics

import Telegram.PhotoSize

data Document =
  Document { file_id   :: String
           , thumb     :: PhotoSize
           , file_name :: Maybe String
           , mime_type :: Maybe String
           , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON Document
instance ToJSON Document
