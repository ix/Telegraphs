{-# LANGUAGE DeriveGeneric #-}
module Telegram.Sticker where

import Data.Aeson
import GHC.Generics

import Telegram.PhotoSize

data Sticker =
  Sticker { file_id   :: String
          , width     :: Integer
          , height    :: Integer
          , thumb     :: PhotoSize
          , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON Sticker
instance ToJSON Sticker
