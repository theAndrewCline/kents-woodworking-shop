module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)



-- MAIN


main =
    Browser.document
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
    ( { title = "Kent's Woodworking Shop"
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


view : Model -> Browser.Document Msg
view model =
    { title = model.title
    , body =
        [ navigation model
        , landingPage model
        ]
    }


navigation : Model -> Html Msg
navigation model =
    nav [ class "bg-red-600" ]
        [ ul [ class "flex items-center justify-end h-10" ]
            [ li [ class "mr-6 " ] [ a [ class "text-orange-100", href "#" ] [ text "Home" ] ]
            , li [ class "mr-6" ] [ a [ class "text-orange-100", href "#" ] [ text "About" ] ]
            , li [ class "mr-6" ] [ a [ class "text-orange-100", href "#" ] [ text "Projects" ] ]
            ]
        ]


landingPage : Model -> Html Msg
landingPage model =
    div [ class ".container bg-orange-100 p-6" ]
        [ h1 [ class "text-2xl mb-2" ] [ text model.title ]
        , p [ class "text-gray-800" ] [ text model.greeting ]
        ]
