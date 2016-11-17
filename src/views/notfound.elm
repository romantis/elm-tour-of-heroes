module Views.NotFound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, style)




(=>) = (,)

view : Html msg
view  = 
    div [class "container th-min-height"] 
        [ div [ class "" ]
            [ div [ class "" ]
                [ div 
                    [ style
                        [ "padding" => "2rem"
                        ,"text-align" => "center"
                        ]
                    ]
                    [ h1 [] [ text "Oops!" ]
                        
                    , h2 [] [ text "404 Not Found" ]
                        
                    , p [] [ text "Sorry, an error has occured, Requested page not found!" ]
                    , div 
                        [ style
                            [ "margin" => "1rem 0"
                            ] 
                        ]
                        [ a 
                            [ class ""
                            , href "/" 
                            ]
                            [ span [ class "" ] []
                            , text "Take Me Home "
                            ]
                        , a 
                            [ class ""
                            , href "mailto:support@act.com" ]
                            [ span [ class "glyphicon glyphicon-envelope" ] []
                            , text "Contact Support "
                            ]
                        ]
                    ]
                ]
            ]
        ]
