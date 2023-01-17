# Richard James Howe
# TCL Script for GTKWave on tb.ghw
# modified RgC

set bits 15

gtkwave::/Edit/Set_Trace_Max_Hier 0
gtkwave::/Time/Zoom/Zoom_Best_Fit

set names {
	top.my_and_tb.y
	top.my_and_tb.a
	top.my_and_tb.b
}

gtkwave::addSignalsFromList $names

foreach v $names {
	set a [split $v .]
	set a [lindex $a end]
	gtkwave::highlightSignalsFromList $v
	gtkwave::/Edit/Alias_Highlighted_Trace $a
	gtkwave::/Edit/UnHighlight_All $a
}

