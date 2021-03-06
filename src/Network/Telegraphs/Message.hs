{-# LANGUAGE DeriveGeneric #-}
module Network.Telegraphs.Message where

import Data.Aeson
import GHC.Generics

import Network.Telegraphs.User
import Network.Telegraphs.Chat
import Network.Telegraphs.Audio
import Network.Telegraphs.Document
import Network.Telegraphs.PhotoSize
import Network.Telegraphs.Sticker
import Network.Telegraphs.Video
import Network.Telegraphs.Voice
import Network.Telegraphs.Contact
import Network.Telegraphs.Location

data Message =
  Message { message_id            :: Integer
          , from                  :: Maybe User
          , date                  :: Integer
          , chat                  :: Chat
          , forward_from          :: Maybe User
          , forward_date          :: Maybe Integer
          , reply_to_message      :: Maybe Message
          , text                  :: Maybe String
          , audio                 :: Maybe Audio
          , document              :: Maybe Document
          , photo                 :: Maybe [PhotoSize]
          , sticker               :: Maybe Sticker
          , video                 :: Maybe Video
          , voice                 :: Maybe Voice
          , caption               :: Maybe String
          , contact               :: Maybe Contact
          , location              :: Maybe Location
          , new_chat_participant  :: Maybe User
          , left_chat_participant :: Maybe User
          , new_chat_title        :: Maybe String
          , new_chat_photo        :: Maybe [PhotoSize]
          , delete_chat_photo     :: Maybe Bool
          , group_chat_created    :: Maybe Bool }
  deriving (Read, Show, Generic)

instance FromJSON Message
instance ToJSON Message
