% Факты о аптеках
pharmacy('Столички', 'ул. Пушкина, 10', '8-800-555-35-35').
pharmacy('Аптека+', 'ул. Лермонтова, 5', '8-800-555-25-25').

% Факты о лекарствах
medicine('Аспирин', 50, 10, 'Столички').
medicine('Анальгин', 30, 5, 'Аптека+').
medicine('Нигденеболин', 100, 3, 'Аптека+').
medicine('Головапроходин', 150, 7, 'Аптека+').

% Правило для поиска аптеки по названию
find_pharmacy(Name, Address, Phone) :-
    pharmacy(Name, Address, Phone).


% Правило для поиска лекарства по названию
find_medicine(Name, Price, Count, Pharmacy) :-
    medicine(Name, Price, Count, Pharmacy).

% Правило для поиска доступных лекарств в аптеке
find_available_medicines(Pharmacy) :-
    findall(Name, medicine(Name, _, Count, Pharmacy), MedicineList),
    write('Доступные лекарства в аптеке '), write(Pharmacy), write(': '), write(MedicineList), nl.

% Правило для поиска аптеки с самым дешевым лекарством
find_cheapest_pharmacy(Name, Address, Phone) :-
    medicine(Name, Price, _, Pharmacy),
    \+ (medicine(_, Price2, _, Pharmacy), Price2 < Price),
    pharmacy(Pharmacy, Address, Phone),
    write('Аптека с самым дешевым лекарством '), write(Name), write(': '), write(Pharmacy), write(', Адрес: '), write(Address), nl.
