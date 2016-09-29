module Page.NotFound exposing (..)

import Html exposing (Html, Attribute, div, h1, h2, p, text, span, a )
import Html.Attributes exposing (class, href, style)
-- import Html.App as App




(=>) = (,)

view : Html msg
view  = 
    div [class "container act-min-height"] 
        [ div [ class "row" ]
            [ div [ class "col-md-12" ]
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
                            [ class "btn btn-primary btn-lg"
                            , href "/" 
                            ]
                            [ span [ class "glyphicon glyphicon-home" ] []
                            , text "Take Me Home "
                            ]
                        , a 
                            [ class "btn btn-default btn-lg"
                            , href "mailto:support@act.com" ]
                            [ span [ class "glyphicon glyphicon-envelope" ] []
                            , text "Contact Support "
                            ]
                        ]
                    ]
                ]
            ]
        ]
