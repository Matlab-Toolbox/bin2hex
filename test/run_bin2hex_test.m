
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
  test(end+1).input =        '0';   test(end).expect =  '0' ;
  test(end+1).input =        '1';   test(end).expect =  '1' ;
  test(end+1).input =       '10';   test(end).expect =  '2' ;
  test(end+1).input =       '11';   test(end).expect =  '3' ;
  test(end+1).input =      '100';   test(end).expect =  '4' ;
  test(end+1).input =      '101';   test(end).expect =  '5' ;
  test(end+1).input =      '110';   test(end).expect =  '6' ;
  test(end+1).input =      '111';   test(end).expect =  '7' ;
  test(end+1).input =     '1000';   test(end).expect =  '8' ;
  test(end+1).input =     '1001';   test(end).expect =  '9' ;
  test(end+1).input =     '1010';   test(end).expect =  'A' ;
  test(end+1).input =     '1011';   test(end).expect =  'B' ;
  test(end+1).input =     '1100';   test(end).expect =  'C' ;
  test(end+1).input =     '1101';   test(end).expect =  'D' ;
  test(end+1).input =     '1110';   test(end).expect =  'E' ;
  test(end+1).input =     '1111';   test(end).expect =  'F' ;
  test(end+1).input = '11101110';   test(end).expect = 'EE' ;
  test(end+1).input = '11111110';   test(end).expect = 'FE' ;
 
  %% Vector input
  test(end+1).input =        [0];   test(end).expect =  '0' ;
  test(end+1).input =        [1];   test(end).expect =  '1' ;
  test(end+1).input =      [1 0];   test(end).expect =  '2' ;
  test(end+1).input =      [1 1];   test(end).expect =  '3' ;
  test(end+1).input =    [1 0 0];   test(end).expect =  '4' ;
  test(end+1).input =    [1 0 1];   test(end).expect =  '5' ;
  test(end+1).input =    [1 1 0];   test(end).expect =  '6' ;
  test(end+1).input =    [1 1 1];   test(end).expect =  '7' ;
  test(end+1).input =  [1 0 0 0];   test(end).expect =  '8' ;
  test(end+1).input =  [1 0 0 1];   test(end).expect =  '9' ;
  test(end+1).input =  [1 0 1 0];   test(end).expect =  'A' ;
  test(end+1).input =  [1 0 1 1];   test(end).expect =  'B' ;
  test(end+1).input =  [1 1 0 0];   test(end).expect =  'C' ;
  test(end+1).input =  [1 1 0 1];   test(end).expect =  'D' ;
  test(end+1).input =  [1 1 1 0];   test(end).expect =  'E' ;
  test(end+1).input =  [1 1 1 1];   test(end).expect =  'F' ;
  test(end+1).input = [1 1 1 0 1 1 1 0];   test(end).expect = 'EE' ;
  test(end+1).input = [1 1 1 1 1 1 1 0];   test(end).expect = 'FE' ;
  
  %% Integer input
  test(end+1).input =         0 ;   test(end).expect =  '0' ;
  test(end+1).input =      1111 ;   test(end).expect =  'F' ;
  test(end+1).input =  11101110 ;   test(end).expect = 'EE' ;
  test(end+1).input =  11111110 ;   test(end).expect = 'FE' ;
 
  %% The tests
  error_count = 0;
  pass_count  = 0;
  

  
  for vector=1:size(test,2)
     b       = bin2hex(test(vector).input);
     if (  ~isequal(b, test(vector).expect)  )
       disp('bin2hex() Failed ')
       error_count = error_count + 1;
     else
       pass_count  = pass_count  + 1;
     end
  end
  
   
 %% Testing right allignmnet String and Vector input
  test ={};
  test(end+1).input =      '1000';   test(end).expect =   '8' ;
  test(end+1).input =     '01000';   test(end).expect =  '08' ;
  
  test(end+1).input =  [ 1 0 0 0];   test(end).expect =   '8' ;
  test(end+1).input = [0 1 0 0 0];   test(end).expect =  '08' ;
  
    for vector=1:size(test,2)
     b       = bin2hex(test(vector).input, 'align', 'right');
     if (  ~isequal(b, test(vector).expect)  )
       disp('bin2hex() Failed ')
       error_count = error_count + 1;
     else
       pass_count  = pass_count  + 1;
     end
    end
  
  %% Testing right allignmnet and width specification String, Vector & Integer input
  test ={};
  test(end+1).input =      '1000';   test(end).expect = '0008' ; test(end).width = 4 ;
  test(end+1).input =     '01000';   test(end).expect =  '008' ; test(end).width = 3 ;
  
  test(end+1).input =  [ 1 0 0 0];   test(end).expect = '0008' ; test(end).width = 4 ;
  test(end+1).input = [0 1 0 0 0];   test(end).expect =  '008' ; test(end).width = 3 ;
  
  test(end+1).input =        1001;   test(end).expect = '0009' ; test(end).width = 4 ;
  test(end+1).input =       01001;   test(end).expect =  '009' ; test(end).width = 3 ;
  
    for vector=1:size(test,2)
     b       = bin2hex(test(vector).input, 'align', 'right', 'width', test(vector).width );
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

