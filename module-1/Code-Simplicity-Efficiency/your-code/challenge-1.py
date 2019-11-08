"""
This is a dumb calculator that can add and subtract whole numbers from zero to five.
When you run the code, you are prompted to enter two numbers (in the form of English
word instead of number) and the operator sign (also in the form of English word).
The code will perform the calculation and give the result if your input is what it
expects.

The code is very long and messy. Refactor it according to what you have learned about
code simplicity and efficiency.
"""

input_list = ['zero','one','two','three','four','five']
results = {0:'zero',
           1:'one',
           2:'two',
           3:'three',
           4:'four',
           5:'five',
           6:'six',
           7:'seven',
           8:'eight',
           9:'nine',
           10:'ten'}

print('Welcome to this calculator!')
print('It can add and subtract whole numbers from zero to five')

a = input('Please choose your first number (zero to five):')
b = input('What do you want to do? plus or minus: ')
c = input('Please choose your second number (zero to five): ')

for i in input_list:
    if a == i:
        num1 = input_list.index(i)
    if c == i:
        num2 = input_list.index(i)
        if b == 'plus':
            sum_ = (num1+num2)
            for key in results:
                if sum_ == key:
                    print(results.get(key))
        else:
            subtract = (num1-num2)
            for key in results:
                if subtract == key:
                    print(results.get(key))
                    
if a not in input_list or c not in input_list or b not in ['plus','minus']:
    print("I am not able to answer this question. Check your input.")

print("Thanks for using this calculator, goodbye :)")
