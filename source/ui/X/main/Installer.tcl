#############################################################################
# Generated by PAGE version 4.3.1
# in conjunction with Tcl version 8.6
#    Oct 01, 2014 11:22:27 PM


set vTcl(actual_gui_bg) #d9d9d9
set vTcl(actual_gui_fg) #000000
set vTcl(actual_gui_menu_bg) #d9d9d9
set vTcl(actual_gui_menu_fg) #000000
set vTcl(complement_color) #d9d9d9
set vTcl(analog_color_p) #d9d9d9
set vTcl(analog_color_m) #d9d9d9
set vTcl(active_fg) #111111
#################################
#LIBRARY PROCEDURES
#


if {[info exists vTcl(sourcing)]} {

proc vTcl:project:info {} {
    set base .top36
    namespace eval ::widgets::$base {
        set set,origin 1
        set set,size 1
        set runvisible 1
    }
    set site_3_0 $base.m44
    set site_4_0 $site_3_0.men45
    set site_4_0 $site_3_0.men45
    set site_3_0 $base.m44
    set site_4_0 $site_3_0.men49
    set site_4_0 .top36.tNo36.pg0 
    set site_4_0 $site_4_0
    set site_5_0 $site_4_0.tLa36
    set site_5_0 $site_4_0.tLa42
    set site_5_0 $site_4_0.tLa52
    set site_4_1 .top36.tNo36.pg1 
    set site_4_2 .top36.tNo36.pg2 
    set site_4_0 $site_4_2
    set site_5_0 $site_4_0.tLa48
    set site_5_0 $site_4_0.tLa50
    set site_4_3 .top36.tNo36.pg3 
    namespace eval ::widgets_bindings {
        set tagslist _TopLevel
    }
    namespace eval ::vTcl::modules::main {
        set procs {
        }
        set compounds {
        }
        set projectType single
    }
}
}

#################################
# USER DEFINED PROCEDURES
#

#################################
# GENERATED GUI PROCEDURES
#

proc vTclWindow. {base} {
    if {$base == ""} {
        set base .
    }
    ###################
    # CREATING WIDGETS
    ###################
    wm focusmodel $top passive
    wm geometry $top 200x200+130+130; update
    wm maxsize $top 2956 1023
    wm minsize $top 124 1
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm withdraw $top
    wm title $top "page"
    bindtags $top "$top Page all"
    ###################
    # SETTING GEOMETRY
    ###################

    vTcl:FireEvent $base <<Ready>>
}

proc vTclWindow.top36 {base} {
    if {$base == ""} {
        set base .top36
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    set top $base
    ###################
    # CREATING WIDGETS
    ###################
    vTcl:toplevel $top -class Toplevel \
        -menu "$top.m44" -background {#d9d9d9} -highlightbackground {#d9d9d9} \
        -highlightcolor black 
    wm focusmodel $top passive
    wm geometry $top 800x600+404+62; update
    wm maxsize $top 1920 1080
    wm minsize $top 800 600
    wm overrideredirect $top 0
    wm resizable $top 1 1
    wm deiconify $top
    wm title $top "Stage7 Installer GUI"
    vTcl:DefineAlias "$top" "ToplevelRoot" vTcl:Toplevel:WidgetProc "" 1
    bindtags $top "$top Toplevel all _TopLevel"
    menu $top.m44 \
        -activebackground {#d9d9d9} -activeforeground black \
        -background {#d9d9d9} -font TkMenuFont -foreground {#000000} \
        -tearoff 0 
    $top.m44 add cascade \
        -menu "$top.m44.men45" -activebackground {#d9d9d9} \
        -activeforeground {#111111} -background {#d9d9d9} -font TkMenuFont \
        -foreground {#000000} -label File 
    set site_3_0 $top.m44
    menu $site_3_0.men45 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -font {{Segoe UI} 9} -foreground black \
        -tearoff 0 
    $site_3_0.men45 add cascade \
        -menu "$site_3_0.men45.men46" -activebackground {#d9d9d9} \
        -activeforeground {#111111} -accelerator ctrl+i -background {#d9d9d9} \
        -font TkMenuFont -foreground {#000000} -label {Import profile} 
    set site_4_0 $site_3_0.men45
    menu $site_4_0.men46 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -font {{Segoe UI} 9} -foreground black \
        -tearoff 0 
    $site_3_0.men45 add cascade \
        -menu "$site_3_0.men45.men48" -activebackground {#d9d9d9} \
        -activeforeground {#111111} -accelerator ctrl+e -background {#d9d9d9} \
        -font TkMenuFont -foreground {#000000} -label {Export profile} 
    set site_4_0 $site_3_0.men45
    menu $site_4_0.men48 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -font {{Segoe UI} 9} -foreground black \
        -tearoff 0 
    $site_3_0.men45 add command \
        -activebackground {#d9d9d9} -activeforeground {#000000} \
        -accelerator ctrl+c -background {#d9d9d9} -command exit() \
        -font TkMenuFont -foreground {#000000} -label Exit 
    $top.m44 add cascade \
        -menu "$top.m44.men49" -activebackground {#d9d9d9} \
        -activeforeground {#111111} -background {#d9d9d9} -font TkMenuFont \
        -foreground {#000000} -label Help 
    set site_3_0 $top.m44
    menu $site_3_0.men49 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -font {{Segoe UI} 9} -foreground black \
        -tearoff 0 
    $site_3_0.men49 add cascade \
        -menu "$site_3_0.men49.men50" -activebackground {#d9d9d9} \
        -activeforeground {#111111} -background {#d9d9d9} -font TkMenuFont \
        -foreground {#000000} -label About 
    set site_4_0 $site_3_0.men49
    menu $site_4_0.men50 \
        -activebackground {#f9f9f9} -activeforeground black \
        -background {#d9d9d9} -font {{Segoe UI} 9} -foreground black \
        -tearoff 0 
    ttk::style configure TNotebook -background #d9d9d9
    ttk::style configure TNotebook.Tab -background #d9d9d9
    ttk::style configure TNotebook.Tab -foreground #000000
    ttk::style configure TNotebook.Tab -font TkDefaultFont
    ttk::style map TNotebook.Tab -background [list disabled #d9d9d9 selected #d9d9d9]
    ttk::notebook $top.tNo36 \
        -width 794 -height 586 -takefocus {} 
    vTcl:DefineAlias "$top.tNo36" "TNotebook1" vTcl:WidgetProc "ToplevelRoot" 1
    frame .top36.tNo36.pg0 -background #d9d9d9
    $top.tNo36 add .top36.tNo36.pg0 \
        -padding 0 -sticky nsew -state normal -text Normal -image {} \
        -compound none -underline -1 
    set site_4_0  $top.tNo36.pg0
    ttk::progressbar $site_4_0.tPr42
    vTcl:DefineAlias "$site_4_0.tPr42" "TProgressbar1" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TButton -background #d9d9d9
    ttk::style configure TButton -foreground #000000
    ttk::style configure TButton -font TkDefaultFont
    ttk::button $site_4_0.tBu43 \
        -takefocus {} -text Build! 
    vTcl:DefineAlias "$site_4_0.tBu43" "TButton1" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_4_0.tLa47 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Time remaining:} 
    vTcl:DefineAlias "$site_4_0.tLa47" "TLabel5" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_4_0.tLa37 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Time elapsed:} 
    vTcl:DefineAlias "$site_4_0.tLa37" "TLabel6" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_4_0.tLa38 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Percentage complete:} 
    vTcl:DefineAlias "$site_4_0.tLa38" "TLabel7" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TButton -background #d9d9d9
    ttk::style configure TButton -foreground #000000
    ttk::style configure TButton -font TkDefaultFont
    ttk::button $site_4_0.tBu44 \
        -takefocus {} -text {Portage options} 
    vTcl:DefineAlias "$site_4_0.tBu44" "TButton2" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_0.tLa59 \
        -text {Network Settings} -width 230 -height 165 
    vTcl:DefineAlias "$site_4_0.tLa59" "TLabelframe3" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_0.tLa36 \
        -text {Partition Settings} -width 230 -height 115 
    vTcl:DefineAlias "$site_4_0.tLa36" "TLabelframe4" vTcl:WidgetProc "ToplevelRoot" 1
    set site_5_0 $site_4_0.tLa36
    ttk::label $site_5_0.cpd38 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Partition layout:} 
    vTcl:DefineAlias "$site_5_0.cpd38" "TLabel17" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd39 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Partition formats:} 
    vTcl:DefineAlias "$site_5_0.cpd39" "TLabel18" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd40 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Partitions to mount:} 
    vTcl:DefineAlias "$site_5_0.cpd40" "TLabel19" vTcl:WidgetProc "ToplevelRoot" 1
    place $site_5_0.cpd38 \
        -in $site_5_0 -x 10 -y 20 -anchor nw -bordermode inside 
    place $site_5_0.cpd39 \
        -in $site_5_0 -x 10 -y 40 -anchor nw -bordermode inside 
    place $site_5_0.cpd40 \
        -in $site_5_0 -x 10 -y 60 -anchor nw -bordermode inside 
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_0.tLa42 \
        -text {User Settings} -width 250 -height 135 
    vTcl:DefineAlias "$site_4_0.tLa42" "TLabelframe5" vTcl:WidgetProc "ToplevelRoot" 1
    set site_5_0 $site_4_0.tLa42
    ttk::label $site_5_0.cpd44 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Root password:} 
    vTcl:DefineAlias "$site_5_0.cpd44" "TLabel2" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd45 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Add user:} 
    vTcl:DefineAlias "$site_5_0.cpd45" "TLabel3" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd46 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {User password:} 
    vTcl:DefineAlias "$site_5_0.cpd46" "TLabel15" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::entry $site_5_0.cpd48 \
        -foreground {} -background {} -takefocus {} -cursor ibeam 
    vTcl:DefineAlias "$site_5_0.cpd48" "TEntry2" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::entry $site_5_0.cpd49 \
        -foreground {} -background {} -takefocus {} -cursor ibeam 
    vTcl:DefineAlias "$site_5_0.cpd49" "TEntry3" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::entry $site_5_0.cpd50 \
        -foreground {} -background {} -takefocus {} -cursor ibeam 
    vTcl:DefineAlias "$site_5_0.cpd50" "TEntry5" vTcl:WidgetProc "ToplevelRoot" 1
    place $site_5_0.cpd44 \
        -in $site_5_0 -x 10 -y 30 -anchor nw -bordermode inside 
    place $site_5_0.cpd45 \
        -in $site_5_0 -x 10 -y 50 -anchor nw -bordermode inside 
    place $site_5_0.cpd46 \
        -in $site_5_0 -x 10 -y 70 -anchor nw -bordermode inside 
    place $site_5_0.cpd48 \
        -in $site_5_0 -x 100 -y 30 -anchor nw -bordermode inside 
    place $site_5_0.cpd49 \
        -in $site_5_0 -x 100 -y 50 -anchor nw -bordermode inside 
    place $site_5_0.cpd50 \
        -in $site_5_0 -x 100 -y 70 -anchor nw -bordermode inside 
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_0.tLa52 \
        -text {System Settings} -width 260 -height 295 
    vTcl:DefineAlias "$site_4_0.tLa52" "TLabelframe6" vTcl:WidgetProc "ToplevelRoot" 1
    set site_5_0 $site_4_0.tLa52
    ttk::label $site_5_0.cpd53 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Stage3 tarball:} 
    vTcl:DefineAlias "$site_5_0.cpd53" "TLabel4" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::entry $site_5_0.cpd54 \
        -foreground {} -background {} -takefocus {} -cursor ibeam 
    vTcl:DefineAlias "$site_5_0.cpd54" "TEntry4" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd55 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {CPU architecture:} 
    vTcl:DefineAlias "$site_5_0.cpd55" "TLabel8" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::combobox $site_5_0.cpd56 \
        -values {x86 AMD64} -textvariable combobox -foreground {} \
        -background {} -takefocus {} 
    vTcl:DefineAlias "$site_5_0.cpd56" "TCombobox1" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd57 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Number of CPU cores:} 
    vTcl:DefineAlias "$site_5_0.cpd57" "TLabel11" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::combobox $site_5_0.cpd58 \
        -textvariable combobox -foreground {} -background {} -takefocus {} 
    vTcl:DefineAlias "$site_5_0.cpd58" "TCombobox2" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd59 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Portage snapshot} 
    vTcl:DefineAlias "$site_5_0.cpd59" "TLabel12" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd60 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text Bootloader 
    vTcl:DefineAlias "$site_5_0.cpd60" "TLabel13" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd61 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text Timezone: 
    vTcl:DefineAlias "$site_5_0.cpd61" "TLabel20" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd62 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Kernel sources:} 
    vTcl:DefineAlias "$site_5_0.cpd62" "TLabel21" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd63 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Add RC services:} 
    vTcl:DefineAlias "$site_5_0.cpd63" "TLabel22" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd64 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Delete RC services:} 
    vTcl:DefineAlias "$site_5_0.cpd64" "TLabel23" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::combobox $site_5_0.tCo65 \
        -values {{Grub 2} Lilo {Grub (legacy)}} -textvariable combobox \
        -foreground {} -background {} -takefocus {} 
    vTcl:DefineAlias "$site_5_0.tCo65" "TCombobox3" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::label $site_5_0.cpd36 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text Hostname: 
    vTcl:DefineAlias "$site_5_0.cpd36" "TLabel1" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::entry $site_5_0.cpd37 \
        -foreground {} -background {} -takefocus {} -cursor ibeam 
    vTcl:DefineAlias "$site_5_0.cpd37" "TEntry1" vTcl:WidgetProc "ToplevelRoot" 1
    place $site_5_0.cpd53 \
        -in $site_5_0 -x 10 -y 0 -anchor nw -bordermode inside 
    place $site_5_0.cpd54 \
        -in $site_5_0 -x 130 -y 0 -anchor nw -bordermode inside 
    place $site_5_0.cpd55 \
        -in $site_5_0 -x 10 -y 20 -anchor nw -bordermode inside 
    place $site_5_0.cpd56 \
        -in $site_5_0 -x 200 -y 20 -width 53 -height 21 -anchor nw \
        -bordermode inside 
    place $site_5_0.cpd57 \
        -in $site_5_0 -x 10 -y 40 -anchor nw -bordermode inside 
    place $site_5_0.cpd58 \
        -in $site_5_0 -x 200 -y 40 -width 53 -height 21 -anchor nw \
        -bordermode inside 
    place $site_5_0.cpd59 \
        -in $site_5_0 -x 10 -y 60 -anchor nw -bordermode inside 
    place $site_5_0.cpd60 \
        -in $site_5_0 -x 20 -y 100 -width 62 -height 19 -anchor nw \
        -bordermode ignore 
    place $site_5_0.cpd61 \
        -in $site_5_0 -x 10 -y 150 -anchor nw -bordermode inside 
    place $site_5_0.cpd62 \
        -in $site_5_0 -x 10 -y 170 -anchor nw -bordermode inside 
    place $site_5_0.cpd63 \
        -in $site_5_0 -x 10 -y 190 -anchor nw -bordermode inside 
    place $site_5_0.cpd64 \
        -in $site_5_0 -x 10 -y 210 -anchor nw -bordermode inside 
    place $site_5_0.tCo65 \
        -in $site_5_0 -x 90 -y 100 -width 73 -height 21 -anchor nw \
        -bordermode ignore 
    place $site_5_0.cpd36 \
        -in $site_5_0 -x 10 -y 130 -anchor nw -bordermode inside 
    place $site_5_0.cpd37 \
        -in $site_5_0 -x 80 -y 130 -anchor nw -bordermode inside 
    place $site_4_0.tPr42 \
        -in $site_4_0 -x 10 -y 450 -width 770 -height 22 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tBu43 \
        -in $site_4_0 -x 680 -y 480 -width 96 -height 35 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tLa47 \
        -in $site_4_0 -x 10 -y 500 -width 91 -height 19 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tLa37 \
        -in $site_4_0 -x 10 -y 480 -anchor nw -bordermode ignore 
    place $site_4_0.tLa38 \
        -in $site_4_0 -x 10 -y 520 -anchor nw -bordermode ignore 
    place $site_4_0.tBu44 \
        -in $site_4_0 -x 680 -y 410 -anchor nw -bordermode ignore 
    place $site_4_0.tLa59 \
        -in $site_4_0 -x 10 -y 270 -width 230 -height 165 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tLa36 \
        -in $site_4_0 -x 10 -y 150 -width 230 -height 115 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tLa42 \
        -in $site_4_0 -x 0 -y 10 -width 250 -height 135 -anchor nw \
        -bordermode ignore 
    place $site_4_0.tLa52 \
        -in $site_4_0 -x 520 -y 10 -width 260 -height 295 -anchor nw \
        -bordermode ignore 
    frame .top36.tNo36.pg1 -background #d9d9d9
    $top.tNo36 add .top36.tNo36.pg1 \
        -padding 0 -sticky nsew -state normal -text Chroot -image {} \
        -compound none -underline -1 
    set site_4_1  $top.tNo36.pg1
    frame .top36.tNo36.pg2 -background #d9d9d9
    $top.tNo36 add .top36.tNo36.pg2 \
        -padding 0 -sticky nsew -state normal -text Stage4 -image {} \
        -compound none -underline -1 
    set site_4_2  $top.tNo36.pg2
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_2.tLa48 \
        -text {Image using a Stage4 Recovery:} -width 760 -height 255 
    vTcl:DefineAlias "$site_4_2.tLa48" "TLabelframe1" vTcl:WidgetProc "ToplevelRoot" 1
    set site_5_0 $site_4_2.tLa48
    ttk::label $site_5_0.tLa49 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Select the Stage4 file:} 
    vTcl:DefineAlias "$site_5_0.tLa49" "TLabel28" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TButton -background #d9d9d9
    ttk::style configure TButton -foreground #000000
    ttk::style configure TButton -font TkDefaultFont
    ttk::button $site_5_0.tBu52 \
        -takefocus {} -text Tbutton 
    vTcl:DefineAlias "$site_5_0.tBu52" "TButton3" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::progressbar $site_5_0.tPr54
    vTcl:DefineAlias "$site_5_0.tPr54" "TProgressbar2" vTcl:WidgetProc "ToplevelRoot" 1
    place $site_5_0.tLa49 \
        -in $site_5_0 -x 10 -y 20 -width 116 -height 19 -anchor nw \
        -bordermode ignore 
    place $site_5_0.tBu52 \
        -in $site_5_0 -x 670 -y 190 -anchor nw -bordermode ignore 
    place $site_5_0.tPr54 \
        -in $site_5_0 -x 10 -y 160 -width 730 -height 22 -anchor nw \
        -bordermode ignore 
    ttk::style configure TLabelframe.Label -background #d9d9d9
    ttk::style configure TLabelframe.Label -foreground #000000
    ttk::style configure TLabelframe.Label -font TkDefaultFont
    ttk::style configure TLabelframe -background #d9d9d9
    ttk::labelframe $site_4_2.tLa50 \
        -text {Create Stage4 Recovery:} -width 760 -height 275 
    vTcl:DefineAlias "$site_4_2.tLa50" "TLabelframe2" vTcl:WidgetProc "ToplevelRoot" 1
    set site_5_0 $site_4_2.tLa50
    ttk::label $site_5_0.tLa51 \
        -background {#d9d9d9} -foreground {#000000} -relief flat \
        -text {Select the destination of your Stage4 recovery:} 
    vTcl:DefineAlias "$site_5_0.tLa51" "TLabel24" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::style configure TButton -background #d9d9d9
    ttk::style configure TButton -foreground #000000
    ttk::style configure TButton -font TkDefaultFont
    ttk::button $site_5_0.tBu53 \
        -takefocus {} -text Tbutton 
    vTcl:DefineAlias "$site_5_0.tBu53" "TButton4" vTcl:WidgetProc "ToplevelRoot" 1
    ttk::progressbar $site_5_0.tPr55
    vTcl:DefineAlias "$site_5_0.tPr55" "TProgressbar3" vTcl:WidgetProc "ToplevelRoot" 1
    place $site_5_0.tLa51 \
        -in $site_5_0 -x 10 -y 20 -anchor nw -bordermode ignore 
    place $site_5_0.tBu53 \
        -in $site_5_0 -x 670 -y 240 -anchor nw -bordermode ignore 
    place $site_5_0.tPr55 \
        -in $site_5_0 -x 10 -y 210 -width 730 -height 22 -anchor nw \
        -bordermode ignore 
    place $site_4_2.tLa48 \
        -in $site_4_2 -x 10 -y 10 -width 760 -height 255 -anchor nw \
        -bordermode ignore 
    place $site_4_2.tLa50 \
        -in $site_4_2 -x 10 -y 270 -width 760 -height 275 -anchor nw \
        -bordermode ignore 
    frame .top36.tNo36.pg3 -background #d9d9d9
    $top.tNo36 add .top36.tNo36.pg3 \
        -padding 0 -sticky nsew -state normal -text Stage7 -image {} \
        -compound none -underline -1 
    set site_4_3  $top.tNo36.pg3
    ###################
    # SETTING GEOMETRY
    ###################
    place $top.tNo36 \
        -in $top -x 0 -y 0 -width 794 -height 586 -anchor nw \
        -bordermode ignore 

    vTcl:FireEvent $base <<Ready>>
}

#############################################################################
## Binding tag:  _TopLevel

bind "_TopLevel" <<Create>> {
    if {![info exists _topcount]} {set _topcount 0}; incr _topcount
}
bind "_TopLevel" <<DeleteWindow>> {
    if {[set ::%W::_modal]} {
                vTcl:Toplevel:WidgetProc %W endmodal
            } else {
                destroy %W; if {$_topcount == 0} {exit}
            }
}
bind "_TopLevel" <Destroy> {
    if {[winfo toplevel %W] == "%W"} {incr _topcount -1}
}

Window show .
Window show .top36

