module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , title : String
    , greeting : String
    }



-- INIT


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key
      , url = url
      , title = "Kent's Woodworking Shop"
      , greeting = "Welcome, take a look around"
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = UrlChanged Url.Url
    | LinkClicked Browser.UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW -- a quick test change


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
            [ li [ class "mr-6 " ] [ a [ class "text-orange-100", href "/home" ] [ text "Home" ] ]
            , li [ class "mr-6" ] [ a [ class "text-orange-100", href "/about" ] [ text "About" ] ]
            , li [ class "mr-6" ] [ a [ class "text-orange-100", href "/projects" ] [ text "Projects" ] ]
            ]
        ]


landingPage : Model -> Html Msg
landingPage model =
    div [ class ".container bg-orange-100 p-6" ]
        [ h1 [ class "text-2xl mb-2" ] [ text model.title ]
        , p [ class "text-gray-800" ] [ text model.greeting ]
        ]
