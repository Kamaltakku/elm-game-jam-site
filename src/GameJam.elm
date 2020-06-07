module GameJam exposing (main)

import Browser.Dom exposing (Element)
import Element exposing (Element, centerX, column, el, fill, fillPortion, height, image, layout, maximum, padding, px, rgb255, row, spacing, width)
import Element.Background as Background
import Element.Events exposing (..)
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes exposing (height, width)
import List exposing (maximum)


topPannel : Element msg
topPannel =
    row
        [ Element.height (fill |> Element.maximum 150)
        , Element.width fill
        , Background.color <| rgb255 146 131 116
        , Font.color <| rgb255 230 230 230
        ]
        [ customText "Game Jam!" 60 ]


decorativeRow : Element msg
decorativeRow =
    row
        [ Element.height (fill |> Element.maximum 30)
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



-- MAIN


main : Html msg
main =
    layout [] <|
        column [ Element.height fill, Element.width fill ]
            [ topPannel
            , decorativeRow
            , row [ Element.height fill, Element.width fill ]
                [ technologyPanel, effectsPanel, sourceControlPanel ]
            , decorativeRow
            ]



-- FUNCTIONS


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
        [ Element.height fill
        , Element.width fill
        , padding 20
        , spacing 50
        ]
        [ cSharpImage
        , unityImage
        ]


effectsImages : Element msg
effectsImages =
    column
        [ Element.height fill
        , Element.width fill
        , padding 20
        , spacing 50
        ]
        [ blenderLogo
        , pixilLogo
        ]


sourceControlImages : Element msg
sourceControlImages =
    column
        [ Element.height fill
        , Element.width fill
        , padding 20
        , spacing 50
        ]
        [ githubLogo, customText "Github link: " 20 ]


cSharpImage : Element msg
cSharpImage =
    Element.image
        [ Element.width (px 200)
        , Element.height (px 200)
        , centerX
        ]
        { src = "../images/c-sharp-logo.png"
        , description = "C sharp logo"
        }


unityImage : Element msg
unityImage =
    Element.image []
        { src = "../images/unitylogo.png"
        , description = "Unity logo"
        }


blenderLogo : Element msg
blenderLogo =
    Element.image []
        { src = "../images/blenderlogo.png"
        , description = "Blender logo"
        }


githubLogo : Element msg
githubLogo =
    Element.image []
        { src = "../images/githublogo.png"
        , description = "Blender logo"
        }


pixilLogo : Element msg
pixilLogo =
    Element.image []
        { src = "../images/pixilartlogo.png"
        , description = "Pixil logo"
        }
