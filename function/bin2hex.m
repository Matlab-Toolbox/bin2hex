
function [ output_string ] = bin2hex( bin_string, varargin )
%BIN2HEX Convert Binary string or array to Hex
%   binary to Hexadecimal conversion
%   Uses built-in functions :
%     * bin2dec
%     * dec2hex
%     * num2str


p = inputParser;
defaultAlign = 'left';
defaultWidth = 'auto';

addParamValue(p,'align',defaultAlign);
addParamValue(p,'width',defaultWidth);
parse(p,varargin{:});

input_is_char          = ischar(bin_string);
input_is_numeric_array = isvector(bin_string) && (size(bin_string,2) > 1);

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
    
    % If width specified use that other wise auto-calculate
    if isequal(p.Results.width, 'auto')
        binary_len = size(bin_string, 2);
        hex_len    = ceil(binary_len/4) ;
        
        %% Numeric inputs do not contain leading '0's
        if ~(input_is_char || input_is_numeric_array)
            warning( ... 
            sprintf(['Leading zeros are removed from input. \n', ...
            '         Auto-length calculation may be incorrect.\n', ...
            '         Input a string or specify width ie \n', ...
            '         bin2hex( num, ''align'', ''right'', ''width'', x )'])); 
        end
    else 
        hex_len    = p.Results.width ;
    end
    
    output_string  = sprintf(['%0',num2str(hex_len),'s'], output_string);
end

end
