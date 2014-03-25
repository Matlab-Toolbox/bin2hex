
function [ output_string ] = bin2hex( bin_string, varargin )
%BIN2HEX Convert Binary string or array to Hex
%   binary to Hexadecimal conversion
%   Uses built-in functions :
%     * bin2dec
%     * dec2hex
%     * num2str


p = inputParser;
defaultAlign = 'left';

addParamValue(p,'align',defaultAlign);
parse(p,varargin{:});

input_is_char          = ischar(bin_string);

%% Convert to string if input not a string
%    This can happen for conversions of integers made up of 1 and 0s
%    Remove all spaces, Vector conversion puts '  ' between bits
if ~input_is_char
    bin_string = num2str( bin_string );
    bin_string = strrep(bin_string, ' ', '');    
end

output_string = dec2hex( bin2dec( bin_string )) ;

%% Right Allign
if isequal(p.Results.align, 'right')
        binary_len = size(bin_string, 2);
        hex_len    = ceil(binary_len/4) ;
    output_string  = sprintf(['%0',num2str(hex_len),'s'], output_string);
end

end
