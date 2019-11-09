function [o0,o1,o2,o3,o4,o5]=LaplacianPyramid(l0,l1,l2,l3,l4,l5,l6)

o0 = l0 - imresize(l1,2);
o1 = l1 - imresize(l2,2);
o2 = l2 - imresize(l3,2);
o3 = l3 - imresize(l4,2);
o4 = l4 - imresize(l5,2);
o5 = l5 - imresize(l6,2);
