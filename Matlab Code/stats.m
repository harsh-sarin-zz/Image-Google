arr = [0.434782608695652,0.250000000000000,0.571428571428571,0.500000000000000,0.0833333333333333,0.166666666666667,0.333333333333333,0.352941176470588,0.363636363636364,0,0.428571428571429,0,0.280000000000000,0.450000000000000];
res = mean(arr);
arrspecificity = [0.932367149758454;0.926605504587156;0.917391304347826;0.966507177033493;0.978260869565217;0.959459459459459;0.973913043478261;0.972477064220184;0.910714285714286;0.936651583710407;0.969565217391304;0.981220657276995;0.971153846153846;1;1;0.978260869565217;0.960869565217391;0.973333333333333;0.995121951219512;0.985714285714286];
resspecificit = mean(arrspecificity);
arrprecision = [0.416666666666667;0.157894736842105;0;0.631578947368421;0;0.307692307692308;0;0.142857142857143;0.0476190476190476;0.176470588235294;0;0.600000000000000;0.571428571428571;1;0;0;0;0.875000000000000;0.750000000000000];
resprecision = mean(arrprecision);
fscore = [0.425531914893617;0.193548387096774;0;0.600000000000000;0;0.380952380952381;0;0.105263157894737;0.0740740740740741;0.230769230769231;0;0.444444444444444;0.444444444444444;0;0.600000000000000;0;0;0;0.424242424242424;0.562500000000000];
resfscore = mean(fscore);