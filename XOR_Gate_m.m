% Bramka XOR na podstawie modelu neuronu McCulocha-Pittsa
clc
close all
clear 

% Definicja wejść
X = [0 0; 0 1; 1 0; 1 1]

% Spodziewane wyjścia bramki XOR na podstawie wejść
Y_expected = [0; 1; 1; 0]

% Przypisanie wag i progów
% Warstwa 1: AND i OR
w_and = [1, 1]
w_or = [1, 1]
threshold_and = 2
threshold_or = 1

% Warstwa 2: Kombinacja AND oraz OR
w_xor = [1, 1]; % Wagi po kombinacji wyjść bramek OR oraz NOT AND
threshold_xor = 1.5;

% Iteracja przez każdą parę wejść
for i = 1:size(X, 1)
    % Wejścia
    x1 = X(i, 1);
    x2 = X(i, 2);

    % Warstwa 1 - neuron AND
    and_output = x1 * w_and(1) + x2 * w_and(2);
    if and_output >= threshold_and
        and_output = 1;
    else
        and_output = 0;
    end

    % Warstwa 1 - neuron OR
    or_output = x1 * w_or(1) + x2 * w_or(2);
    if or_output >= threshold_or
        or_output = 1;
    else
        or_output = 0;
    end

    % Warstwa 2 - neuron XOR
    xor_input = [or_output, 1 - and_output]; % NOT AND = 1 - AND_OUTPUT
    xor_output = xor_input * w_xor';
    if xor_output >= threshold_xor
        xor_output = 1;
    else
        xor_output = 0;
    end

    % Wyświetl wynik
    fprintf('Wejścia: [%d, %d] => Wynik XOR: %d (Spodziewany wynik: %d\n',x1,x2,xor_output,Y_expected(i))
end