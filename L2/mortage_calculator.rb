def years_to_months(years)
  return years * 12
end

def apr_to_monthly_interest(apr)
  return apr.to_f / 12
end

def calculate_monthly_payment(amount, monthly_interest, duration_months)
  interest = monthly_interest.to_f / 100
  prep = interest / (1 - (1 + interest)**(-duration_months))
  monthly = amount.to_f * prep
  return monthly
end

puts "How much is the loan amount? "
amount = gets.chomp.to_i

puts "What is the annual interest rate (APR)? e.g. Input 5 if it is 5%"
apr = gets.chomp.to_f
monthly_interest = apr_to_monthly_interest(apr)

puts "What is the loan duration? e.g. Input 4.5 if the loan duration is 4 and a half years "
years = gets.chomp.to_f
months = years_to_months(years)

monthly_payment = calculate_monthly_payment(amount, monthly_interest, months)
puts "Monthly payment: #{monthly_payment}"
puts "Sum of payments: #{monthly_payment * months}"
