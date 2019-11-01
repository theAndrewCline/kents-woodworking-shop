module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page exposing (Page(..), urlPage)
import Url exposing (Url)



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
    , page : Page
    }



-- INIT


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key
      , url = url
      , page = Home
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
            ( { model | page = urlPage url }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW -- a quick test change


view : Model -> Browser.Document Msg
view model =
    { title = "Kent's Woodworking Shop"
    , body =
        [ navigation model
        , viewPage model.page
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


homePage : Html Msg
homePage =
    div [ class ".container bg-orange-100 p-6" ]
        [ h1 [ class "text-2xl mb-2" ] [ text "Kent's Woodworking Shop" ]
        , p [ class "text-gray-800" ] [ text "welcome take a look around" ]
        ]


viewPage : Page -> Html Msg
viewPage page =
    case page of
        Home ->
            homePage

        About ->
            div [] [ text "About Kent" ]

        Projects ->
            div [] [ text "Project Page" ]
