def solution(joystick_a, joystick_b)
  return 0 if joystick_a == 1 && joystick_b == 1
  minutes = 0
  while true do
    if joystick_a < joystick_b
      joystick_a += 1
      joystick_b -= 2
    else
      joystick_b += 1
      joystick_a -= 2
    end

    minutes += 1
    return minutes if joystick_a <= 0 || joystick_b <= 0
  end
end

puts solution(*gets.split.map(&:to_i))

# Memoized


@memo = Array.new(210, Array.new(201, false))
# // Recursion con memoria consta casi siempre de 3 pasos.
def solution(joystick_a, joystick_b)
  # // 1. Fijarse si ya lo computaste
  return @memo[joystick_a][joystick_b] if @memo[joystick_a][joystick_b]

  # // 2. Fijarse si es un caso base.
  return 0 if (joystick_a == 0 && joystick_b >= 0) || (joystick_a >= 0 && joystick_b == 0)
  return -1 if joystick_a < 0 || joystick_b < 0

  # // 3. Calcular el valor y guardarlo en la memoria. Llamadas recursivas.
  @memo[joystick_a][joystick_b] = [1 + solution(joystick_a + 1, joystick_b - 2),
                                   1 + solution(joystick_a - 2, joystick_b + 1)].max
  return @memo[joystick_a][joystick_b]
end

puts solution(*gets.split.map(&:to_i))
