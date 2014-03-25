
function [ output_string ] = bin2hex( bin_string )
%BIN2HEX Convert Binary string or array to Hex
%   binary to Hexadecimal conversion

output_string = dec2hex( bin2dec( bin_string )) ;

end
