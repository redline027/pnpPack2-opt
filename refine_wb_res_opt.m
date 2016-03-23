function res = refine_wb_res_opt(x, S)   
    beta = x(1:S.betaNum);
    f = x(S.betaNum + 1);
    varNum = S.betaNum + S.betaNum*(S.betaNum-1)/2;
    sol1 = zeros(varNum, 1);
    ind = S.betaNum+1;
    for i1 = 1:S.betaNum
        sol1(i1) = beta(i1)^2;
        for i2 = i1+1:S.betaNum
            sol1(ind) = beta(i1)*beta(i2);
            ind = ind+1;
        end
    end
    sol = [sol1; f^2*sol1];
    res = S.L*sol;
end