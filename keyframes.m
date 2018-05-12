
v = VideoReader('../videos/robotWVUModified3x.mp4');   %Using video reader reading video

   %Extracting frames
   %T= xyloObj.NumberOfFrames;            % Calculating number of frames
   T = 100;
   for g=1:T
           p=read(v,g);          % Retrieve data from video
           if(g~= v.NumberOfFrames)
                 J=read(v,g+1);
                 th=difference(p,J);        %To calculate histogram difference between two frames 
                 X2(g)=th;
           end
   end
   %calculating mean and standard deviation and extracting frames
   mean=mean2(X2)
   std=std2(X2)
   threshold=std+mean*4
   
   features2 = [];
   
   for g=1: T
%        p =  read(xyloObj,g);
%        if(g~=xyloObj.NumberOfFrames)
%         J=   read(xyloObj,g+1);
%         th=difference(p,J);
            if(th < X2(g))    % Greater than threshold select as a key fram
                
                features2 = [features; g];
                
            end 
%        end
   end 