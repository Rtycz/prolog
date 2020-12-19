:-['bz.pl'].

process(Answer, Answers, AnswersNew, Q) :-
  member(Answer, [1, 'yes', 'true']),			%Если ответ содержит такие словечки, то в массив записываем номер вопроса Q
  append(Answers, [Q], AnswersNew),!.

 process(_, AnswersNew, AnswersNew, _).

% Если объект есть в базе то выведем его
check(Answers, 14) :-
  canistra(X, Answers),
  nl,
  write('Is '),
  write(X),
  nl.

% Если такого ответа нет в базе, то допишем
check(Answers, Q) :-
  not(canistra(_, Answers)),
  Q = 14,
  nl,
  write('Enter new canister'),
  nl,
  read(New),
  nl,
  open('D:/!Windows/4 Course/Prolog/akinator/bz.pl', append, Stream),
  nl(Stream),
  write(Stream, 'canistra(\''),
  write(Stream, New),
  write(Stream, '\','),
  write(Stream, Answers),
  write(Stream, ').'),
  close(Stream),
  nl,
  write('Finished').

% Переходим к следующему вопросу
check(Answers, Q) :-
  Q1 is Q + 1,
  run(Q1, Answers), !.

% Основной цикл
run(Q, Answers) :-
  answ(Q, Question),
  write(Question), nl,
  read(Answer),
  process(Answer, Answers, AnswersNew, Q),
  check(AnswersNew, Q).

main :-
  run(1, []).