function [betas, fGuess, avgerr] = optim_beta(betas, N, fGuess, L, R)

    x = betas;
    opts = optimset('Algorithm', 'levenberg-marquardt');
    lb = [];
    ub = [];
    S = struct('fGuess',fGuess, 'L',L,'betaNum',N);
    [xpopt,resnorm,residual,exitflag,info] = lsqcurvefit(@refine_wb_res,x,S,R,lb,ub,opts);

    sol1 = generateBetaSqsFromBetas(N, xpopt);

    S = struct('L',L,'sol1',sol1);
    [poptf,resnorm,residual,exitflag,info] = lsqcurvefit(@refine_f_res,fGuess,S,R,lb,ub,opts);

    avgerr = resnorm;
    fGuess = poptf;
    betas = xpopt;

end