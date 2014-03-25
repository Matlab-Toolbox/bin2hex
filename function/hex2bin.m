
function [ output_string ] = hex2bin( bin_string )
%BIN2HEX Convert Binary string or array to Hex
%   Hexadecimal to binary conversion

output_string = dec2bin( hex2dec( bin_string )) ;

end
