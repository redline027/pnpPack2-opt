function P=compute_constraint_distance_3param_6eq_6unk_f_unk(m1,m2)

%redefine variables name, for compatibility with maple
m1_1=m1(1); 
m1_2=m1(2); 
m1_3=m1(3); 
m1_4=m1(4); 
m1_5=m1(5); 
m1_6=m1(6);
m1_7=m1(7); 
m1_8=m1(8); 
m1_9=m1(9); 
m1_10=m1(10); 
m1_11=m1(11); 
m1_12=m1(12);

m2_1=m2(1); 
m2_2=m2(2); 
m2_3=m2(3); 
m2_4=m2(4); 
m2_5=m2(5); 
m2_6=m2(6);
m2_7=m2(7); 
m2_8=m2(8); 
m2_9=m2(9); 
m2_10=m2(10); 
m2_11=m2(11); 
m2_12=m2(12);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t1 = (m1_4 ^ 2);
t2 = (m1_1 ^ 2);
t7 = (m1_5 ^ 2);
t8 = (m1_2 ^ 2);
t11 = (m1_1 * m2_1);
t12 = (m1_5 * m2_5);
t15 = (m1_2 * m2_2);
t16 = (m1_4 * m2_4);
t19 = (m2_4 ^ 2);
t22 = (m2_2 ^ 2);
t23 = (m2_1 ^ 2);
t24 = (m2_5 ^ 2);
t28 = (m1_6 ^ 2);
t29 = (m1_3 ^ 2);
t34 = (m1_3 * m2_3);
t36 = (m1_6 * m2_6);
t40 = (m2_6 ^ 2);
t41 = (m2_3 ^ 2);
t47 = (m1_7 ^ 2);
t48 = (m1_8 ^ 2);
t52 = (m1_7 * m2_7);
t55 = (m1_8 * m2_8);
t59 = (m2_8 ^ 2);
t62 = (m2_7 ^ 2);
t64 = (m1_9 ^ 2);
t68 = (m1_9 * m2_9);
t74 = (m2_9 ^ 2);
t78 = (m1_10 ^ 2);
t79 = (m1_11 ^ 2);
t84 = (m1_10 * m2_10);
t87 = (m1_11 * m2_11);
t90 = (m2_10 ^ 2);
t95 = (m2_11 ^ 2);
t99 = (m1_12 ^ 2);
t101 = (m1_12 * m2_12);
t105 = (m2_12 ^ 2);
P(1,1) = t1 + t2 - 2 * m1_4 * m1_1 - 2 * m1_5 * m1_2 + t7 + t8;
P(1,2) = -2 * m2_4 * m1_1 + 2 * t11 + 2 * t12 - 2 * m1_4 * m2_1 - 2 * m2_5 * m1_2 + 2 * t15 + 2 * t16 - 2 * m1_5 * m2_2;
P(1,3) = t19 - 2 * m2_4 * m2_1 + t22 + t23 + t24 - 2 * m2_5 * m2_2;
P(1,4) = t28 + t29 - 2 * m1_6 * m1_3;
P(1,5) = -2 * m2_6 * m1_3 + 2 * t34 - 2 * m1_6 * m2_3 + 2 * t36;
P(1,6) = -2 * m2_6 * m2_3 + t40 + t41;
P(2,1) = t8 - 2 * m1_8 * m1_2 - 2 * m1_7 * m1_1 + t47 + t48 + t2;
P(2,2) = 2 * t15 - 2 * m1_8 * m2_2 - 2 * m2_8 * m1_2 + 2 * t52 - 2 * m1_7 * m2_1 - 2 * m2_7 * m1_1 + 2 * t55 + 2 * t11;
P(2,3) = -2 * m2_8 * m2_2 + t22 + t23 + t59 - 2 * m2_7 * m2_1 + t62;
P(2,4) = t29 + t64 - 2 * m1_9 * m1_3;
P(2,5) = 2 * t34 + 2 * t68 - 2 * m2_9 * m1_3 - 2 * m1_9 * m2_3;
P(2,6) = -2 * m2_9 * m2_3 + t74 + t41;
P(3,1) = -2 * m1_11 * m1_2 + t2 + t8 + t78 + t79 - 2 * m1_10 * m1_1;
P(3,2) = 2 * t15 - 2 * m1_11 * m2_2 + 2 * t84 - 2 * m1_10 * m2_1 - 2 * m2_10 * m1_1 + 2 * t87 - 2 * m2_11 * m1_2 + 2 * t11;
P(3,3) = t90 + t22 - 2 * m2_10 * m2_1 + t23 - 2 * m2_11 * m2_2 + t95;
P(3,4) = -2 * m1_12 * m1_3 + t99 + t29;
P(3,5) = 2 * t34 + 2 * t101 - 2 * m2_12 * m1_3 - 2 * m1_12 * m2_3;
P(3,6) = t41 + t105 - 2 * m2_12 * m2_3;
P(4,1) = t48 + t1 - 2 * m1_8 * m1_5 + t7 - 2 * m1_7 * m1_4 + t47;
P(4,2) = 2 * t16 - 2 * m1_7 * m2_4 + 2 * t55 + 2 * t52 - 2 * m1_8 * m2_5 - 2 * m2_8 * m1_5 - 2 * m2_7 * m1_4 + 2 * t12;
P(4,3) = t24 - 2 * m2_8 * m2_5 + t19 - 2 * m2_7 * m2_4 + t62 + t59;
P(4,4) = -2 * m1_9 * m1_6 + t64 + t28;
P(4,5) = 2 * t68 + 2 * t36 - 2 * m2_9 * m1_6 - 2 * m1_9 * m2_6;
P(4,6) = t40 + t74 - 2 * m2_9 * m2_6;
P(5,1) = t1 - 2 * m1_10 * m1_4 + t7 + t78 + t79 - 2 * m1_11 * m1_5;
P(5,2) = 2 * t84 - 2 * m1_11 * m2_5 - 2 * m1_10 * m2_4 + 2 * t16 - 2 * m2_11 * m1_5 + 2 * t87 - 2 * m2_10 * m1_4 + 2 * t12;
P(5,3) = t19 + t24 - 2 * m2_10 * m2_4 - 2 * m2_11 * m2_5 + t95 + t90;
P(5,4) = t28 - 2 * m1_12 * m1_6 + t99;
P(5,5) = 2 * t101 + 2 * t36 - 2 * m2_12 * m1_6 - 2 * m1_12 * m2_6;
P(5,6) = t105 - 2 * m2_12 * m2_6 + t40;
P(6,1) = -2 * m1_10 * m1_7 + t47 + t48 + t78 + t79 - 2 * m1_11 * m1_8;
P(6,2) = 2 * t84 + 2 * t87 - 2 * m2_11 * m1_8 - 2 * m1_10 * m2_7 - 2 * m2_10 * m1_7 + 2 * t55 + 2 * t52 - 2 * m1_11 * m2_8;
P(6,3) = -2 * m2_10 * m2_7 - 2 * m2_11 * m2_8 + t62 + t59 + t90 + t95;
P(6,4) = t64 - 2 * m1_12 * m1_9 + t99;
P(6,5) = 2 * t68 - 2 * m2_12 * m1_9 - 2 * m1_12 * m2_9 + 2 * t101;
P(6,6) = t105 - 2 * m2_12 * m2_9 + t74;
