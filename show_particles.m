function show_particles(X,Y_k, rec)
global show_particle 

%define rectangle 
recx_min = rec(1); recy_min = rec(2);recw = rec(3); rech = rec(4) ;
rec_center = [recx_min + floor(recw/2), recy_min + floor(rech/2) ] ;
recx_cor = [recx_min, recx_min + recw, recx_min + recw, recx_min, recx_min]; 
recy_cor = [recy_min, recy_min, recy_min + rech, recy_min + rech, recy_min];

figure(1) ;
%show image
image(Y_k) ;
%show bounding box 
hold on 
plot(rec_center(1), rec_center(2), 'r+');
plot(recx_cor , recy_cor);
hold off

if(show_particle == 1) 
    hold on
    plot(X(1,:), X(2,:), '.');               % because plot is different with images
    plot(rec_center(1), rec_center(2), 'r+');
    plot(recx_cor , recy_cor);
    hold off
end    
drawnow
