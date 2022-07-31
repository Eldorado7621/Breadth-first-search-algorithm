clear all
close all

map=false(10,5);

%mark obstacles
map(2:10,1)=true;
map(1:2,4:5)=true;
map(10,2:3)=true;

%assign start and goal node
start_coords=[7,3];
goal_coords=[2,3];

drawMapEveryTime=true;

[route, Step]=BFS_SearchAlgo_Function(map,start_coords,goal_coords,drawMapEveryTime);