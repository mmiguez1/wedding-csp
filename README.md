# Wedding Constraint Satisfaction Problem Tutorial
In this project tutorial, I use [MiniZinc](https://www.minizinc.org/) to solve a wedding constraint satisfaction problem to determine the seating arrangements of guests at the wedding reception. 
      
## The Problem
In this problem, there are nGuests attending the wedding that must be seated at nTables, where each table can seat at most nSeats guests. We are also given a list Groups of size nGroups which tells us which people must be seated together. We are additionally given a list Pref of length nGuests which tells us which people a guest would prefer to sit with. We use an arbitrary, integer utility measure PrefWeight which tells us how much happiness each guest derives from sitting next to their preferred guests. The bride's mom has also given us a set of guests who all must sit at different tables, otherwise they would get too drunk and cause problems.
       
## The Constraints
We want to find a mapping of guests to tables such that:
      
-No table has more people at it than nSeats.      
-Every table must have at least Floor(nSeats/2) people at it.      
-Every person must be seated with their group.      
-Everyone in the set Trouble must be seated at different tables.      
        
## Measures of Utility
In this tutorial, I investigate two measures of utility: the Utilitarian Social Welfare Function (the sum of utilities of all the individuals) and the Egalitarian Social Welfare Function (the utility of the worst off guest). 
      
## To read the tutorial, click here!
