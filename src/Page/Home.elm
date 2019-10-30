module Page.Home exposing (Model, Msg, view)

import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url



-- MODEL


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , title : String
    , greeting : String
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class ".container bg-orange-100 p-6" ]
        [ h1 [ class "text-2xl mb-2" ] [ text model.title ]
        , p [ class "text-gray-800" ] [ text model.greeting ]
        ]
