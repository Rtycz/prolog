% вспомогательные функции
divisible(X, Y) :- 0 is X mod Y, !.
divisible(X, Y) :- X > Y + 1, divisible(X, Y + 1), !.

isPrime(2) :- true, !.
isPrime(X) :- X < 2, !, false.
isPrime(X) :- not(divisible(X, 2)).

% вычисление количества цифр в числе
numberOfDigits(Num, Res):-
    Num < 10,
    Res is 1, !;
    CuttedNum is div(Num, 10),
    numberOfDigits(CuttedNum, ResCutted),
    Res is ResCutted + 1.
% вспомогательные функции

% N должно быть >= 10
findSumOfCuttedNums(N, Res):-
    findSumOfCuttedNums(N, Res, 0, 10),
    !.

findSumOfCuttedNums(N, Res, Res, I):-
    I >= N,
    !.

findSumOfCuttedNums(N, Res, TempSum, I):-
    % либо добавляем к сумме (условия выполнены)
    cutLeftAndCheckSimplicity(I),
    cutRightAndCheckSimplicity(I),
    print(I), print(';'),
    TempSumPlusI is TempSum + I,
    I1 is I + 1,
    % либо переходим к следующему числу
    findSumOfCuttedNums(N, Res, TempSumPlusI, I1);
    I1 is I + 1,
    findSumOfCuttedNums(N, Res, TempSum, I1).

% Идем справа налево по разрядам числа
cutLeftAndCheckSimplicity(N):-
    % если < 10 (отрезать больше не можем), то просто проверяем простоту
    N < 10,
    isPrime(N), !;
    % пока можем - отрезаем
    isPrime(N),
    CuttedNum is div(N, 10),
    cutLeftAndCheckSimplicity(CuttedNum).

% Идем слева направо по разрядам числа
cutRightAndCheckSimplicity(N):-
    N < 10,
    isPrime(N), !;
    isPrime(N),
    numberOfDigits(N, DigitsNum),
    DigitMask is 10 ** (DigitsNum - 1), % строим маску для отрезания цифры
    CuttedNum is mod(N, DigitMask), % отрезаем справа цифру
    cutRightAndCheckSimplicity(CuttedNum).
