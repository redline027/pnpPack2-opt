function  [f1,R1,t1] = epnpfr_orig(pts, Uc)
    isFast = 1;
    pnpOpts.fMax = 1e4;
    pnpOpts.fMin = 30;
    pnpOpts.errThr = 7.5;
    pnpOpts.isFastBA = 0;
    pnpOpts.haveMex = 0;
    tarPtNum = 4; 
    
    [f1,R1,t1] = pnpfmy_orig(pts, Uc, tarPtNum, isFast, pnpOpts);
   
    
end