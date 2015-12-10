-- xmobar config 
Config {
    font = "-misc-fixed-*-*-*-*-10-*-*-*-*-*-*-*",
    bgColor = "#000000",
    fgColor = "#ffffff",
    position = Static { xpos = 0, ypos = 0, width = 1920, height = 16 },
    lowerOnStart = True,
    commands = [
                      Run Weather "EDDM" ["-t"," <tempC>C","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 36000 
                    , Run DynNetwork ["-t","<dev>: <tx>kB/s|<rx>kB/s","--Low","1000","--High","5000","--low","darkgreen","--normal","darkorange","--high","darkred"] 10
                    , Run Cpu ["-L","10","-H","60","--normal","#a4d3ee","--high","red","-t","<total>"] 10
                    , Run Memory ["-L","30","-H","70","--normal","#a4d3ee","--high","red","-t","<usedratio>%"] 10
                    , Run ThermalZone 0 ["-t","+<temp>","-L", "50", "-l","#b380ff","--normal","#ffcc00", "-H","70","-h","#ff00cc","-S","True","-w","2","-m","10"] 30 
                    , Run BatteryP ["BAT0"] ["-t", "<acstatus>", "-L", "10", "-H", "80", "-l", "red", "-h", "green", "--", "-O", "Charging", "-o", "Battery: <left>%"] 3000
                    , Run Kbd [("us(dvorak)", "US"), ("ru", "RU"), ("is", "IS")] 
                    , Run Com "uname" ["-s","-r"] "" 36000
                    , Run Com "hostname" [] "" 36000
    		        , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader 
               ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ <fc=#ee9a00>Cpu:</fc> %cpu% | <fc=#ee9a00>Mem:</fc> %memory% | <fc=#ee9a00> %dynnetwork% </fc>| <fc=#ee9a00>%date%</fc>"
}
