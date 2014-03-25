
function [ output_string ] = hex2bin( bin_string )
%BIN2HEX Convert Binary string or array to Hex
%   Hexadecimal to binary conversion
%   Uses built-in functions :
%     * dec2bin
%     * hex2dec
%     * num2str

%% Convert to string if input not a string
%    This can happen for conversions of 0-9
%    Remove all spaces, Vector conversion puts '  ' between bits
if ~ischar(bin_string)
    bin_string = num2str(bin_string);
    bin_string = strrep(bin_string, ' ', '');
end

%% Convert to binary
output_string = dec2bin( hex2dec( bin_string )) ;

end
