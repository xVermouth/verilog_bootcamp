`default_nettype none

module glyphs_rom(
    input  wire [3:0] c, input  wire [3:0] y, input  wire [2:0] x, output reg pixel
);
    reg [7:0] rb; 

    always @(*) begin
        case (c) 
            0:  case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            1:  case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            2:  case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            3:  case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            4:  case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            5:  case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            6:  case(y) 2,10:rb=8'hC3; 3,9:rb=8'h66; 4,8:rb=8'h3C; 5,6,7:rb=8'h18; default:rb=0; endcase // X
            7:  case(y) 2,10:rb=8'hFF; 3:rb=8'h0E; 4:rb=8'h0C; 5:rb=8'h18; 6:rb=8'h30; 7:rb=8'h60; 8:rb=8'hC0; 9:rb=8'hE0; default:rb=0; endcase // Z
            8:  case(y) 2,10:rb=8'hC3; 3,9:rb=8'h66; 4,8:rb=8'h3C; 5,6,7:rb=8'h18; default:rb=0; endcase // X
            9:  case(y) 2,10:rb=8'h7E; 3,9:rb=8'hC3; 4,5,6,7,8:rb=8'hC0; default:rb=0; endcase // C
            10: rb = 8'h00; // SPACE
            11: case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            12: case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // G
            13: case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            14: case(y) 2,10:rb=8'hC3; 3,9:rb=8'h66; 4,8:rb=8'h3C; 5,6,7:rb=8'h18; default:rb=0; endcase // X
            15: rb = 8'h00; // TRAILING SPACE
            default: rb = 8'h00; 
        endcase
        pixel = rb[7-x];
    end
endmodule
