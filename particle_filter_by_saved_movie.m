close all ; clear all ; clc

%% Control Parameters 
global show_particle 
show_particle = 0 ; 

%% Global Parameters  
global keyPress ; % default c :continue ; p: pause
global img_height 
global img_width

keyPress = '' ;
F_update = [1 0 1 0; 0 1 0 1; 0 0 1 0; 0 0 0 1];

Npop_particles = 4000;

Xstd_rgb = 50;
Xstd_pos = 25;     % variation of position noise - gaussian
Xstd_vec = 5;      % variation of velocity noise - gaussian

Xrgb_trgt = [255; 0; 0];

%% Loading Movie

vr = VideoReader('Person.wmv');
img_width = vr.Width ; 
img_height = vr.Height ;

%Npix_resolution = [vr.Width vr.Height];
Nfrm_movie = floor(vr.Duration * vr.FrameRate);

%% Object Tracking by Particle Filter

%X = create_particles(Npix_resolution, Npop_particles);
fig_h = figure(1);
set(fig_h,'KeyPressFcn', @key_pressed_fcn) ; 
title('+++ Showing Particles +++');

for k = 1:Nfrm_movie
    
    % Getting Image
    Y_k = read(vr, k);
        
    % Pause video to select target
    if(keyPress == 'p')   
        rec = getrect ; rec = floor(rec);
        recx_min = rec(1); recy_min = rec(2);recw = rec(3); rech = rec(4) ;
        X = create_particles(rec , Npop_particles);
        show_particles(X,Y_k,rec);
        keyPress = 'c' ;  % return keyPress to continue 
        
    elseif(keyPress == 'c') 
        % Forecasting
        X = update_particles(F_update, Xstd_pos, Xstd_vec, X);
    
        % Calculating Log Likelihood
        L = calc_log_likelihood(Xstd_rgb, Xrgb_trgt, X(1:2, :), Y_k);
    
        % Resampling
        [X,rec_new] = resample_particles(X, L,rec);
        
        % Creating New Particle in New Bounding Box 
        X = create_particles(rec_new , Npop_particles);

        %Display
        show_particles(X,Y_k,rec_new);

    else
       % Plotting Image  
        image(Y_k) ;
        drawnow
    end
        
end



