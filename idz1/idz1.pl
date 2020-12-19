% ��������������� �������
divisible(X, Y) :- 0 is X mod Y, !.
divisible(X, Y) :- X > Y + 1, divisible(X, Y + 1), !.

isPrime(2) :- true, !.
isPrime(X) :- X < 2, !, false.
isPrime(X) :- not(divisible(X, 2)).

% ���������� ���������� ���� � �����
numberOfDigits(Num, Res):-
    Num < 10,
    Res is 1, !;
    CuttedNum is div(Num, 10),
    numberOfDigits(CuttedNum, ResCutted),
    Res is ResCutted + 1.
% ��������������� �������

% N ������ ���� >= 10
findSumOfCuttedNums(N, Res):-
    findSumOfCuttedNums(N, Res, 0, 10),
    !.

findSumOfCuttedNums(N, Res, Res, I):-
    I >= N,
    !.

findSumOfCuttedNums(N, Res, TempSum, I):-
    % ���� ��������� � ����� (������� ���������)
    cutLeftAndCheckSimplicity(I),
    cutRightAndCheckSimplicity(I),
    print(I), print(';'),
    TempSumPlusI is TempSum + I,
    I1 is I + 1,
    % ���� ��������� � ���������� �����
    findSumOfCuttedNums(N, Res, TempSumPlusI, I1);
    I1 is I + 1,
    findSumOfCuttedNums(N, Res, TempSum, I1).

% ���� ������ ������ �� �������� �����
cutLeftAndCheckSimplicity(N):-
    % ���� < 10 (�������� ������ �� �����), �� ������ ��������� ��������
    N < 10,
    isPrime(N), !;
    % ���� ����� - ��������
    isPrime(N),
    CuttedNum is div(N, 10),
    cutLeftAndCheckSimplicity(CuttedNum).

% ���� ����� ������� �� �������� �����
cutRightAndCheckSimplicity(N):-
    N < 10,
    isPrime(N), !;
    isPrime(N),
    numberOfDigits(N, DigitsNum),
    DigitMask is 10 ** (DigitsNum - 1), % ������ ����� ��� ��������� �����
    CuttedNum is mod(N, DigitMask), % �������� ������ �����
    cutRightAndCheckSimplicity(CuttedNum).
