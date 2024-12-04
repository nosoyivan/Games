

# Plan

game manager will control the turn base, it is a global singleton

## GameManager.gd
GM will instance:
- Player
- Map
- Enemies

GM Vars:
- Player.HP
- Player


Sequence:
Move > Attack > End


Single square hit Ray = 16


Slime 64 480
Goblin 80 480

---






[X0][X1][Y2][Y3][Y4][Y5][Y6][Y7][Z8][Z9]
[X0][X1][X2][Y3][Y4][Y5][Y6][Z7][Z8][Z9]
[X0][X1][X2][X3][Y4][Y5][z6][Z7][Z8][Z9]
[X0][X1][X2][X3][X4][Z5][Z6][Z7][Z8][Z9]


 
octile astar movement