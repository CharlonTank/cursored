module Types exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation exposing (Key)
import Url exposing (Url)


type alias FrontendModel =
    { key : Key
    , message : String
    , user : Maybe UserData
    , preferences : Maybe Preferences
    }


type alias BackendModel =
    { message : String
    }


type FrontendMsg
    = UrlClicked UrlRequest
    | UrlChanged Url
    | NoOpFrontendMsg
    | BatchComplete (Result Error (List ResourceData))


type ToBackend
    = NoOpToBackend


type BackendMsg
    = NoOpBackendMsg


type ToFrontend
    = NoOpToFrontend


type alias UserData =
    { id : String
    , name : String
    }


type alias Preferences =
    { theme : String
    , notifications : Bool
    }


type ResourceData
    = UserResource UserData
    | PreferencesResource Preferences




type Error
    = HttpError String
    | UnknownError
