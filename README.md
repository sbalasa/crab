# crab
Crab Game in Nim

## To Run
```shell
nim c -r main.nim
```

## How to play
The game controls for our crab game are straightforward and based on the classic WASD movement scheme:

1. 'W' - Move Up: Pressing 'w' and Enter will move the crab one space up on the beach grid.
2. 'A' - Move Left: Pressing 'a' and Enter will move the crab one space to the left.
3. 'S' - Move Down: Pressing 's' and Enter will move the crab one space down.
4. 'D' - Move Right: Pressing 'd' and Enter will move the crab one space to the right.

Here's how to use these controls:

1. When it's your turn to move, you'll see the prompt: "Move (w/a/s/d): "
2. Type one of the letters (w, a, s, or d) and press Enter.
3. The crab will move one space in the corresponding direction.

Important notes about movement:

- The crab cannot move off the edge of the beach. If you try to move in a direction that would take you off the grid, the crab will stay in its current position.
- You can only move one space at a time.
- After each move, the game will update the beach display, showing your new position and any changes (like collected food).
- The game continues until you either win (by collecting 3 food items) or lose (by moving onto a danger).

Remember:
- 'C' represents your crab on the beach grid.
- 'F' represents food items you need to collect.
- 'D' represents dangers you need to avoid.

## Grid preview
```nim
Move (w/a/s/d): d
. . F . . . . . . . 
. . . D . . D . F . 
. . . . . . . . . . 
D . . . D . . . . . 
. . . . . . . C . . 
Food collected: 3
```
