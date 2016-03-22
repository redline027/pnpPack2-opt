% Generated using GBSolver generator v1.1 Copyright Martin Bujnak,
% Zuzana Kukelova, Tomas Pajdla CTU Prague 2008.
% 
% Please refer to the following paper, when using this code :
%     Kukelova Z., Bujnak M., Pajdla T., Automatic Generator of Minimal Problem Solvers,
%     ECCV 2008, Marseille, France, October 12-18, 2008

function [zb zc f zd meta M] = mbp4pf_2411_11_1245_1zbzbzdzczczdff2fzdzdzd2(glab, a1, b1, c1, d1)

	% instance=gbs_RandomInstanceZp ordering={zb,zc,f,zd} equations={1,2,4,5} basis={1,zb,zb*zd,zc,zc*zd,f,f^2,f*zd,zd,zd^2} 
	% gj = 1 subst = 1
	meta = {1,1, {'gbs_RandomInstanceZp'}, {'zb' 'zc' 'f' 'zd'}, {1,2,4,5}, {'1' 'zb' 'zb*zd' 'zc' 'zc*zd' 'f' 'f^2' 'f*zd' 'zd' 'zd^2'} };

	%monomials appearing in matrix M:
	%    zd*f^4*zc*zb^2 zd^2*f^4*zb^2 zd^2*f^4*zc*zb zd^3*f^4*zb zd^3*f^4*zc zd^4*f^4 f^4*zc*zb^2 zd*f^3*zc*zb^2 zd*f^4*zb^2 zd*f^4*zc*zb zd^2*f^3*zb^2 
	%    zd^2*f^3*zc*zb zd^2*f^4*zb zd^2*f^4*zc zd^3*f^3*zb zd^3*f^3*zc zd^3*f^4 zd^4*f^3 f^3*zc*zb^2 f^4*zb^2 f^4*zc*zb zd*f^2*zc*zb^2 
	%    zd*f^3*zb^2 zd*f^3*zc*zb zd*f^4*zb zd*f^4*zc zd^2*f^2*zb^2 zd^2*f^2*zc*zb zd^2*f^3*zb zd^2*f^3*zc zd^3*f^2*zb zd^3*f^2*zc zd^3*f^3 
	%    zd^4*f^2 f^2*zc*zb^2 f^3*zb^2 f^3*zc*zb zd*f*zc*zb^2 zd*f^2*zb^2 zd*f^2*zc*zb zd*f^3*zb zd*f^3*zc zd^2*f*zb^2 zd^2*f*zc*zb 
	%    zd^2*f^2*zb zd^2*f^2*zc zd^2*f^3 zd^3*f*zb zd^3*f*zc zd^3*f^2 zd^4*f f*zc*zb^2 f^2*zb^2 f^2*zc*zb f^3*zb 
	%    f^3*zc zd*zc*zb^2 zd*f*zb^2 zd*f*zc*zb zd*f^2*zb zd*f^2*zc zd^2*zb^2 zd^2*zc*zb zd^2*f*zb zd^2*f*zc zd^2*f^2 
	%    zd^3*zb zd^3*zc zd^3*f zc*zb^2 f*zb^2 f*zc*zb f^2*zb f^2*zc zd*zb^2 zd*zc*zb zd*f*zb 
	%    zd*f*zc zd*f^2 zd^2*zb zd^2*zc zd^2*f zb^2 zc*zb f*zb f*zc f^2 zd*zb 
	%    zd*zc zd*f zd^2 zb zc f zd 1 
	M = zeros(86, 96);
	M([80, 165, 582, 667, 752, 923, 1594, 1679, 1850, 1935, 2278, 2946, 3031, 3202, 3287, 3630, 4393, 4478, 4907, 6021]) = 1;
	M([424, 509, 1184, 1355, 1440, 1525, 2540, 2710, 2795, 2880, 3892, 3977, 4148, 4233, 4318, 5511, 5596, 5853, 6967]) = -glab(1)/glab(3);
	M([682, 939, 1614, 1871, 1956, 2299, 2970, 3055, 3226, 3311, 3654, 4408, 4493, 4836, 4921, 5264, 5941, 6026, 6369, 7053]) = b1(1)^2+b1(2)^2;
	M([854, 1111, 1786, 2043, 2128, 2471, 3142, 3398, 3483, 3826, 4580, 4665, 5008, 5093, 5436, 6113, 6198, 6541, 7225]) = -2;
	M([1198, 1455, 2216, 2559, 2815, 3572, 3914, 3999, 4256, 5182, 5524, 5609, 5866, 6629, 6714, 6971, 7655]) = 2*glab(1)/glab(3);
	M([1370, 1541, 2560, 2731, 2816, 2901, 3916, 4001, 4172, 4257, 4342, 5526, 5611, 5782, 5867, 6887, 6972, 7741]) = -1/glab(3)*d1(1)^2*glab(1)-1/glab(3)*d1(2)^2*glab(1);
	M([2058, 2487, 3162, 3419, 3504, 3847, 4604, 4689, 5032, 5117, 5460, 6128, 6213, 6470, 6555, 6812, 7145, 7230, 7487, 7827]) = -2*b1(2)*a1(2)-2*b1(1)*a1(1);
	M([2230, 3591, 4019, 4776, 5204, 5632, 6300, 6642, 6727, 6984, 7317, 7402, 7659, 7999]) = -glab(1)/glab(3)+1;
	M([2574, 2831, 3592, 3935, 4020, 4277, 5206, 5548, 5633, 5890, 6644, 6729, 6900, 6985, 7575, 7660, 7745, 8085]) = 2/glab(3)*a1(1)*d1(1)*glab(1)+2/glab(3)*a1(2)*d1(2)*glab(1);
	M([3606, 4035, 4796, 5225, 5653, 6324, 6666, 6751, 7008, 7332, 7417, 7588, 7673, 7758, 7919, 8004, 8089, 8171]) = -1/glab(3)*a1(1)^2*glab(1)+a1(2)^2-1/glab(3)*a1(2)^2*glab(1)+a1(1)^2;
	M([82, 253, 586, 671, 842, 1013, 1599, 1770, 1855, 2026, 2369, 2951, 3122, 3207, 3378, 3721, 4396, 4567, 4996, 6108]) = 1;
	M([340, 511, 1102, 1273, 1444, 1529, 2459, 2629, 2800, 2885, 3811, 3982, 4067, 4238, 4323, 5428, 5599, 5856, 6968]) = 1/2/glab(3)*glab(4)-1/2/glab(3)*glab(2)-1/2/glab(3)*glab(1);
	M([684, 1027, 1618, 1875, 2046, 2389, 2975, 3146, 3231, 3402, 3745, 4413, 4584, 4841, 5012, 5355, 5944, 6115, 6458, 7140]) = b1(1)*c1(1)+b1(2)*c1(2);
	M([770, 1113, 1704, 1961, 2132, 2475, 3061, 3317, 3488, 3831, 4499, 4670, 4927, 5098, 5441, 6030, 6201, 6544, 7226]) = -1;
	M([856, 1199, 1790, 2047, 2218, 2561, 3147, 3403, 3574, 3917, 4585, 4756, 5013, 5184, 5527, 6116, 6287, 6630, 7312]) = -1;
	M([1114, 1457, 2134, 2477, 2819, 3491, 3833, 4004, 4261, 5101, 5443, 5614, 5871, 6546, 6717, 6974, 7656]) = 1/glab(3)*glab(1)-1/glab(3)*glab(4)+1/glab(3)*glab(2);
	M([1286, 1543, 2478, 2649, 2820, 2905, 3835, 4006, 4091, 4262, 4347, 5445, 5616, 5701, 5872, 6804, 6975, 7742]) = -1/2/glab(3)*d1(2)^2*glab(2)-1/2/glab(3)*d1(1)^2*glab(1)+1/2/glab(3)*d1(2)^2*glab(4)+1/2/glab(3)*d1(1)^2*glab(4)-1/2/glab(3)*d1(1)^2*glab(2)-1/2/glab(3)*d1(2)^2*glab(1);
	M([1974, 2489, 3080, 3337, 3508, 3851, 4523, 4694, 4951, 5122, 5465, 6047, 6218, 6389, 6560, 6817, 7062, 7233, 7490, 7828]) = -b1(2)*a1(2)-b1(1)*a1(1);
	M([2060, 2575, 3166, 3423, 3594, 3937, 4609, 4780, 5037, 5208, 5551, 6133, 6304, 6475, 6646, 6903, 7148, 7319, 7576, 7914]) = -c1(2)*a1(2)-c1(1)*a1(1);
	M([2146, 3509, 4023, 4695, 5123, 5637, 6219, 6561, 6732, 6989, 7234, 7405, 7662, 8000]) = -1/2/glab(3)*glab(1)+1/2/glab(3)*glab(4)-1/2/glab(3)*glab(2)+1;
	M([2490, 2833, 3510, 3853, 4024, 4281, 5125, 5467, 5638, 5895, 6563, 6734, 6819, 6990, 7492, 7663, 7748, 8086]) = -1/glab(3)*a1(2)*d1(2)*glab(4)-1/glab(3)*a1(1)*d1(1)*glab(4)+1/glab(3)*a1(1)*d1(1)*glab(1)+1/glab(3)*a1(1)*d1(1)*glab(2)+1/glab(3)*a1(2)*d1(2)*glab(2)+1/glab(3)*a1(2)*d1(2)*glab(1);
	M([3522, 4037, 4714, 5143, 5657, 6243, 6585, 6756, 7013, 7251, 7422, 7507, 7678, 7763, 7836, 8007, 8092, 8172]) = 1/2/glab(3)*a1(1)^2*glab(4)+1/2/glab(3)*a1(2)^2*glab(4)-1/2/glab(3)*a1(1)^2*glab(2)-1/2/glab(3)*a1(2)^2*glab(2)-1/2/glab(3)*a1(2)^2*glab(1)-1/2/glab(3)*a1(1)^2*glab(1)+a1(2)^2+a1(1)^2;
	M([171, 256, 341, 764, 849, 934, 1019, 1104, 1275, 1950, 2035, 2120, 2291, 2376, 2461, 2632, 3217, 3302, 3387, 3472, 3643, 3728, 3813, 4070, 4916, 5001, 5086, 5429, 6539]) = 1;
	M([343, 428, 513, 1108, 1193, 1278, 1363, 1448, 1533, 2466, 2551, 2635, 2720, 2805, 2890, 3733, 3818, 3903, 3988, 4073, 4158, 4243, 4328, 5432, 5517, 5602, 5859, 6969]) = -1/2/glab(3)*glab(1)+1/2/glab(3)*glab(5)-1/2;
	M([773, 858, 1115, 1710, 1795, 1966, 2051, 2136, 2479, 3068, 3153, 3323, 3408, 3493, 3836, 4421, 4506, 4591, 4676, 4933, 5018, 5103, 5446, 6034, 6119, 6204, 6547, 7227]) = -1;
	M([945, 1030, 1287, 1968, 2053, 2310, 2395, 2480, 2651, 3326, 3411, 3496, 3667, 3752, 3837, 4094, 4851, 4936, 5021, 5106, 5277, 5362, 5447, 5704, 6378, 6463, 6548, 6805, 7485]) = b1(2)*d1(2)+b1(1)*d1(1);
	M([1117, 1202, 1459, 2140, 2225, 2482, 2567, 2823, 3498, 3583, 3839, 3924, 4009, 4266, 5023, 5108, 5193, 5449, 5534, 5619, 5876, 6550, 6635, 6720, 6977, 7657]) = -1/glab(3)*glab(5)+1/glab(3)*glab(1);
	M([1289, 1374, 1545, 2484, 2569, 2654, 2739, 2824, 2909, 3842, 3927, 4012, 4097, 4182, 4267, 4352, 5367, 5452, 5537, 5622, 5707, 5792, 5877, 6808, 6893, 6978, 7743]) = -1/2/glab(3)*d1(2)^2*glab(1)+1/2/glab(3)*d1(1)^2*glab(5)+1/2/glab(3)*d1(2)^2*glab(5)-1/2/glab(3)*d1(1)^2*glab(1)-1/2*d1(2)^2-1/2*d1(1)^2;
	M([1977, 2062, 2491, 3086, 3171, 3342, 3427, 3512, 3855, 4530, 4615, 4700, 4957, 5042, 5127, 5470, 5969, 6054, 6139, 6224, 6395, 6480, 6565, 6822, 7066, 7151, 7236, 7493, 7829]) = -b1(2)*a1(2)-b1(1)*a1(1);
	M([2149, 2234, 3514, 3599, 4027, 4702, 4787, 5129, 5214, 5642, 6141, 6226, 6311, 6567, 6652, 6737, 6994, 7238, 7323, 7408, 7665, 8001]) = 1/2-1/2/glab(3)*glab(1)+1/2/glab(3)*glab(5);
	M([2493, 2578, 2835, 3516, 3601, 3858, 3943, 4028, 4285, 5132, 5217, 5473, 5558, 5643, 5900, 6485, 6570, 6655, 6740, 6825, 6910, 6995, 7496, 7581, 7666, 7751, 8087]) = 1/glab(3)*a1(2)*d1(2)*glab(1)+1/glab(3)*a1(1)*d1(1)*glab(1)-1/glab(3)*a1(2)*d1(2)*glab(5)-1/glab(3)*a1(1)*d1(1)*glab(5);
	M([3525, 3610, 4039, 4720, 4805, 5148, 5233, 5661, 6250, 6335, 6591, 6676, 6761, 7018, 7173, 7258, 7343, 7428, 7513, 7598, 7683, 7768, 7840, 7925, 8010, 8095, 8173]) = -1/2/glab(3)*a1(2)^2*glab(1)-1/2/glab(3)*a1(1)^2*glab(1)+1/2/glab(3)*a1(1)^2*glab(5)+1/2/glab(3)*a1(2)^2*glab(5)+1/2*a1(2)^2+1/2*a1(1)^2;
	M([430, 1196, 1367, 2040, 2211, 2554, 2725, 3223, 3394, 3565, 3736, 3907, 4164, 5005, 5176, 5519, 6626]) = 1;
	M([516, 1454, 1539, 2470, 2812, 2897, 3653, 3824, 3995, 4080, 4251, 4336, 5435, 5606, 5863, 6970]) = -1/2/glab(3)*glab(2)+1/2/glab(3)*glab(6)-1/2;
	M([1204, 2228, 2571, 3158, 3586, 3929, 4427, 4598, 4769, 5026, 5197, 5540, 6123, 6294, 6637, 7314]) = -1;
	M([1376, 2572, 2743, 3416, 3587, 3930, 4187, 4857, 5028, 5199, 5370, 5541, 5798, 6467, 6638, 6895, 7572]) = c1(1)*d1(1)+c1(2)*d1(2);
	M([1462, 2829, 3502, 4016, 4273, 4943, 5114, 5456, 5627, 5884, 6553, 6724, 6981, 7658]) = -1/glab(3)*glab(6)+1/glab(3)*glab(2);
	M([1548, 2830, 2915, 3846, 4017, 4274, 4359, 5287, 5458, 5629, 5714, 5885, 6811, 6982, 7744]) = -1/2*d1(2)^2-1/2/glab(3)*d1(1)^2*glab(2)-1/2/glab(3)*d1(2)^2*glab(2)+1/2/glab(3)*d1(1)^2*glab(6)+1/2/glab(3)*d1(2)^2*glab(6)-1/2*d1(1)^2;
	M([2580, 3604, 3947, 4620, 4791, 5220, 5563, 5975, 6146, 6317, 6488, 6659, 6916, 7155, 7326, 7583, 7916]) = -c1(2)*a1(2)-c1(1)*a1(1);
	M([4033, 4706, 5649, 6061, 6232, 6574, 6745, 7002, 7241, 7412, 7669, 8002]) = 1/2/glab(3)*glab(6)-1/2/glab(3)*glab(2)+1/2;
	M([2838, 4034, 4291, 5136, 5650, 5907, 6405, 6576, 6747, 6832, 7003, 7499, 7670, 7755, 8088]) = -1/glab(3)*a1(1)*d1(1)*glab(6)+1/glab(3)*a1(1)*d1(1)*glab(2)-1/glab(3)*a1(2)*d1(2)*glab(6)+1/glab(3)*a1(2)*d1(2)*glab(2);
	M([4042, 5667, 6254, 6768, 7025, 7093, 7264, 7435, 7520, 7691, 7776, 7843, 8014, 8099, 8174]) = -1/2/glab(3)*a1(1)^2*glab(2)-1/2/glab(3)*a1(2)^2*glab(2)+1/2/glab(3)*a1(2)^2*glab(6)+1/2/glab(3)*a1(1)^2*glab(6)+1/2*a1(2)^2+1/2*a1(1)^2;

	Mr = rref(M);  % replace me with a MEX

	A = zeros(10);
	amcols = [96 95 94 93 92 91 90 89 88 87];
	A(1, 5) = 1;
	A(2, 9) = 1;
	A(3, :) = -Mr(85, amcols);
	A(4, :) = -Mr(84, amcols);
	A(5, :) = -Mr(83, amcols);
	A(6, :) = -Mr(80, amcols);
	A(7, :) = -Mr(77, amcols);
	A(8, :) = -Mr(76, amcols);
	A(9, :) = -Mr(75, amcols);
	A(10, :) = -Mr(73, amcols);

	% generated for action variable 'zb'
	% action matrix monomials: 1 zd f zc zb zd^2 f*zd zc*zd zb*zd f^2
	[V D] = eig(A);
	sol =  V([5, 4, 3, 2],:)./(ones(4, 1)*V(1,:));

	if (find(isnan(sol(:))) > 0)
		
		zb = [];
		zc = [];
		f = [];
		zd = [];
	else
		
		I = find(not(imag( sol(1,:) )));
		zb = sol(1,I);
		zc = sol(2,I);
		f = sol(3,I);
		zd = sol(4,I);
	end
end
