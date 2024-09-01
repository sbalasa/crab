import random

type
  GameState = enum
    Playing, Won, Lost

  Position = tuple
    x, y: int

  Crab = object
    position: Position
    food: int

  Beach = object
    width, height: int
    food: seq[Position]
    dangers: seq[Position]

proc newBeach(width, height: int): Beach =
  result.width = width
  result.height = height
  result.food = @[]
  result.dangers = @[]

  # Place food and dangers randomly
  for _ in 1..5:
    result.food.add((random.rand(width-1), random.rand(height-1)))
    result.dangers.add((random.rand(width-1), random.rand(height-1)))

proc newCrab(): Crab =
  result.position = (0, 0)
  result.food = 0

proc move(crab: var Crab, direction: char, beach: Beach) =
  let (x, y) = crab.position
  case direction
  of 'w': crab.position = (x, max(0, y - 1))
  of 's': crab.position = (x, min(beach.height - 1, y + 1))
  of 'a': crab.position = (max(0, x - 1), y)
  of 'd': crab.position = (min(beach.width - 1, x + 1), y)
  else: discard

proc checkState(crab: var Crab, beach: var Beach): GameState =
  if crab.position in beach.dangers:
    return Lost
  if crab.position in beach.food:
    let index = beach.food.find(crab.position)
    beach.food.delete(index)
    crab.food += 1
    if crab.food >= 3:
      return Won
  return Playing

proc printBeach(beach: Beach, crab: Crab) =
  for y in 0..<beach.height:
    for x in 0..<beach.width:
      if (x, y) == crab.position:
        stdout.write("C ")
      elif (x, y) in beach.food:
        stdout.write("F ")
      elif (x, y) in beach.dangers:
        stdout.write("D ")
      else:
        stdout.write(". ")
    echo ""
  echo "Food collected: ", crab.food

proc main() =
  var
    beach = newBeach(10, 5)
    crab = newCrab()
    gameState = Playing

  while gameState == Playing:
    printBeach(beach, crab)
    stdout.write("Move (w/a/s/d): ")
    let input = stdin.readLine()
    if input.len > 0:
      crab.move(input[0], beach)
      gameState = checkState(crab, beach)

  printBeach(beach, crab)
  if gameState == Won:
    echo "Congratulations! You've collected enough food!"
  else:
    echo "Oh no! You've encountered a danger and lost."

when isMainModule:
  main()
