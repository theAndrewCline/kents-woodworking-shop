module Page exposing (Page(..), urlPage)

import Html exposing (..)
import Url exposing (Url)
import Url.Parser as Url exposing ((</>), Parser)


type Page
    = Home
    | About
    | Projects


urlParser : Parser (Page -> a) a
urlParser =
    Url.oneOf
        [ Url.map Home (Url.s "home")
        , Url.map About (Url.s "about")
        , Url.map Projects (Url.s "projects")
        ]


urlPage : Url.Url -> Page
urlPage url =
    url
        |> Url.parse urlParser
        |> Maybe.withDefault Home
