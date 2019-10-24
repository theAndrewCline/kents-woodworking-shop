module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



-- MAIN


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { title : String
    , greeting : String
    }



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( { title = "Kents Woodworking Shop"
      , greeting = "Welcome, take a look around"
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "bg-teal" ]
        [ h1 [ class "" ] [ text model.title ]
        , p [] [ text model.greeting ]
        ]
