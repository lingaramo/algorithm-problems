def solution(costs, questions)
  sorted_costs = costs.sort
  prefix_sorted_costs, prefix_costs = [0], [0]
  for i in 0...costs.size do
    prefix_sorted_costs << prefix_sorted_costs.last + sorted_costs[i]
    prefix_costs << prefix_costs.last + costs[i]
  end

  questions.each do |question|
    if question[0] == 1
      puts prefix_costs[question[2]] - prefix_costs[question[1]-1]
    else
      puts prefix_sorted_costs[question[2]] - prefix_sorted_costs[question[1]-1]
    end
  end
end

_ = gets
costs = gets.split.map(&:to_i)
m = gets.to_i
questions = []
m.times do
  questions << gets.split.map(&:to_i)
end

solution(costs, questions)
