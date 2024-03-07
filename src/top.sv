//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source top.tlv 41

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
//_\source top.tlv 202

// +++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE+++++++
// +++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE+++++++

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   
   logic [31:0] r;  // a random value
   always @(posedge clk) r <= 0;
   assign ui_in = r[7:0];
   
   logic ena = 1'b0;
   logic rst_n = ! reset;

   /*
   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 8'h0;
      #10 // Step 5 cycles, past reset.
         ui_in = 8'hFF;
      // ...etc.
   end
   */

   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 60;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /*   // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    */
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// (Installed here: /usr/local/mono/sandpiper/distro.)
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar digit, input_label, leds, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|time$btn.
logic [3:0] FpgaPins_Fpga_TIME_btn_a0;

// For /fpga_pins/fpga|time$clk_disp.
logic FpgaPins_Fpga_TIME_clk_disp_a0,
      FpgaPins_Fpga_TIME_clk_disp_a1,
      FpgaPins_Fpga_TIME_clk_disp_a2,
      FpgaPins_Fpga_TIME_clk_disp_a3,
      FpgaPins_Fpga_TIME_clk_disp_a4,
      FpgaPins_Fpga_TIME_clk_disp_a5,
      FpgaPins_Fpga_TIME_clk_disp_a6,
      FpgaPins_Fpga_TIME_clk_disp_a7,
      FpgaPins_Fpga_TIME_clk_disp_a8,
      FpgaPins_Fpga_TIME_clk_disp_a9,
      FpgaPins_Fpga_TIME_clk_disp_a10,
      FpgaPins_Fpga_TIME_clk_disp_a11,
      FpgaPins_Fpga_TIME_clk_disp_a12,
      FpgaPins_Fpga_TIME_clk_disp_a13,
      FpgaPins_Fpga_TIME_clk_disp_a14,
      FpgaPins_Fpga_TIME_clk_disp_a15,
      FpgaPins_Fpga_TIME_clk_disp_a16,
      FpgaPins_Fpga_TIME_clk_disp_a17,
      FpgaPins_Fpga_TIME_clk_disp_a18,
      FpgaPins_Fpga_TIME_clk_disp_a19,
      FpgaPins_Fpga_TIME_clk_disp_a20;

// For /fpga_pins/fpga|time$cnt.
logic [20:0] FpgaPins_Fpga_TIME_cnt_a0,
             FpgaPins_Fpga_TIME_cnt_a1;

// For /fpga_pins/fpga|time$digit.
logic [3:0] FpgaPins_Fpga_TIME_digit_a0;

// For /fpga_pins/fpga|time$hide.
logic FpgaPins_Fpga_TIME_hide_a0,
      FpgaPins_Fpga_TIME_hide_a1;

// For /fpga_pins/fpga|time$ones.
logic [3:0] FpgaPins_Fpga_TIME_ones_a0,
            FpgaPins_Fpga_TIME_ones_a1;

// For /fpga_pins/fpga|time$p1_ans.
logic [7:0] FpgaPins_Fpga_TIME_p1_ans_a0,
            FpgaPins_Fpga_TIME_p1_ans_a1;

// For /fpga_pins/fpga|time$p1_score.
logic [7:0] FpgaPins_Fpga_TIME_p1_score_a0,
            FpgaPins_Fpga_TIME_p1_score_a1;

// For /fpga_pins/fpga|time$p1_sub.
logic FpgaPins_Fpga_TIME_p1_sub_a0,
      FpgaPins_Fpga_TIME_p1_sub_a1;

// For /fpga_pins/fpga|time$p2_ans.
logic [7:0] FpgaPins_Fpga_TIME_p2_ans_a0,
            FpgaPins_Fpga_TIME_p2_ans_a1;

// For /fpga_pins/fpga|time$p2_score.
logic [7:0] FpgaPins_Fpga_TIME_p2_score_a0,
            FpgaPins_Fpga_TIME_p2_score_a1;

// For /fpga_pins/fpga|time$p2_sub.
logic FpgaPins_Fpga_TIME_p2_sub_a0,
      FpgaPins_Fpga_TIME_p2_sub_a1;

// For /fpga_pins/fpga|time$rand_cnt.
logic [2:0] FpgaPins_Fpga_TIME_rand_cnt_a0,
            FpgaPins_Fpga_TIME_rand_cnt_a1;

// For /fpga_pins/fpga|time$rand_goal.
logic [7:0] FpgaPins_Fpga_TIME_rand_goal_a0;

// For /fpga_pins/fpga|time$reset.
logic FpgaPins_Fpga_TIME_reset_a0;

// For /fpga_pins/fpga|time$sec_cnt.
logic [3:0] FpgaPins_Fpga_TIME_sec_cnt_a0,
            FpgaPins_Fpga_TIME_sec_cnt_a1;

// For /fpga_pins/fpga|time$start.
logic FpgaPins_Fpga_TIME_start_a0,
      FpgaPins_Fpga_TIME_start_a1;

// For /fpga_pins/fpga|time$tens.
logic [3:0] FpgaPins_Fpga_TIME_tens_a0,
            FpgaPins_Fpga_TIME_tens_a1;

// For /fpga_pins/fpga|time$time_clk.
logic FpgaPins_Fpga_TIME_time_clk_a0,
      FpgaPins_Fpga_TIME_time_clk_a1;

// For /fpga_pins/fpga|time$winner.
logic [1:0] FpgaPins_Fpga_TIME_winner_a0,
            FpgaPins_Fpga_TIME_winner_a1;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |time
         //

            // Staging of $clk_disp.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a1 <= FpgaPins_Fpga_TIME_clk_disp_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a2 <= FpgaPins_Fpga_TIME_clk_disp_a1;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a3 <= FpgaPins_Fpga_TIME_clk_disp_a2;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a4 <= FpgaPins_Fpga_TIME_clk_disp_a3;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a5 <= FpgaPins_Fpga_TIME_clk_disp_a4;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a6 <= FpgaPins_Fpga_TIME_clk_disp_a5;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a7 <= FpgaPins_Fpga_TIME_clk_disp_a6;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a8 <= FpgaPins_Fpga_TIME_clk_disp_a7;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a9 <= FpgaPins_Fpga_TIME_clk_disp_a8;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a10 <= FpgaPins_Fpga_TIME_clk_disp_a9;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a11 <= FpgaPins_Fpga_TIME_clk_disp_a10;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a12 <= FpgaPins_Fpga_TIME_clk_disp_a11;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a13 <= FpgaPins_Fpga_TIME_clk_disp_a12;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a14 <= FpgaPins_Fpga_TIME_clk_disp_a13;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a15 <= FpgaPins_Fpga_TIME_clk_disp_a14;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a16 <= FpgaPins_Fpga_TIME_clk_disp_a15;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a17 <= FpgaPins_Fpga_TIME_clk_disp_a16;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a18 <= FpgaPins_Fpga_TIME_clk_disp_a17;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a19 <= FpgaPins_Fpga_TIME_clk_disp_a18;
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_clk_disp_a20 <= FpgaPins_Fpga_TIME_clk_disp_a19;

            // Staging of $cnt.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_cnt_a1[20:0] <= FpgaPins_Fpga_TIME_cnt_a0[20:0];

            // Staging of $hide.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_hide_a1 <= FpgaPins_Fpga_TIME_hide_a0;

            // Staging of $ones.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_ones_a1[3:0] <= FpgaPins_Fpga_TIME_ones_a0[3:0];

            // Staging of $p1_ans.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p1_ans_a1[7:0] <= FpgaPins_Fpga_TIME_p1_ans_a0[7:0];

            // Staging of $p1_score.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p1_score_a1[7:0] <= FpgaPins_Fpga_TIME_p1_score_a0[7:0];

            // Staging of $p1_sub.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p1_sub_a1 <= FpgaPins_Fpga_TIME_p1_sub_a0;

            // Staging of $p2_ans.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p2_ans_a1[7:0] <= FpgaPins_Fpga_TIME_p2_ans_a0[7:0];

            // Staging of $p2_score.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p2_score_a1[7:0] <= FpgaPins_Fpga_TIME_p2_score_a0[7:0];

            // Staging of $p2_sub.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_p2_sub_a1 <= FpgaPins_Fpga_TIME_p2_sub_a0;

            // Staging of $rand_cnt.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_rand_cnt_a1[2:0] <= FpgaPins_Fpga_TIME_rand_cnt_a0[2:0];

            // Staging of $sec_cnt.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_sec_cnt_a1[3:0] <= FpgaPins_Fpga_TIME_sec_cnt_a0[3:0];

            // Staging of $start.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_start_a1 <= FpgaPins_Fpga_TIME_start_a0;

            // Staging of $tens.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_tens_a1[3:0] <= FpgaPins_Fpga_TIME_tens_a0[3:0];

            // Staging of $time_clk.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_time_clk_a1 <= FpgaPins_Fpga_TIME_time_clk_a0;

            // Staging of $winner.
            always_ff @(posedge clk) FpgaPins_Fpga_TIME_winner_a1[1:0] <= FpgaPins_Fpga_TIME_winner_a0[1:0];








//
// Debug Signals
//

   if (1) begin : DEBUG_SIGS_GTKWAVE

      (* keep *) logic [7:0] \@0$slideswitch ;
      assign \@0$slideswitch = L0_slideswitch_a0;
      (* keep *) logic  \@0$sseg_decimal_point_n ;
      assign \@0$sseg_decimal_point_n = L0_sseg_decimal_point_n_a0;
      (* keep *) logic [7:0] \@0$sseg_digit_n ;
      assign \@0$sseg_digit_n = L0_sseg_digit_n_a0;
      (* keep *) logic [6:0] \@0$sseg_segment_n ;
      assign \@0$sseg_segment_n = L0_sseg_segment_n_a0;

      //
      // Scope: /digit[0:0]
      //
      for (digit = 0; digit <= 0; digit++) begin : \/digit 

         //
         // Scope: /leds[7:0]
         //
         for (leds = 0; leds <= 7; leds++) begin : \/leds 
            (* keep *) logic  \//@0$viz_lit ;
            assign \//@0$viz_lit = L1_Digit[digit].L2_Leds[leds].L2_viz_lit_a0;
         end
      end

      //
      // Scope: /fpga_pins
      //
      if (1) begin : \/fpga_pins 

         //
         // Scope: /fpga
         //
         if (1) begin : \/fpga 

            //
            // Scope: |time
            //
            if (1) begin : P_time
               (* keep *) logic [3:0] \///@0$btn ;
               assign \///@0$btn = FpgaPins_Fpga_TIME_btn_a0;
               (* keep *) logic  \///@0$clk_disp ;
               assign \///@0$clk_disp = FpgaPins_Fpga_TIME_clk_disp_a0;
               (* keep *) logic [20:0] \///@0$cnt ;
               assign \///@0$cnt = FpgaPins_Fpga_TIME_cnt_a0;
               (* keep *) logic [3:0] \///@0$digit ;
               assign \///@0$digit = FpgaPins_Fpga_TIME_digit_a0;
               (* keep *) logic  \///@0$hide ;
               assign \///@0$hide = FpgaPins_Fpga_TIME_hide_a0;
               (* keep *) logic [3:0] \///@0$ones ;
               assign \///@0$ones = FpgaPins_Fpga_TIME_ones_a0;
               (* keep *) logic [7:0] \///@0$p1_ans ;
               assign \///@0$p1_ans = FpgaPins_Fpga_TIME_p1_ans_a0;
               (* keep *) logic [7:0] \///@0$p1_score ;
               assign \///@0$p1_score = FpgaPins_Fpga_TIME_p1_score_a0;
               (* keep *) logic  \///@0$p1_sub ;
               assign \///@0$p1_sub = FpgaPins_Fpga_TIME_p1_sub_a0;
               (* keep *) logic [7:0] \///@0$p2_ans ;
               assign \///@0$p2_ans = FpgaPins_Fpga_TIME_p2_ans_a0;
               (* keep *) logic [7:0] \///@0$p2_score ;
               assign \///@0$p2_score = FpgaPins_Fpga_TIME_p2_score_a0;
               (* keep *) logic  \///@0$p2_sub ;
               assign \///@0$p2_sub = FpgaPins_Fpga_TIME_p2_sub_a0;
               (* keep *) logic [2:0] \///@0$rand_cnt ;
               assign \///@0$rand_cnt = FpgaPins_Fpga_TIME_rand_cnt_a0;
               (* keep *) logic [7:0] \///@0$rand_goal ;
               assign \///@0$rand_goal = FpgaPins_Fpga_TIME_rand_goal_a0;
               (* keep *) logic  \///@0$reset ;
               assign \///@0$reset = FpgaPins_Fpga_TIME_reset_a0;
               (* keep *) logic [3:0] \///@0$sec_cnt ;
               assign \///@0$sec_cnt = FpgaPins_Fpga_TIME_sec_cnt_a0;
               (* keep *) logic  \///@0$start ;
               assign \///@0$start = FpgaPins_Fpga_TIME_start_a0;
               (* keep *) logic [3:0] \///@0$tens ;
               assign \///@0$tens = FpgaPins_Fpga_TIME_tens_a0;
               (* keep *) logic  \///@0$time_clk ;
               assign \///@0$time_clk = FpgaPins_Fpga_TIME_time_clk_a0;
               (* keep *) logic [1:0] \///@0$winner ;
               assign \///@0$winner = FpgaPins_Fpga_TIME_winner_a0;
            end
         end
      end

      //
      // Scope: /switch[7:0]
      //
      for (switch = 0; switch <= 7; switch++) begin : \/switch 
         (* keep *) logic  \/@0$viz_switch ;
         assign \/@0$viz_switch = L1_Switch[switch].L1_viz_switch_a0;
      end


   end

// ---------- Generated Code Ends ----------
//_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 76   // Instantiated from top.tlv, 274 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source

   // Instantiate the Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 307   // Instantiated from top.tlv, 277 as: m5+board(/top, /fpga, 7, $, , my_design)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 355   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 309 as: m4+thanks(m5__l(309)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source top.tlv 49   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 340 as: m4+my_design.
               //_|time
                  //_@0
                     assign FpgaPins_Fpga_TIME_reset_a0 = reset;
                     assign FpgaPins_Fpga_TIME_btn_a0[3:0] = ui_in[3:0];
            
                     // divides clock for better switching on dual seven-segment
                     assign FpgaPins_Fpga_TIME_clk_disp_a0 = FpgaPins_Fpga_TIME_clk_disp_a20 ? 1'b0 : FpgaPins_Fpga_TIME_clk_disp_a20 + 1'b1;
            
                     assign FpgaPins_Fpga_TIME_cnt_a0[20:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 0 :
                        FpgaPins_Fpga_TIME_time_clk_a1 ? 0 :
                        (1 + FpgaPins_Fpga_TIME_cnt_a1);
                     //time_clk counts the num of cycles equal to 0.1s
                     assign FpgaPins_Fpga_TIME_time_clk_a0 = FpgaPins_Fpga_TIME_cnt_a0 == 21'b111101000010010000000;
            
                     // 100 in binary 1100100
                     assign FpgaPins_Fpga_TIME_sec_cnt_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 0 :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) ? 4'd0 :
                        FpgaPins_Fpga_TIME_time_clk_a1 ? (1 + FpgaPins_Fpga_TIME_sec_cnt_a1):
                        FpgaPins_Fpga_TIME_sec_cnt_a1;
            
                     // begins the countdown display
                     assign FpgaPins_Fpga_TIME_start_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        FpgaPins_Fpga_TIME_start_a1 ? 1 :
                        FpgaPins_Fpga_TIME_btn_a0 == 4'd1 ? 1 :
                        0;
                     //game is paused when user clicks button 2
                     assign FpgaPins_Fpga_TIME_p1_sub_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd4) ? 1 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? 1 :
                        0;
                     //game is paused when user clicks button 3 (2 player)
                     assign FpgaPins_Fpga_TIME_p2_sub_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd8) ? 1 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? 1 :
                        0;
                     //random counter to select goal time
                     assign FpgaPins_Fpga_TIME_rand_cnt_a0[2:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 3'd0 :
                        FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_cnt_a1 :
                        !FpgaPins_Fpga_TIME_start_a0 && (FpgaPins_Fpga_TIME_start_a1 == 0) ? FpgaPins_Fpga_TIME_rand_cnt_a1 :
                        (FpgaPins_Fpga_TIME_rand_cnt_a1 == 3'd4) ? 3'd0 :
                        (3'd1 + FpgaPins_Fpga_TIME_rand_cnt_a1);
            
                     //random goal value, 5.0-9.0 by 1.0 each step
                     assign FpgaPins_Fpga_TIME_rand_goal_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? {4'd5,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd0) ? {4'd6,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd1) ? {4'd8,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd2) ? {4'd9,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd3) ? {4'd5,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd4) ? {4'd7,4'd0} :
                        {4'd9,4'd0};
            
                     //left disp?
                     assign FpgaPins_Fpga_TIME_ones_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd0) && !FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_goal_a0[3:0] :
                        (FpgaPins_Fpga_TIME_start_a1 == 1'b0) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) ? 4'd9 :
                        FpgaPins_Fpga_TIME_time_clk_a1 && (FpgaPins_Fpga_TIME_ones_a1 != 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? (FpgaPins_Fpga_TIME_ones_a1 + 4'd1) :
                        FpgaPins_Fpga_TIME_time_clk_a1 && (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        FpgaPins_Fpga_TIME_ones_a1;
                     //right disp?
                     assign FpgaPins_Fpga_TIME_tens_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd0) && !FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_goal_a0[7:4] :
                        (FpgaPins_Fpga_TIME_start_a1 == 1'b0) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) ? 4'd9 :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) && (FpgaPins_Fpga_TIME_tens_a1 != 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? (FpgaPins_Fpga_TIME_tens_a1 + 4'd1) :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        FpgaPins_Fpga_TIME_tens_a1;
                     //after X time disp hides so player can asnwer
                     assign FpgaPins_Fpga_TIME_hide_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) || (FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0) ? 0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd0) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd3) ? 1 :
                        FpgaPins_Fpga_TIME_hide_a1 ? 1 :
                        0;
                     //These variables store the answers for p1 and p2
                     assign FpgaPins_Fpga_TIME_p1_ans_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? FpgaPins_Fpga_TIME_p1_ans_a1 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd4) ? {FpgaPins_Fpga_TIME_tens_a0[3:0],FpgaPins_Fpga_TIME_ones_a0[3:0]} :
                        8'd0;
                     assign FpgaPins_Fpga_TIME_p2_ans_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? FpgaPins_Fpga_TIME_p2_ans_a1 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd8) ? {FpgaPins_Fpga_TIME_tens_a0[3:0],FpgaPins_Fpga_TIME_ones_a0[3:0]} :
                        8'd0;
                     //determines a players score, calculates how far off a player was
                     assign FpgaPins_Fpga_TIME_p1_score_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? FpgaPins_Fpga_TIME_p1_score_a1 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && (FpgaPins_Fpga_TIME_p1_ans_a0[7:4]>=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_p1_ans_a0[7:4]-FpgaPins_Fpga_TIME_rand_goal_a0[7:4],FpgaPins_Fpga_TIME_p1_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && (FpgaPins_Fpga_TIME_p1_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p1_ans_a0[7:4]-4'd1,4'd10-FpgaPins_Fpga_TIME_p1_ans_a0[3:0]} :
                        8'd0;
                     assign FpgaPins_Fpga_TIME_p2_score_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? FpgaPins_Fpga_TIME_p2_score_a1 :
                        FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_p2_ans_a0[7:4]>=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_p2_ans_a0[7:4]-FpgaPins_Fpga_TIME_rand_goal_a0[7:4],FpgaPins_Fpga_TIME_p2_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_p2_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p2_ans_a0[7:4]-4'd1,4'd10-FpgaPins_Fpga_TIME_p2_ans_a0[3:0]} :
                        8'd0;
                     //determines the winner of the game, 0 is a tie, 1 is player 1, 2 is player 2
                     assign FpgaPins_Fpga_TIME_winner_a0[1:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 2'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 && FpgaPins_Fpga_TIME_p2_sub_a1 ? FpgaPins_Fpga_TIME_winner_a1 :
                        FpgaPins_Fpga_TIME_p1_score_a0[7:4]>FpgaPins_Fpga_TIME_p2_score_a0[7:4] ? 2'd2 :
                        FpgaPins_Fpga_TIME_p1_score_a0[7:4]<FpgaPins_Fpga_TIME_p2_score_a0[7:4] ? 2'd1 :
                        FpgaPins_Fpga_TIME_p1_score_a0[3:0]>FpgaPins_Fpga_TIME_p2_score_a0[3:0] ? 2'd2 :
                        FpgaPins_Fpga_TIME_p1_score_a0[3:0]<FpgaPins_Fpga_TIME_p2_score_a0[3:0] ? 2'd1 :
                        FpgaPins_Fpga_TIME_p1_score_a0[7:0]>FpgaPins_Fpga_TIME_p2_score_a0[7:0] ? 2'd0 :
                        2'd3;
            
                     assign FpgaPins_Fpga_TIME_digit_a0[3:0] =
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd5) ? FpgaPins_Fpga_TIME_p1_ans_a0[7:4] :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd5) ? FpgaPins_Fpga_TIME_p1_ans_a0[3:0] :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd9) ? FpgaPins_Fpga_TIME_p2_ans_a0[7:4] :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd9) ? FpgaPins_Fpga_TIME_p2_ans_a0[3:0] :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd0) ? 4'd0 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd1) ? 4'd1 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd2) ? 4'd2 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd3) ? 4'd3 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 ? 4'd11 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 ? FpgaPins_Fpga_TIME_tens_a0 :
                        FpgaPins_Fpga_TIME_ones_a0;
            
                     //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // decodes either tens or ones place to the seven-segments
                     assign uo_out[7:0] = {FpgaPins_Fpga_TIME_clk_disp_a0,
                        (FpgaPins_Fpga_TIME_hide_a0) ? 7'b1000000 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd0) ? 7'b0111111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd1) ? 7'b0000110 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd2) ? 7'b1011011 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd3) ? 7'b1001111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd4) ? 7'b1100110 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd5) ? 7'b1101101 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd6) ? 7'b1111101 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd7) ? 7'b0000111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd8) ? 7'b1111111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd9) ? 7'b1101111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd10) ? 7'b1110011 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd11) ? 7'b1001001 :
                                         7'b0000000};
            
            
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               
               
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 395   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv 454   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv, 349 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv 82   // Instantiated from top.tlv, 279 as: m5+tt_input_labels_viz(⌈"UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED"⌉)
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         
      end
   //_\end_source

//_\SV
endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
