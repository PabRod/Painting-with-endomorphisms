%% Painting linear endomorphisms in the plane
% By Pablo Rodríguez Sánchez
%
% pablo.rodriguez.sanchez@gmail.com

%% What are we going to do?
%
% A linear endomorphism in the plane is a linear application between 
% $R^2$ and $R^2$.
%
% Usually are represented in the matrix form:
%
% $$\vec{y} = A \cdot \vec{x}$$
%
% Where both vectors are columns vectors, and A is a 2 x 2 matrix.
%
% So there are characterized by the matrix $A$.


%% Introduce the endomorphism matrix
% In the following code chunk, the user can introduce any 2 x 2 matrix.
A = [2 1; -3 1];

%%
% So the endomorphism is described by:
y = @(x) A*x;

%%
% with A being:
disp(A);

%% So what?
% We have a linear function wich takes vectors and returns vectors. Let's
% give it a try:

input = [1; 2];
output = y(input);

disp(output);

%% Paint the mapping
% We can paint the mapping following these simple rules:
%
% # Represent the input and output as points in the plane
% # Paint an arrow going from input to output
%
% Using the previous example, we'll get:

figure;
hold on;
axis equal;

size = 15;
scatter(0,0, 'filled');
scatter(input(1), input(2), size, 'filled');
scatter(output(1), output(2), size, 'filled');

line([input(1), output(1)], [input(2), output(2)]);

%% Map a full circle
% Mapping a set of points over a circle returns beauty plots like this:
figure;
hold on;
axis equal;

step = pi/60;
t = 0:step:2*pi;
n = numel(t);
xs = [cos(t); sin(t)];
ys = y(xs);

% Plot the points ...
size = 15;
scatter(0,0, 'filled');
scatter(xs(1,:), xs(2,:), size, 'filled');
scatter(ys(1,:), ys(2,:), size, 'filled');
plot(xs(1,:), xs(2,:), '--', 'Color', 'black');
plot(ys(1,:), ys(2,:), '--', 'Color', 'black');

% ... the arrows ...
for i = 1:n
    plot([xs(1,i), ys(1,i)], [xs(2,i), ys(2,i)]);
end