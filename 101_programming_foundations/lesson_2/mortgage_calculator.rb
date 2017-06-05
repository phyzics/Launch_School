# mortgage_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def valid_integer?(num)
  Integer(num)
rescue ArgumentError
  false
end

def valid_float?(num)
  Float(num)
rescue ArgumentError
  false
end

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

def prompt(message)
  puts "=> #{message}"
end

puts ''
2.times {|time| puts MESSAGES["welcome#{time}"].center(65)}

loop do
  prompt(MESSAGES['loan_amount_1'])
  prompt(MESSAGES['loan_amount_2'])

  loan_amount = ''
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f > 0
      break
    elsif valid_number?(loan_amount) && loan_amount.to_f <= 0
      prompt(MESSAGES['positive_number'])
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['apr_1'])
  prompt(MESSAGES['apr_2'])

  apr = ''
  apr_exist = true
  loop do
    apr = gets.chomp
    if valid_number?(apr) && apr.to_f > 0
      break
    elsif valid_number?(apr) && apr.to_f == 0
      apr_exist = false
      break
    elsif valid_number?(apr) && apr.to_f < 0
      prompt(MESSAGES['non_negative'])
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['years'])

  yearly_duration = ''
  loop do
    yearly_duration = gets.chomp

    if valid_number?(yearly_duration) && yearly_duration.to_f > 0
      break
    elsif valid_number?(yearly_duration) && yearly_duration.to_f <= 0
      prompt(MESSAGES['positive_number'])
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  monthly_duration = yearly_duration.to_f * 12

  if apr_exist == true
    mpr = apr.to_f / 100 / 12 # monthly percentage rate
    monthly_payment = loan_amount.to_f * (mpr /
                                         (1 - (1 + mpr)**-monthly_duration))
  else
    monthly_payment = loan_amount.to_f / monthly_duration
  end

  prompt("#{MESSAGES['monthly_payment']}#{format('%02.2f', monthly_payment)}")

  prompt(MESSAGES['again_1'])
  prompt(MESSAGES['again_2'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['good_bye'])
