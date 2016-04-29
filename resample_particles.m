function [X,rec_new] = resample_particles(X, L_log,rec_old)
bwidth = rec_old(3); 
bheight = rec_old(4); 
% Scaling likelihood to range [0,1]
%Q = L / sum(L, 2);
%R = cumsum(Q, 2);

L = exp(L_log);
Q = L / sum(L, 2);
% Select particles of >= 0.7 and new bounding box 
rec_center = sum(X([1,2],:).*repmat(Q,2,1),2) ; 
rec_new = [floor(rec_center(1) - bwidth/2),floor(rec_center(2) - bheight/2), bwidth, bheight] ; % keep the same width and height with old bounding box

% Generating Random Numbers

%N = size(X, 2);
%T = rand(1, N);

% Resampling

%[~, I] = histc(T, R);
%X = X(:, I + 1);
