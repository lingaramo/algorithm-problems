def solution(boys, boys_skill, girls, girls_skill)
  boys_skill.sort!
  girls_skill.sort!
  i, j = 0, 0

  couples = 0
  while i < boys && j < girls do
    if (boys_skill[i] - girls_skill[j]).abs <= 1
      couples += 1
      i += 1
      j += 1
    else
      if boys_skill[i] > girls_skill[j]
        j += 1
      else
        i += 1
      end
    end
  end
  couples
end
#
# boys = 4
# boys_skill = [1, 4, 6, 2]
# girls = 5
# girls_skill = [5,1,5,7,9]

boys = gets.to_i
boys_skill = gets.split.map(&:to_i)
girls = gets.to_i
girls_skill = gets.split.map(&:to_i)


solution(boys, boys_skill, girls, girls_skill)
