function X = create_particles(rec, Npop_particles)

recx_min = rec(1); recy_min = rec(2);recw = rec(3); rech = rec(4) ;
rec_center = [recx_min + floor(recw/2), recy_min + floor(rech/2) ] ;
sigma = 0.5*(recw + rech)   ; % assume sigmax = sigmay = 1/2(width + height

X1 = randn(1,Npop_particles)*recw/4+ rec_center(1)*ones(1,Npop_particles);
X2 = randn(1,Npop_particles)*rech/4+ rec_center(2)*ones(1,Npop_particles);
    

X3 = zeros(2, Npop_particles);

X = [floor(X1); floor(X2); X3];
