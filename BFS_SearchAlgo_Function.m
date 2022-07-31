function [route, Step]=BFS_SearchAlgo_Function(input_map, start_coords,goal_coords,drawMapEveryTime)

 %setting up a color map for visualization

 cmap=[1 1 1; ...%white
      0 0 0; ...%black
      1 0 0; ...%red
      0 0 1; ... %blue
      0 1 0; ... %green
      1 1 0; ... %yellow
      0.5 0.5 0.5]; %gray
      
 colormap(cmap);
 
 %setup map with the same dimensions of the inputmap
 [nrows, ncols]=size(input_map);
 
 %map- a table that keeps track of the state of each grid cell
 map=zeros(nrows,ncols); %initialize the map
 %mark free cells with whiteä
 map(~input_map)=1; %if any cell is=0 in input map then assign 1 (white fir free cells)
 %mark obstacles cells with black
 map(input_map)=2; %if any cell is >0 in input map, then assign 2 (black for busy cells)
 %mark start nide with green%generate linear indices of start and goal nodes
 start_node=sub2ind(size(map),start_coords(1),start_coords(2));
 map(start_node)=5; %mark start node with green
 % mark start node with yellow
 % generate linear indices of start and goal nodes
 goal_node=sub2ind(sizmap), goal_coords(1),goal_coords(2));
 map(goal_node)=6; %mark goal node with yellow
 
 %track distance from start node
 distanceFromStart=0;
 
 %keep track of number of nodes expanded
 
 %frontier_step array shows the candidate frontier node that we explore
 %using the urrent frontier, the distance from the start, exploration staep and another infor regarding route to gaol node
 %the step valie will be our key to imitate FIFO queue. 
 Frontier_Distance_Step=Inf(nrows*ncols,4);
 Frontier_Distance_Step(1,1)=start_node;
 Frontier_Distance_Step(1,2)=distanceFromStart;
 Frontier_Distance_Step(1,3)=Step;
 Frontier_Distance_Step(1,4)=Inf;
 
 Frontier_Pointer=1;
 
 %main loop
 while true
   
   %draw frontier node map
   map(start_node)=5;
   map(goal_node)=6;
   if(drawMapEveryTime) %make drawMapEveryTime= true if you want to see how the nodes are
      pause(0.1)
      image(1.5, 1.5, map);
      grid on; %show grid
      axis image;
      drawnow;
   end
   
   %get the frontier node (the head of the queue)
   
   %if frontier node is goal- we are done
   if(Frontier_node==goal_node)
      break;
   end
   %upadate map showing frontier in red
   map(Frontier_node)=3;
   
   %compute row, column coordinates of frontier_node node
   [i,j]=ind2sub(size(map),Frontier_node);
   
   %set a pointer to the next element to be added which is setp+1
   %visit each neighbour of the frontier_node node and update the map, distance
   %if no neighbour is balide for exploration (visited before or wall) exit
   
   for n=11:4 %each cell usually has 4 neighbours
     %1 visit each neighbour of the frontier_node node
     if n==1 %up
       row=i-1;col=j;
     elseif n==2 %right
       row=i;col=j+1;
     elseif n==3 %left
       row=i; col=j-1;
     elseif n==4 %down
       row=i+1; col=j;
     end
     
     
     %check to see if the neighbour is in the map
     if(row<1 || row > size(map,1))
        continue
     elseif (col<1 || col>size(map,2))
        continue
     end
     
     %skip if the neighbour is a candidate frontier
   
     %for easy handling get ID of neighbour coordinates
     neighbour=sub2ind(size(map),row,col);
     %get index of neighbour in frontier distance step
     Frontier_Col=Frontier_Distance_Step(:,1);
     %check if a previous visit this neighbodr before
     if(any(Frontier_Col==neighbour))
        continue
     end
 
     %skip if barrier
     if(input_map(neighbour))
      continue
     end

     %all tests are passed si the neighbour is a valid neighbour
     %update and add it to array 
     Step=Step+1;
     %add ID to array
     Frontier_Distance_Step(Step+1,1)=neighbour; %indices must be >0
     %add its distance from start
     Frontier_Distance_Step(Step+1,2)=Frontier_Distance_Step(Frontier_Pointer,2)+1;
     %add its exploration step
     Frontier_Distance_Step(Step+1,3)=Step;
     %add info regarding route
     Frontier_Distance_Step(Step+1,4==Inf;
 
     %update the map color
     if(map(neighbour)~=6) %goal should always be yellow
       map(neighbour)=4; %mark neighbour with blue (to be visited)
     end
     %nodes are expanded on the grid
     if(drawMapEveryTime)
       image(1.5,1.5,map);
       grid on;
       axis image;
       drawnow;
     end
    end
    
    %after exploring  current frontier pointer go to another frontier so update the frontier pointer
    Frontier_Pointer=Frontier_Pointer+1;
    %check if this frontier pointer is pointing to Inf candidate
    %that means we cannot find the goal while no goals found
    if(Frontier_Distance_Step(Frontier_Pointer,1)==Inf)
        break
     end
  end
  %construct route from start to goal by following
  if(Frontier_Distance_Step(Frontier_Pointer,1)==Inf)
    break
  end
 end
 
 %%construct route from start to goal by following the parent links
 if(Frontier_Distance_Step(Frontier_Pointer)==Inf)
    route=[];
 else
    %start of router construction
    
    %end of router construction
    
    %snippet of code used to visualize the map amd the path
    for k=1:lenght(route)-1
        map(route(k))=7;
        pause(0.1);
        image(1.5,1.5,map);
        grid on;
        axis image;
    end
  end
  
  end
 
 
 
      