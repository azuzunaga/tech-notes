# Linear Algebra
Symbols:
```
⎡⎤
⎢⎥
⎣⎦
⋅
```
## Lecture 1
### Suggested Reading
+ Read Section 1.1, 1.2, and 2.1 in the 4th or 5th edition.

Linear equations can be solved in three ways:
+ Row method
+ Column method
+ Matrix method

Matrices can be represented as `Ax = b`

Linear equations:
```
    3y =  6
x -  y = -1
```
can be represented as matrices like this:
```
⎡0⎤⋅x + ⎡ 3⎤⋅y = ⎡ 6⎤
⎣1⎦     ⎣-1⎦     ⎣-1⎦

      Ax       =   b
```

If we want to multiply a matrix by a vector,
```
⎡2 5⎤⋅⎡1⎤
⎣1 3⎦ ⎣2⎦
```
it is helpful to think about it this way:
```
⎡2⎤⋅1 + ⎡5⎤⋅2 = ⎡2 + 10⎤ = ⎡12⎤
⎣1⎦     ⎣3⎦     ⎣1 +  6⎦   ⎣ 7⎦
```

### Row method
Plot equations on coordinate plane. With two unknowns (two dimensions) the solution is the intersection of the lines. With three unknowns, the solution is the intersection of the three planes (each equation with three variables represents a plane).

As the number of unknowns or variables increases, plotting them becomes more and more difficult, so the row method is helpful to understand what is going on with easy examples, but not actually useful when trying to solve complicated equations with multiple variables.

### Column method
Express the equations in matrix notation, and from there try to find the coefficients that solve the system.
