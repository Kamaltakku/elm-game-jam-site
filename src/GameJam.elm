module GameJam exposing (main)

import Browser.Dom exposing (Element)
import Element exposing (Element, centerX, column, el, fill, fillPortion, height, layout, maximum, padding, rgb255, row, spacing, width)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Input as Input
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
        [ customText "Technology" 20 ]


effectsPanel : Element msg
effectsPanel =
    column
        [ Element.height <| fillPortion 5
        , Element.width fill
        , Background.color <| rgb255 189 174 147
        , Font.color <| rgb255 230 230 230
        , padding 20
        ]
        [ customText "Effects" 20 ]


sourceControlPanel : Element msg
sourceControlPanel =
    column
        [ Element.height <| fillPortion 5
        , Element.width fill
        , Background.color <| rgb255 189 174 147
        , Font.color <| rgb255 230 230 230
        , padding 20
        ]
        [ customText "Source Control" 20 ]


main : Html msg
main =
    layout [] <|
        column [ Element.height fill, Element.width fill ]
            [ topPannel
            , decorativeRow
            , row [ Element.height fill, Element.width fill ]
                [ technologyPanel, effectsPanel, sourceControlPanel ]
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
