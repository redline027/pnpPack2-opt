function res = refine_f_res(x, S)        
    fGuess = x;
    sol = [S.sol1; fGuess^2*S.sol1];
    res = S.L*sol;
end