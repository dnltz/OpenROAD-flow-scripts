
set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set SEALRING_OFFSET 70

proc calc_horizontal_pad_location {index total} {
    global IO_LENGTH
    global IO_WIDTH
    global BONDPAD_SIZE
    global SEALRING_OFFSET

    set DIE_WIDTH [expr {[lindex $::env(DIE_AREA) 2] - [lindex $::env(DIE_AREA) 0]}]
    set PAD_OFFSET [expr {$IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET}]
    set PAD_AREA_WIDTH [expr {$DIE_WIDTH - ($PAD_OFFSET * 2)}]
    set HORIZONTAL_PAD_DISTANCE [expr {($PAD_AREA_WIDTH / $total) - $IO_WIDTH}]

    return [expr {$PAD_OFFSET + (($IO_WIDTH + $HORIZONTAL_PAD_DISTANCE) * $index) + ($HORIZONTAL_PAD_DISTANCE / 2)}]
}

proc calc_vertical_pad_location {index total} {
    global IO_LENGTH
    global IO_WIDTH
    global BONDPAD_SIZE
    global SEALRING_OFFSET

    set DIE_HEIGHT [expr {[lindex $::env(DIE_AREA) 3] - [lindex $::env(DIE_AREA) 1]}]
    set PAD_OFFSET [expr {$IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET}]
    set PAD_AREA_HEIGHT [expr {$DIE_HEIGHT - ($PAD_OFFSET * 2)}]
    set VERTICAL_PAD_DISTANCE [expr {($PAD_AREA_HEIGHT / $total) - $IO_WIDTH}]

    return [expr {$PAD_OFFSET + (($IO_WIDTH + $VERTICAL_PAD_DISTANCE) * $index) + ($VERTICAL_PAD_DISTANCE / 2)}]
}

make_fake_io_site -name IOLibSite -width 1 -height $IO_LENGTH
make_fake_io_site -name IOLibCSite -width $IO_LENGTH -height $IO_LENGTH

set IO_OFFSET [expr {$BONDPAD_SIZE + $SEALRING_OFFSET}]
# Create IO Rows
make_io_sites \
    -horizontal_site IOLibSite \
    -vertical_site IOLibSite \
    -corner_site IOLibCSite \
    -offset $IO_OFFSET

# Place Pads
# IO pin io_jtag_tms
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 0 8] {sg13g2_IOPad_io_jtag_tms} -master sg13g2_IOPadIn
# IO pin io_jtag_tdi
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 1 8] {sg13g2_IOPad_io_jtag_tdi} -master sg13g2_IOPadIn
# IO pin io_jtag_tdo
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 2 8] {sg13g2_IOPad_io_jtag_tdo} -master sg13g2_IOPadOut4mA
# IO pin io_jtag_tck
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 3 8] {sg13g2_IOPad_io_jtag_tck} -master sg13g2_IOPadIn
# IO pin io_reset
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 4 8] {sg13g2_IOPad_io_reset} -master sg13g2_IOPadIn
# IO pin io_clock
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 5 8] {sg13g2_IOPad_io_clock} -master sg13g2_IOPadIn
# IO pin io_pins_10
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 6 8] {sg13g2_IOPad_io_pins_10} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_11
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 7 8] {sg13g2_IOPad_io_pins_11} -master sg13g2_IOPadInOut4mA
# IO pin io_spi_cs_0
place_pad -row IO_EAST -location [calc_vertical_pad_location 0 8] {sg13g2_IOPad_io_spi_cs_0} -master sg13g2_IOPadOut4mA
# IO pin io_spi_sck
place_pad -row IO_EAST -location [calc_vertical_pad_location 1 8] {sg13g2_IOPad_io_spi_sck} -master sg13g2_IOPadOut4mA
# IO pin io_spi_dq_3
place_pad -row IO_EAST -location [calc_vertical_pad_location 2 8] {sg13g2_IOPad_io_spi_dq_3} -master sg13g2_IOPadInOut4mA
# IO pin io_spi_dq_2
place_pad -row IO_EAST -location [calc_vertical_pad_location 3 8] {sg13g2_IOPad_io_spi_dq_2} -master sg13g2_IOPadInOut4mA
# IO pin io_spi_dq_1
place_pad -row IO_EAST -location [calc_vertical_pad_location 4 8] {sg13g2_IOPad_io_spi_dq_1} -master sg13g2_IOPadInOut4mA
# IO pin io_spi_dq_0
place_pad -row IO_EAST -location [calc_vertical_pad_location 5 8] {sg13g2_IOPad_io_spi_dq_0} -master sg13g2_IOPadInOut4mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 6 8] {sg13g2_IOPadIOVdd_east_6} -master sg13g2_IOPadIOVdd
place_pad -row IO_EAST -location [calc_vertical_pad_location 7 8] {sg13g2_IOPadIOVss_east_7} -master sg13g2_IOPadIOVss
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 0 6] {sg13g2_IOPadVss_north_0} -master sg13g2_IOPadVss
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 1 6] {sg13g2_IOPadVdd_north_1} -master sg13g2_IOPadVdd
# IO pin io_pins_6
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 2 6] {sg13g2_IOPad_io_pins_6} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_7
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 3 6] {sg13g2_IOPad_io_pins_7} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_8
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 4 6] {sg13g2_IOPad_io_pins_8} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_9
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 5 6] {sg13g2_IOPad_io_pins_9} -master sg13g2_IOPadInOut4mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 0 8] {sg13g2_IOPadIOVdd_west_0} -master sg13g2_IOPadIOVdd
place_pad -row IO_WEST -location [calc_vertical_pad_location 1 8] {sg13g2_IOPadIOVss_west_1} -master sg13g2_IOPadIOVss
# IO pin io_pins_0
place_pad -row IO_WEST -location [calc_vertical_pad_location 2 8] {sg13g2_IOPad_io_pins_0} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_1
place_pad -row IO_WEST -location [calc_vertical_pad_location 3 8] {sg13g2_IOPad_io_pins_1} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_2
place_pad -row IO_WEST -location [calc_vertical_pad_location 4 8] {sg13g2_IOPad_io_pins_2} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_3
place_pad -row IO_WEST -location [calc_vertical_pad_location 5 8] {sg13g2_IOPad_io_pins_3} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_4
place_pad -row IO_WEST -location [calc_vertical_pad_location 6 8] {sg13g2_IOPad_io_pins_4} -master sg13g2_IOPadInOut4mA
# IO pin io_pins_5
place_pad -row IO_WEST -location [calc_vertical_pad_location 7 8] {sg13g2_IOPad_io_pins_5} -master sg13g2_IOPadInOut4mA
# Place Corner Cells and Filler
place_corners sg13g2_Corner

set iofill {
    sg13g2_Filler10000
    sg13g2_Filler4000
    sg13g2_Filler2000
    sg13g2_Filler1000
    sg13g2_Filler400
    sg13g2_Filler200
}

place_io_fill -row IO_NORTH {*}$iofill
place_io_fill -row IO_SOUTH {*}$iofill
place_io_fill -row IO_WEST {*}$iofill
place_io_fill -row IO_EAST {*}$iofill

connect_by_abutment

place_bondpad -bond bondpad_70x70 sg13g2_IOPad* -offset {5.0 -70.0}

remove_io_rows
