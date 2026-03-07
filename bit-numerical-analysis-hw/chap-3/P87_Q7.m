D = diag([10, 10, 10]);
L = [0, 0, 0; 4, 0, 0; 4, 8, 0];
U = L';
b = [13; 11; 25];
I = eye(size(D));
A = D + L + U;

% Jacobi

M = I - D \ A;
g = D \ b;

disp('--- Jacobi M & g ---');
disp(rats(M));
disp(rats(g));
eigenvalues = eig(M);
spectral_radius = max(abs(eigenvalues));
disp(spectral_radius);

% Gauss-Seidel
M =- (D + L) \ U;
g = (D + L) \ b;

disp('--- Gauss-Seidel M & g ---');
disp(rats(M));
disp(rats(g));
eigenvalues = eig(M);
spectral_radius = max(abs(eigenvalues));
disp(spectral_radius);

% SOR
omega = 1.35;
M =- (D + omega * L) \ ((1 - omega) * D - omega * U);
g = omega * (D + omega * L) \ b;

disp('--- SOR M & g ---');
disp(rats(M));
disp(rats(g));
eigenvalues = eig(M);
spectral_radius = max(abs(eigenvalues));
disp(spectral_radius);