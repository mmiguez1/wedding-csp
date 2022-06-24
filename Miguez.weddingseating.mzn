%Wedding Problem
include "globals.mzn";
include "alldifferent.mzn";


% VARIABLES ----------------------------------------------------------
int: Evaluation;
int: PrefWeight;
set of int: Trouble;

int: nGroups;
set of int: GROUPS = 1..nGroups;
array[GROUPS] of set of int: Groups;

int: nGuests;
set of int: GUESTS = 1..nGuests; 

int: nTables;  
set of int: TABLES = 1..nTables; 

int: nSeats;
set of int: SEATS = 1..nSeats;

array[TABLES] of var set of GUESTS: AtTable;

array[GUESTS] of var TABLES: GuestAt;

array[GUESTS] of set of int: Pref;


% CONSTRAINTS ---------------------------------------------------------

% (GuestAt[i] = j) ↔ (i in AtTable[j])
constraint int_set_channel(GuestAt, AtTable);

% Guest assigned to only one table
constraint all_disjoint(AtTable);

% Every table must have at least Floor(nSeats/2) guests
constraint forall (k in TABLES) (card(AtTable[k]) >= floor(nSeats/2));

% No table has more guests than seats
constraint forall (k in TABLES) (card(AtTable[k]) <= nSeats);

% Everyone in the set Trouble must be seated at different tables
constraint alldifferent(t in Trouble)(AtTable[t]);

% Every guest must sit in their group
constraint forall(g in GROUPS)(all_equal([GuestAt[p] | p in Groups[g]]));


% SYMMETRY BREAKING ---------------------------------------------------

% Order table seating by group order
constraint forall (g in GROUPS) (Groups[g] subset AtTable[g]);


% SOLVE ---------------------------------------------------------------

var int: util = sum (i in GUESTS) (card(Pref[i] intersect AtTable[GuestAt[i]]) * PrefWeight);

var int: egal = min (i in GUESTS) (card(Pref[i] intersect AtTable[GuestAt[i]]) * PrefWeight);

solve maximize (if Evaluation == 0 then util else egal endif);


% OUTPUT --------------------------------------------------------------
output ["Table: Guests: " ++ "\n"]; 
output ["   " ++ show(i) ++ " : " ++ show(AtTable[i]) ++ "\n" | i in TABLES ];
output ["Utilitarian Happiness: " ++ show(util) ++ "\nEgalitarian Happiness: " ++ show(egal) ];

