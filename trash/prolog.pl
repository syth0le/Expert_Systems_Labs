% Код на прологе. Я описал 11 фактов.
% Каждый факт оканчивается точкой ".", как в русском языке, как любое утверждение.
% Комментарии начинаются с "%".
% Интерпретатор пролога игнорирует такие комментарии.
/* А это
многострочный
комментарий
*/

% Факты. 11 штук
study(mark, book). % Марк изучает книгу
study(mark, studentbook). % Марк изучает учебник
study(mark, docs). % Марк изучает доки

see(masha, mouse). % Маша видит мышь
see(masha, book). % Маша видит книгу
see(masha, notebook). % Маша видит тетрадь
see(masha, mark). % Маша видит Марка

study(misha, math). % Миша изучает матешу
study(misha, lp). % Миша изучает пролог
study(misha, docs). % Миша изучает доки
study(misha, studentbook). % Миша изучает учебник

% Это факты
older(sasha, lesha, fact). % Саша старше Лёши
older(misha, sasha, fact). % Миша старше Саши
older(misha, dasha, fact). % Миша старше Даши
older(masha, misha, fact). % Маша старше Миши

% Это правило
older(X,Y, rule) :- older(X, Z, fact), older(Z,Y, _).

% X старше Y, если X старше Z и Z старше Y
% Проще: X > Y, если X > Z и Z > Y
%
% X, Y, Z - это переменные. 
% Вместо X, Y, Z подставляются конкретные значения: misha, dasha, sasha, lesha
% Main idea: если Пролог найдет среднего Z, который между X и Y, то X старше Y.