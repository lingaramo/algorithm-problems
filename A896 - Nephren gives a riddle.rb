#===================================
#
#Out of memory solution
#===================================

def solution(n, k)
  question = build_question(n)
  if question.size < k
    return "."
  end
  question[k-1]
end

def build_question(n)
  if n == 0
    return "What are you doing at the end of the world? Are you busy? Will you save us?"
  else
    return "What are you doing while sending '#{build_question(n-1)}'? Are you busy? Will you send '#{build_question(n-1)}'?"
  end
end

#===================================
#
#Out of time solution
#===================================

# def solution(n, k)
#   a = "What are you doing at the end of the world? Are you busy? Will you save us?"
#   b = "What are you doing while sending '"
#   c = "'? Are you busy? Will you send '"
#   d = "'?"
#
#   question = build_question(n)
#   sum = 0
#   last_string = a
#   question.each_char do |char|
#     if char == 'a'
#       sum += a.size
#       last_string = a
#     elsif char == 'b'
#       sum += b.size
#       last_string = b
#     elsif char == 'c'
#       sum += c.size
#       last_string = c
#     elsif char == 'd'
#       sum += d.size
#       last_string = d
#     end
#     break if sum >= k
#   end
#   return '.' if sum < k
#
#   last_string[k-sum-1]
# end
#
# def build_question(n)
#   if n == 0
#     return "a"
#   else
#     return "b#{build_question(n-1)}c#{build_question(n-1)}d"
#   end
# end

#===================================
#
#Out of time solution
#===================================
STR0 = "What are you doing at the end of the world? Are you busy? Will you save us?"
STR1 = "What are you doing while sending '"
STR2 = "'? Are you busy? Will you send '"
STR3 = "'?"

def solution(n, k)
  return '.' if question_size(n) < k

  solve(n, k, 0)
end

def solve(n, k, counter)
  qn_1_size = question_size(n-1) if n > 0

  if n == 0
    return STR0[k - counter - 1]
  end

  if counter + STR1.size >= k
    return STR1[k - counter - 1]
  elsif counter + STR1.size + qn_1_size >= k
    solve(n-1, k, counter + STR1.size)
  elsif counter + STR1.size + qn_1_size + STR2.size >= k
    counter = counter + STR1.size + qn_1_size
    return STR2[k - counter - 1]
  elsif counter + STR1.size + qn_1_size + STR2.size + qn_1_size >= k
    counter = counter + STR1.size + qn_1_size + STR2.size
    solve(n-1, k, counter)
  elsif counter + STR1.size + qn_1_size + STR2.size + qn_1_size + STR3.size >= k
    counter = counter + STR1.size + qn_1_size + STR2.size + qn_1_size
    return STR3[k - counter - 1]
  end
end

def question_size(n)
  if n == 0
    return STR0.size
  else
    qn_1_size = question_size(n-1)
    return STR1.size + qn_1_size + STR2.size + qn_1_size + STR3.size
  end
end

#===================================
#
#Inputs
#===================================

q = gets.to_i

output = ""
q.times do
  n, k = gets.strip.split.map { |i| i.to_i }
  output += solution(n, k)
end

puts output
