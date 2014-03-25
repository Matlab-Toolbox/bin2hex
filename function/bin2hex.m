
function [ output_string ] = bin2hex( bin_string )
%BIN2HEX Convert Binary string or array to Hex
%   binary to Hexadecimal conversion
%   Uses built-in functions :
%     * bin2dec
%     * dec2hex
%     * num2str


input_is_char          = ischar(bin_string);
%% Convert to string if input not a string
%    This can happen for conversions of integers made up of 1 and 0s
if ~input_is_char
    bin_string = num2str( bin_string );
end

output_string = dec2hex( bin2dec( bin_string )) ;

end
