function [betas, fGuess, avgerr] = optim_beta(betas, N, fGuess, L, R)

    x = zeros(1,N+1);
    x(1:N) = betas;
    x(N+1) = fGuess;
    opts = optimset('Algorithm', 'levenberg-marquardt');
    lb = [];
    ub = [];
    S = struct('L',L,'betaNum',N);
    [xpopt,resnorm,residual,exitflag,info] = lsqcurvefit(@refine_wb_res_opt,x,S,R,lb,ub,opts);
%{
    sol1 = generateBetaSqsFromBetas(N, xpopt);

    S = struct('L',L,'sol1',sol1);
    [poptf,resnorm,residual,exitflag,info] = lsqcurvefit(@refine_f_res,fGuess,S,R,lb,ub,opts);

    
%}    
    fGuess = xpopt(N+1);
    betas = xpopt(1:N);
    avgerr = resnorm;

end