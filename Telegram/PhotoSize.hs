{-# LANGUAGE DeriveGeneric #-}
module Telegram.PhotoSize where

import Data.Aeson
import GHC.Generics

data PhotoSize =
  PhotoSize { file_id   :: String
            , width     :: Integer
            , height    :: Integer
            , file_size :: Maybe Integer }
  deriving (Read, Show, Generic)

instance FromJSON PhotoSize
instance ToJSON PhotoSize
