module GameJam exposing (Model, main)

import Browser
import Browser.Dom exposing (Element)
import Element exposing (Element, centerX, column, el, fill, fillPortion
                        , height, image, layout, maximum, mouseOver, padding
                        , px, rgb255, row, spacing, width)
import Element.Background as Background
import Element.Events exposing (..)
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes exposing (height, width)
import List exposing (maximum)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }


view : Model -> Html msg
view model =
    layout [] <|
        column [ Element.height fill, Element.width fill ]
            [ topPannel
            , decorativeRow
            , row [ Element.height fill, Element.width fill ]
                [ technologyPanel, effectsPanel, sourceControlPanel ]
            , decorativeRow
            ]



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        HoverOver ->
            { model | hover = True }

        HoverExit ->
            { model | hover = False }



-- MODEL


type alias Model =
    { hover : Bool
    , hoverExit : Bool
    }


initialModel : Model
initialModel =
    { hover = False
    , hoverExit = False
    }


type Msg
    = HoverOver
    | HoverExit



-- FUNCTIONS


topPannel : Element msg
topPannel =
    row
        [ Element.height
            (fill
                |> Element.maximum 200
                |> Element.minimum 150
            )
        , Element.width fill
        , Background.color <| rgb255 146 131 116
        , Font.color <| rgb255 230 230 230
        ]
        [ customText "Game Jam!" 60 ]


decorativeRow : Element msg
decorativeRow =
    row
        [ Element.height
            (fill
                |> Element.maximum 60
                |> Element.minimum 40
            )
        , Element.width fill
        , Background.color <| rgb255 168 153 132
        ]
        []


technologyPanel : Element msg
technologyPanel =
    column
        [ Element.height <| fillPortion 5
        , Element.width fill
        , Background.color <| rgb255 189 174 147
        , Font.color <| rgb255 230 230 230
        , padding 20
        ]
        [ customText "Technology:" 20
        , technologyImages
        ]


effectsPanel : Element msg
effectsPanel =
    column
        [ Element.height <| fillPortion 5
        , Element.width fill
        , Background.color <| rgb255 189 174 147
        , Font.color <| rgb255 230 230 230
        , padding 20
        ]
        [ customText "Effects and shite:" 20
        , effectsImages
        ]


sourceControlPanel : Element msg
sourceControlPanel =
    column
        [ Element.height <| fillPortion 5
        , Element.width fill
        , Background.color <| rgb255 189 174 147
        , Font.color <| rgb255 230 230 230
        , padding 20
        ]
        [ customText "Source Control:" 20
        , sourceControlImages
        ]


customText : String -> Int -> Element msg
customText myText mySize =
    el
        [ centerX
        , Font.family
            [ Font.typeface "JetBrains Mono"
            ]
        , Font.size mySize
        ]
        (Element.text myText)


technologyImages : Element msg
technologyImages =
    column
        [ Element.height (px 300)
        , Element.width (px 300)
        , centerX
        ]
        [ cSharpImage
        , unityImage
        ]


effectsImages : Element msg
effectsImages =
    column
        [ Element.height (px 300)
        , Element.width (px 300)
        , centerX
        ]
        [ blenderLogo
        , pixilLogo
        , boscaLogo
        ]


sourceControlImages : Element msg
sourceControlImages =
    column
        [ Element.height (px 300)
        , Element.width (px 300)
        , centerX
        ]
        [ githubLogo, customText "Github link: " 20 ]


cSharpImage : Element msg
cSharpImage =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 20
        , spacing 20
        ]
        { src = "../images/c-sharp-logo1.png"
        , description = "C sharp logo"
        }


unityImage : Element msg
unityImage =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 30
        , spacing 30
        ]
        { src = "../images/unitylogo.png"
        , description = "Unity logo"
        }


blenderLogo : Element msg
blenderLogo =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 30
        , spacing 30
        ]
        { src = "../images/blenderlogo1.png"
        , description = "Blender logo"
        }


githubLogo : Element msg
githubLogo =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 30
        , spacing 30
        ]
        { src = "../images/githublogo1.png"
        , description = "Blender logo"
        }


boscaLogo : Element msg
boscaLogo =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 30
        , spacing 30
        ]
        { src = "../images/boscceoil1.png"
        , description = "Bosca Ceoil Logo"
        }


pixilLogo : Element msg
pixilLogo =
    Element.image
        [ centerX
        , Element.mouseOver [ Background.color <| rgb255 168 153 132 ]
        , padding 30
        , spacing 30
        ]
        { src = "../images/pixilartlogo1.png"
        , description = "Pixil logo"
        }
