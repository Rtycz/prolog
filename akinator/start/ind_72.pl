%------------------ Задание ------------------
% Аккинатор про животных!!!!!
%--------------- Конец задания ---------------

%-------------------------
% обозначаем какие предикаты будут динамическими, чтобы пополнять БЗ

:- dynamic small/2.
:- dynamic domestic/2.
:- dynamic real/2.
:- dynamic fangs/2.
:- dynamic hooves/2.
:- dynamic water/2.
:- dynamic wings/2.
:- dynamic bodyparts/2.
:- dynamic picture/2.
:- dynamic rus_name/2.
%-------------------------

%-------------------------
% для считывания текста фактов 

read_str(S):-
  get0(X),
  r_str(X,S,[]).
  
r_str(10,S,S):-!.

r_str(59,S,S):-!.

r_str(X,S,B):-
  append(B,[X],B1),
  get0(X1),
  r_str(X1,S,B1).
%-------------------------


%-------------------------
% для считывания фактов

read_small(10, _):-!.

read_small(_, Animal_pred):-	
  read_str(Animal),
  name(Animal_pred,Animal),
  read(Y),
  asserta(small(Animal_pred,Y)),
  get0(Sym),
  read_small(Sym, Animal_pred).
  
read_domestic(10, _):-!.

read_domestic(_, Animal_pred):-	
  read(Y),
  asserta(domestic(Animal_pred,Y)),
  get0(Sym),
  read_domestic(Sym, Animal_pred).

read_real(10, _):-!.

read_real(_, Animal_pred):-	
  read(Y),
  asserta(real(Animal_pred,Y)),
  get0(Sym),
  read_real(Sym, Animal_pred).


read_fangs(10, _):-!.

read_fangs(_, Animal_pred):-	
  read(Y),
  asserta(fangs(Animal_pred,Y)),
  get0(Sym),
  read_fangs(Sym, Animal_pred).


read_hooves(10, _):-!.

read_hooves(_, Animal_pred):-	
  read(Y),
  asserta(hooves(Animal_pred,Y)),
  get0(Sym),
  read_hooves(Sym, Animal_pred).


read_water(10, _):-!.

read_water(_, Animal_pred):-	
  read(Y),
  asserta(water(Animal_pred,Y)),
  get0(Sym),
  read_water(Sym, Animal_pred).


read_wings(10, _):-!.

read_wings(_, Animal_pred):-	
  read(Y),
  asserta(wings(Animal_pred,Y)),
  get0(Sym),
  read_wings(Sym, Animal_pred).

read_bodyparts(10, _):-!.

read_bodyparts(_, Animal_pred):-	
  read(Y),
  asserta(bodyparts(Animal_pred,Y)),
  get0(Sym),
  read_bodyparts(Sym, Animal_pred). 
  
read_picture(10, _):-!.
 
read_picture(_, Animal_pred):-	
  read_str(Y),
  name(Y1,Y),
  writeln(Y1),
  asserta(picture(Animal_pred,Y1)),
  get0(Sym),
  read_picture(Sym, Animal_pred).  
  
read_rus_name(-1, _):-!.
read_rus_name(10, _):-!.
  
read_rus_name(_, Animal_pred):-	
  read_str(Y),
  name(Y1,Y),
  writeln(Y1),
  asserta(rus_name(Animal_pred,Y1)),
  get0(Sym),
  read_rus_name(Sym, Animal_pred).  
  
  
read_new(X, Sym):-
  see('D:/dz/_univer/Prolog/Prolog_inds/ind_8/GUI/animals.txt'),
  get0(Sym),
  read_small(Sym, Animal),
  read_domestic(Sym, Animal),
  read_real(Sym, Animal),
  read_fangs(Sym, Animal),
  read_hooves(Sym, Animal),
  read_water(Sym, Animal),
  read_wings(Sym, Animal),
  read_bodyparts(Sym, Animal),
  read_picture(Sym, Animal),
  read_rus_name(Sym, Animal),
  read_new(X, Sym),
  X = 'DONE',
  seen.
 
read_new(X, -1):-  !. 

read_new_cont(X1, X2, X3, X4, X5, X6, X7, X8, X, Picture, Rus):-
   asserta(small( X, X1)),
   asserta(domestic( X, X2)),
   asserta(real( X, X3)),
   asserta(fangs( X, X4)),
   asserta(hooves( X, X5)),
   asserta(water( X, X6)),
   asserta(wings( X, X7)),
   asserta(bodyparts( X, X8)),
   asserta(picture( X, Picture)),
   asserta(rus_name( X, Rus)).


%-------------------------
%Ваше животное маленькое?
% 2 - может быть
% 1 - да
% 0 - нет

small(cat, 		  	1).
small(humster, 	  	1).
small(bear, 	  	0).
small(dog, 		  	2).
small(rat, 		  	1).
small(pig, 		  	2).
small(pischiha,   	1).
small(kabarga, 	  	0).
small(fox, 		  	2).
small(dinosaur,   	0).
small(parrot, 	  	1).
small(crocodile,  	0).
small(unicorn, 	  	0).
small(pickachu,   	1).
small(dragon, 	  	0).
small(flying_fish,	1).
small(sonic, 	  	2).
small(fly, 		  	1).
small(vampire_fish, 0).
small(frog, 	  	1).
small(godzilla,   	0).
small(lizard, 	  	2).
small(duck, 	  	1).
small(cow, 		  	0).
small(catdog, 	  	2).
small(cerberus,   	2).
small(gorinich,   	0).
small(narwhal,    	0).
small(sphinx, 	  	0).
small(kurama, 	  	0).
small(phoenix, 	  	0).
small(pegasus, 	  	0).
%-------------------------

%-------------------------
%Ваше животное домашнее?
% 2 - может быть
% 1 - да
% 0 - нет

domestic(cat, 		   1).
domestic(humster, 	   1).
domestic(bear, 	 	   0).
domestic(dog, 		   1).
domestic(rat, 		   2).
domestic(pig, 		   1).
domestic(pischiha,     0).
domestic(kabarga, 	   0).
domestic(fox, 		   0).
domestic(dinosaur,     0).
domestic(parrot, 	   2).
domestic(crocodile,    0).
domestic(unicorn, 	   0).
domestic(pickachu,     2).
domestic(dragon, 	   0).
domestic(flying_fish,  0).
domestic(sonic, 	   0).
domestic(fly, 		   0).
domestic(vampire_fish, 0).
domestic(frog, 	 	   0).
domestic(godzilla,     0).
domestic(lizard, 	   2).
domestic(duck, 	 	   1).
domestic(cow, 		   1).
domestic(catdog, 	   2).
domestic(cerberus,     0).
domestic(gorinich,     0).
domestic(narwhal,      0).
domestic(sphinx, 	   0).
domestic(kurama, 	   0).
domestic(phoenix, 	   0).
domestic(pegasus, 	   0).
%-------------------------

%-------------------------
%Ваше реальное?
% 3 - было таким
% 2 - может быть
% 1 - да
% 0 - нет

real(cat, 		   1).
real(humster, 	   1).
real(bear, 	 	   1).
real(dog, 		   1).
real(rat, 		   1).
real(pig, 		   1).
real(pischiha,     1).
real(kabarga, 	   1).
real(fox, 		   1).
real(dinosaur,     3).
real(parrot, 	   1).
real(crocodile,    1).
real(unicorn, 	   0).
real(pickachu,     0).
real(dragon, 	   2).
real(flying_fish,  1).
real(sonic, 	   0).
real(fly, 		   1).
real(vampire_fish, 1).
real(frog, 	 	   1).
real(godzilla,     0).
real(lizard, 	   1).
real(duck, 	 	   1).
real(cow, 		   1).
real(catdog, 	   0).
real(cerberus,     0).
real(gorinich,     0).
real(narwhal,      1).
real(sphinx, 	   0).
real(kurama, 	   0).
real(phoenix, 	   0).
real(pegasus, 	   0).
%-------------------------

%-------------------------
%У вашего животного есть клыки?
% 1 - да
% 0 - нет

fangs(cat, 		  	1).
fangs(humster, 	  	0).
fangs(bear, 	  	1).
fangs(dog, 		  	1).
fangs(rat, 		  	0).
fangs(pig, 		  	0).
fangs(pischiha,   	0).
fangs(kabarga, 	  	1).
fangs(fox, 		  	1).
fangs(dinosaur,   	1).
fangs(parrot, 	  	0).
fangs(crocodile,  	1).
fangs(unicorn, 		0).
fangs(pickachu, 	1).
fangs(dragon, 		1).
fangs(flying_fish,	0).
fangs(sonic, 	 	0).
fangs(fly, 		 	0).
fangs(vampire_fish, 1).
fangs(frog, 	  	0).
fangs(godzilla,   	1).
fangs(lizard, 	  	0).
fangs(duck, 	  	0).
fangs(cow, 		  	0).
fangs(catdog, 	  	1).
fangs(cerberus,   	1).
fangs(gorinich,   	1).
fangs(narwhal,    	0).
fangs(sphinx, 	  	1).
fangs(kurama, 	  	1).
fangs(phoenix, 	  	0).
fangs(pegasus, 	  	0).
%-------------------------

%-------------------------
%У вашего животного есть копыта?
% 1 - да
% 0 - нет

hooves(cat, 	  	 0).
hooves(humster,  	 0).
hooves(bear, 	   	 0).
hooves(dog, 	  	 0).
hooves(rat, 	  	 0).
hooves(pig, 	  	 1).
hooves(pischiha,  	 0).
hooves(kabarga,   	 1).
hooves(fox, 	  	 0).
hooves(dinosaur,  	 0).
hooves(parrot, 	  	 0).
hooves(crocodile, 	 0).
hooves(unicorn,  	 1).
hooves(pickachu,  	 0).
hooves(dragon, 	 	 0).
hooves(flying_fish,	 0).
hooves(sonic, 	     0).
hooves(fly, 	   	 0).
hooves(vampire_fish, 0).
hooves(frog, 	  	 0).
hooves(godzilla,  	 0).
hooves(lizard, 	  	 0).
hooves(duck, 	  	 0).
hooves(cow, 	  	 1).
hooves(catdog, 	  	 0).
hooves(cerberus,  	 0).
hooves(gorinich,  	 0).
hooves(narwhal,   	 0).
hooves(sphinx, 	  	 0).
hooves(kurama, 	  	 0).
hooves(phoenix,   	 0).
hooves(pegasus,   	 1).
%-------------------------


%-------------------------
%Ваше животное живёт в или возле водоёма?
% 2 - в
% 1 - возле
% 0 - нет

water(cat, 	   	  	0).
water(humster,    	0).
water(bear, 	  	0).
water(dog, 	   	  	0).
water(rat, 	  	  	0).
water(pig, 	  	  	0).
water(pischiha,   	0).
water(kabarga,    	0).
water(fox, 	   	  	0).
water(dinosaur,   	0).
water(parrot, 	  	0).
water(crocodile,  	1).
water(unicorn,    	0).
water(pickachu,   	0).
water(dragon, 	 	0).
water(flying_fish,	2).
water(sonic, 	  	0).
water(fly, 	   	 	0).
water(vampire_fish, 2).
water(frog, 	 	1).
water(godzilla,   	2).
water(lizard, 	  	0).
water(duck, 	  	1).
water(cow, 	   	  	0).
water(catdog, 	  	0).
water(cerberus,   	0).
water(gorinich,   	0).
water(narwhal,    	2).
water(sphinx, 	  	0).
water(kurama, 	  	0).
water(phoenix,    	0).
water(pegasus,    	0).
%-------------------------

%-------------------------
%Ваше животное имеет крылья?
% 2 - может быть
% 1 - да
% 0 - нет

wings(cat, 		  	0).
wings(humster, 	  	0).
wings(bear, 	  	0).
wings(dog, 		  	0).
wings(rat, 		  	0).
wings(pig, 		  	0).
wings(pischiha,   	0).
wings(kabarga, 	  	0).
wings(fox, 		  	0).
wings(dinosaur,   	2).
wings(parrot, 	  	1).
wings(crocodile,  	0).
wings(unicorn, 	  	0).
wings(pickachu,   	0).
wings(dragon, 	    1).
wings(flying_fish,  1).
wings(sonic, 	    0).
wings(fly, 		    1).
wings(vampire_fish, 0).
wings(frog, 	  	0).
wings(godzilla,   	0).
wings(lizard, 	  	0).
wings(duck, 	  	1).
wings(cow, 		  	0).
wings(catdog, 	  	0).
wings(cerberus,   	0).
wings(gorinich,   	1).
wings(narwhal,    	0).
wings(sphinx, 	  	1).
wings(kurama, 	  	0).
wings(phoenix, 	  	1).
wings(pegasus, 	  	1).
%-------------------------

%-------------------------
%У вашего животного может быть нестандартное количество частей тела?
% 2 - может быть
% 1 - да
% 0 - нет

bodyparts(cat, 	   	  	0).
bodyparts(humster,    	0).
bodyparts(bear, 	  	0).
bodyparts(dog, 	   	  	0).
bodyparts(rat, 	   	  	0).
bodyparts(pig, 	  	  	0).
bodyparts(pischiha,   	0).
bodyparts(kabarga,    	0).
bodyparts(fox, 	   	  	0).
bodyparts(dinosaur,   	0).
bodyparts(parrot, 	  	0).
bodyparts(crocodile,  	0).
bodyparts(unicorn,    	0).
bodyparts(pickachu,   	0).
bodyparts(dragon, 	  	0).
bodyparts(flying_fish,	0).
bodyparts(sonic, 	  	0).
bodyparts(fly, 	   	  	0).
bodyparts(vampire_fish, 0).
bodyparts(frog, 	  	0).
bodyparts(godzilla,   	0).
bodyparts(lizard, 	  	2).
bodyparts(duck, 	  	0).
bodyparts(cow, 	   	  	0).
bodyparts(catdog, 	  	1).
bodyparts(cerberus,   	1).
bodyparts(gorinich,   	1).
bodyparts(narwhal,    	0).
bodyparts(sphinx, 	  	0).
bodyparts(kurama, 	  	1).
bodyparts(phoenix,    	0).
bodyparts(pegasus,   	0).
%-------------------------



%-------------------------
% картинка животного
picture(cat, X):-
  string_to_list(' pics_for_ind_789\\cat.png', L),
  name(X,L).
  
picture(humster, X):-
  string_to_list(' pics_for_ind_789\\humster.png', L),
  name(X,L).
  
picture(bear, X):-
  string_to_list(' pics_for_ind_789\\bear.png', L),
  name(X,L).
  
picture(dog, X):-
  string_to_list(' pics_for_ind_789\\dog.png', L),
  name(X,L).
  
picture(rat, X):-
  string_to_list(' pics_for_ind_789\\rat.png', L),
  name(X,L).
  
picture(pig, X):-
  string_to_list(' pics_for_ind_789\\pig.png', L),
  name(X,L).
  
picture(pischiha, X):-
  string_to_list(' pics_for_ind_789\\pischuha.png', L),
  name(X,L).
  
picture(kabarga, X):-
  string_to_list(' pics_for_ind_789\\kabarga.png', L),
  name(X,L).
picture(fox, X):-
  string_to_list(' pics_for_ind_789\\fox.png', L),
  name(X,L).
  
picture(dinosaur, X):-
  string_to_list(' pics_for_ind_789\\dino.png', L),
  name(X,L).
  
picture(parrot, X):-
  string_to_list(' pics_for_ind_789\\parot.png', L),
  name(X,L).
  
picture(crocodile, X):-
  string_to_list(' pics_for_ind_789\\crocodle.png',L),
  name(X,L).
  
picture(unicorn, X):-
  string_to_list(' pics_for_ind_789\\unicorn.png',L),
  name(X,L).
  
picture(pickachu, X):-
  string_to_list(' pics_for_ind_789\\pickachu.png', L),
  name(X,L).
  
picture(dragon, X):-
  string_to_list(' pics_for_ind_789\\dragon.png', L),
  name(X,L).
  
picture(flying_fish, X):-
  string_to_list(' pics_for_ind_789\\flying_fish.png', L),
  name(X,L).
  
picture(sonic, X):-
  string_to_list(' pics_for_ind_789\\sonic.png', L),
  name(X,L).
  
picture(fly, X):-
  string_to_list(' pics_for_ind_789\\fly.png', L),
  name(X,L).
  
picture(vampire_fish, X):-
  string_to_list(' pics_for_ind_789\\vampire_fish.png', L),
  name(X,L).
  
picture(frog, X):-
  string_to_list(' pics_for_ind_789\\frog.png', L),
  name(X,L).
  
picture(godzilla, X):-
  string_to_list(' pics_for_ind_789\\godzilla.png', L),
  name(X,L).
  
picture(lizard, X):-
  string_to_list(' pics_for_ind_789\\lizard.png', L),
  name(X,L).
  
picture(duck, X):-
  string_to_list(' pics_for_ind_789\\duck.png', L),
  name(X,L).
  
picture(cow, X):-
  string_to_list(' pics_for_ind_789\\cow.png', L),
  name(X,L).
  
picture(catdog, X):-
  string_to_list(' pics_for_ind_789\\catdog.png', L),
  name(X,L).
  
picture(cerberus, X):-
  string_to_list(' pics_for_ind_789\\cerberus.png', L),
  name(X,L).
 
picture(gorinich, X):-
  string_to_list(' pics_for_ind_789\\gorinich.png', L),
  name(X,L).
  
picture(narwhal, X):-
  string_to_list(' pics_for_ind_789\\narwhal.png', L),
  name(X,L).
  
picture(sphinx, X):-
  string_to_list(' pics_for_ind_789\\sphinx.png', L),
  name(X,L).
  
picture(kurama, X):-
  string_to_list(' pics_for_ind_789\\kurama.png', L),
  name(X,L).
  
picture(phoenix, X):-
  string_to_list(' pics_for_ind_789\\phoenix.png', L),
  name(X,L).
  
picture(pegasus, X):-
  string_to_list(' pics_for_ind_789\\pegasus.png', L),
  name(X,L).
  
%-------------------------

%-------------------------
% имя
rus_name(cat, X) :-
	 string_to_list(' кошка', L),
	 name(X,L).
	 
rus_name(humster, X) :-
	string_to_list(' хомяк', L),
	name(X,L).

rus_name(bear, X):-
  string_to_list(' медведь', L),
  name(X,L).

rus_name(dog, X):-
  string_to_list(' собака', L),
  name(X,L).

rus_name(rat, X):-
  string_to_list(' крыса', L),
  name(X,L).

rus_name(pig, X):-
  string_to_list(' свинюшка', L),
  name(X,L).

rus_name(pischiha, X):-
  string_to_list(' пищуха', L),
  name(X,L).

rus_name(kabarga, X):-
  string_to_list(' кабарга', L),
  name(X,L).

rus_name(fox, X):-
  string_to_list(' лиса', L),
  name(X,L).

rus_name(dinosaur, X):-
  string_to_list(' ти-рекс', L),
  name(X,L).

rus_name(parrot, X):-
  string_to_list(' попугай', L),
  name(X,L).

rus_name(crocodile, X):-
  string_to_list(' крокодил', L),
  name(X,L).

rus_name(unicorn, X):-
  string_to_list(' единорог', L),
  name(X,L).

rus_name(pickachu, X):-
  string_to_list(' пикачу', L),
  name(X,L).

rus_name(dragon, X):-
  string_to_list(' дракон', L),
  name(X,L).

rus_name(flying_fish, X):-
  string_to_list(' летающая рыба', L),
  name(X,L).

rus_name(sonic, X):-
  string_to_list(' соник', L),
  name(X,L).

rus_name(fly, X):-
  string_to_list(' муха', L),
  name(X,L).
  
rus_name(vampire_fish, X):-
  string_to_list(' рыба-вампир', L),
  name(X,L).

rus_name(frog, X):-
  string_to_list(' лягушка', L),
  name(X,L).

rus_name(godzilla, X):-
  string_to_list(' годзилла', L),
  name(X,L).

rus_name(lizard, X):-
  string_to_list(' ящерица', L),
  name(X,L).

rus_name(duck, X):-
  string_to_list(' утка', L),
  name(X,L).

rus_name(cow, X):-
  string_to_list(' корова', L),
  name(X,L).

rus_name(catdog, X):-
  string_to_list(' котопёс', L),
  name(X,L).

rus_name(cerberus, X):-
  string_to_list(' цербер', L),
  name(X,L).

rus_name(gorinich, X):-
  string_to_list(' горыныч', L),
  name(X,L).

rus_name(narwhal, X):-
  string_to_list(' нарвал', L),
  name(X,L).

rus_name(sphinx, X):-
  string_to_list(' сфинкс', L),
  name(X,L).

rus_name(kurama, X):-
  string_to_list(' курама', L),
  name(X,L).

rus_name(phoenix, X):-
  string_to_list(' феникс', L),
  name(X,L).

rus_name(pegasus, X):-
  string_to_list(' пегас', L),
  name(X,L).
%-------------------------




%-------------------------
% Мейн

main(X1, X2, X3, X4, X5, X6, X7, X8, X, Picture, Rus) :-
  
  small(X, X1),  domestic(X, X2),
  real(X, X3),   fangs(X, X4),
  hooves(X, X5), water(X, X6),
  wings(X, X7),  bodyparts(X, X8),
  
  picture(X, Picture),
  rus_name(X,Rus).
%-------------------------
  
  