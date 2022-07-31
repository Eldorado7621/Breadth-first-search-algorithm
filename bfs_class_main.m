%create a 10x5 mao filled with zeros(free cells)
input_map=false(10,5);

%mark obstacles
input_map(2:10,1)=true;
input_map(1:2,4:5)=true;
input_map(10,2:3)=true;

%assign start and goal node
start_coords=[7,3];
goal_coords=[2,3];

drawMapEveryTime=true;

[route, Step]=BFS_SearchAlgo_Function(map,start_coords,goal_coords,drawMapEveryTime);