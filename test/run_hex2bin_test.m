
  %% run_spec
  clear;
  %% Clear import list to test correct library
  clear import; 

  %% For Functions
  %    Add function to path
  run('../load_toolbox.m')

  %% Test vectors
  test ={};
  %% String input
  test(end+1).input =  '0';   test(end).expect =        '0' ;
  test(end+1).input =  '1';   test(end).expect =        '1' ;
  test(end+1).input =  '2';   test(end).expect =       '10' ;
  test(end+1).input =  '3';   test(end).expect =       '11' ;
  test(end+1).input =  '4';   test(end).expect =      '100' ;
  test(end+1).input =  '5';   test(end).expect =      '101' ;
  test(end+1).input =  '6';   test(end).expect =      '110' ;
  test(end+1).input =  '7';   test(end).expect =      '111' ;
  test(end+1).input =  '8';   test(end).expect =     '1000' ;
  test(end+1).input =  '9';   test(end).expect =     '1001' ;
  test(end+1).input =  'A';   test(end).expect =     '1010' ;
  test(end+1).input =  'B';   test(end).expect =     '1011' ;
  test(end+1).input =  'C';   test(end).expect =     '1100' ;
  test(end+1).input =  'D';   test(end).expect =     '1101' ;
  test(end+1).input =  'E';   test(end).expect =     '1110' ;
  test(end+1).input =  'F';   test(end).expect =     '1111' ;
  test(end+1).input = 'EE';   test(end).expect = '11101110' ;
  test(end+1).input = 'FE';   test(end).expect = '11111110' ;
  
  %% Vector Input
  test(end+1).input =     ['0'];   test(end).expect =        '0' ;
  test(end+1).input =     ['1'];   test(end).expect =        '1' ;
  test(end+1).input = ['E' 'E'];   test(end).expect = '11101110' ;
  test(end+1).input = ['F' 'E'];   test(end).expect = '11111110' ;
  
  %% Integer (Representing Hexadecimal) inputs
  test(end+1).input =   0 ;   test(end).expect =        '0' ;
  test(end+1).input =   1 ;   test(end).expect =        '1' ;
  test(end+1).input =  10 ;   test(end).expect =    '10000' ;
  test(end+1).input =  11 ;   test(end).expect =    '10001' ;
  
 
  %% The tests
  error_count = 0;
  pass_count  = 0;
  
  for vector=1:size(test,2)
     b       = hex2bin(test(vector).input);
     if (  ~isequal(b, test(vector).expect)  )
       disp('bin2hex() Failed ')
       error_count = error_count + 1;
     else
       pass_count  = pass_count  + 1;
     end
   end
  
  
  %% Test Status Report
  if error_count > 0
    disp(['Test FAILED : ', num2str(pass_count), ' passes and ',num2str(error_count),' fails'])
  else
    disp(['Test Passed : ', num2str(pass_count), ' checks ran '])
  end

