
-- -*- mode:haskell -*-
Config { font = "xft:monospace:size=14"
       , bgColor = "#263238"
       , fgColor = "#eceff1"
       , position = TopSize C 100 16
       , lowerOnStart = False
       , overrideRedirect = True
       , pickBroadest =     False
       , persistent = True
       , allDesktops = True
       , alpha = 204
       , border = NoBorder
       , commands = [ Run DynNetwork  [ "-t"        , "<fc=#d500f9><dev>:</fc><fc=#d500f9>⇩</fc><rx><fc=#d500f9>⇧</fc><tx>" -- units Kb/s
                                          , "-L"       , "40"
                                          , "-H"       , "200"
                                          , "-m"       , "3"
                                          , "--low"    , "#e53935"
                                          , "--normal" , "#eceff1"
                                          , "--high"   , "#69f0ae"
                                          ] 30
                    , Run MultiCpu        [ "-t"       , "<fc=#ffe57f,#263238><icon=.icons/cpu.xbm/>R</fc><total0>.<total1>.<total2>.<total3>"
                                          , "-L"       , "40"
                                          , "-H"       , "85"
                                          , "--low"    , "#69f0ae"
                                          , "--normal" , "#eceff1"
                                          , "--high"   , "#ff8f00"
                                          ] 10

                    , Run Memory          [ "-t"       , "<fc=#80d8ff,#263238><icon=.icons/memory.xbm/></fc><usedratio>"
                                          , "-L"       , "40"
                                          , "-H"       , "90"
                                          , "--low"    , "#69f0ae"
                                          , "--normal" , "#eceff1"
                                          , "--high"   , "#ff8f00"
                                          ] 10
                    , Run Date "<icon=.icons/calendar.xbm/>%a %m/%d %H:%M" "date" 10
                    , Run Kbd            [ ("jp" , "<fc=#ffd180,#263238><icon=.icons/keyboard.xbm/>JP</fc>")
                             , ("us"         , "<fc=#ffab40,#263238><icon=.icons/keyboard.xpm/>US</fc>")
                             ]
                     , Run StdinReader
                     ,  Run CoreTemp [
                                      "-t", "<fc=#ffe57f,#263238>T</fc><core0>.<core1>.<core2>.<core3>"
                                      , "-L", "40"
                                      , "-H", "60"
                                      , "--low"    , "#69f0ae"
                                      , "--normal" , "#eceff1"
                                      , "--high"   , "#ff8f00"
                                     ] 50
                    , Run Battery      [ "--template" , "<acstatus>"
                                       , "--Low"      , "10"       
                                       , "--High"     , "80"      

                                       , "--low"    , "#69f0ae"
                                       , "--normal" , "#eceff1"
                                       , "--high"   , "#ff8f00"
                                       , "--" 
                                       , "-o"	, "<icon=.icons/battery.xbm/><left>% (<timeleft>)"
                                       , "-O"	, "<fc=#76FF03><icon=.icons/battery-charging.xbm/></fc>"
                                       , "-i"	, "<fc=#76ff03><icon=.icons/battery-charged.xbm/></fc>"
                             ] 50
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %StdinReader%%battery%%dynnetwork%%multicpu%%coretemp%%memory%<fc=#80D8FF>%date%</fc>%kbd% " }
