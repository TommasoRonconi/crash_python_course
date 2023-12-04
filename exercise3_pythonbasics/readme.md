# Exercise 3 - Basics of Python programming

The following small assignments are meant to teach you how to decompose a problem into smaller sub-problems and therefore how to design an effective algorithm that, with the tools we have seen during lectures, can be implemented into a working Python program.

All the functions should be documented with docstrings. Try to make them re-usable.

> Do **NOT** over-document your programs, there is a golden balance between an un-documented code and an over-documented program.

Remember that this

```python
# File: ex3.0_solution.py

# [ solution of exercise written in the top-level scope ]
```

is an acceptable solution to the exercise, but this

```python
# File: ex3.0_solution.py

def solution ( ... ) :
    """Documentation of the solution function
    """
    # [ solution of exercise wrapped in a function ]
    return some_value

if __name__ == '__main__' :
   # 1. Problem set-up
   # 2. call to function `solution`
   # 3. eventually make some tests
```

it's the **professional** way of doing it as it fosters
* re-usability
* readability
* pythonicity

And is nothing less than what I do expect from you ;P

## Exercise 3.1

* Write a program that reads an integer given as input from the user and determines whether it is divisible by 2, 3, 5, or 7.
* Encapsulate the check into a function taking as input two numbers, and write a program that asks the user to insert two numbers and checks whether the first is divisible by the other one (and vice-versa).

### Hints:

* remember the **modulo-operator** ``%``

## Exercise 3.2

* Define a function that returns the Fibonacci sequence up to the n-th term.

```python
def fibonacci (n) :
    """A function that calculates the Fibonacci sequence up to the n-th term

    Parameters
    ----------
    n : int 
        the n-th term of the sequence

    Returns
    -------
    : list
        a list with the Fibonacci sequence
    """
```
* Test the function with a `main` program, filling a `list` with the elements of the sequence.
* Create a new list containing only the elements with even index in the `list`.  
* Create a new list containing only the elements with odd index in the `list`.

### Hints:

* Before actually starting to write the program script, try different possible strategies by testing them in a Jupyter Notebook:
  - use a `while` loop that stores the elements of the sequence in a list either testing directly (i.e. ``while current < n :``) of by testing within the while-loop scope (i.e. ``if current > n: break``)
  - use a for-loop and store in a dictionary where ``key`` is the index of each element and ``value`` is the actual value: remember that ``fibonacci_dictionary.keys()`` returns all the keys and ``fibonacci_dictionary.values()`` returns all the values, these returned iterables can be casted to whatever container by calling the relevant constructor (i.e. ``set()``, ``tuple()``, ``list()``)

* I would organize the file something like this:

```python
"""File: ex3.2_solution.py
"""

def fibonacci( n ) :
    # ...
    return ret_list

def _test1 ( ... ) :
    # ...

def _test2 ( ... ) :
    # ...

if __name__ == '__main__' :
   # 1. eventually set-up the tests
   # 2. call the tests:
   _test1()
   _test2()
   # 3. eventually finalize the program
```

* **NOTE** that in python there is not a way to make some variable or function _private_: conceptually private functions and variables are typically marked by naming them with an underscore at the beginning, e.g. ``_test1``

## Exercise 3.4

* Write a python program that finds the list of prime integer numbers smaller than 100, starting by knowing that 2 is a prime number

### Hints:

* Remember that on ``set``s values are not repeated and that with them you can test
  - inclusion
  - intersections
  - unions
* there is a naive solution which is fine, but there are smart solutions which are better, faster and more elegant, check out the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes): finding smart algorithms and designing smart ways of implementing them is what makes a programmer. A programming language is just syntax and rules.

## Exercise 3.5

* Write a python program that finds the decomposition in prime factors of a positive integer number, implementing the algorithm in a function encapsulated in a python module
* Write a test function, in the library, that checks the correctness of the procedure for all numbers from 1 to 100  

### Hints:

* If you have completed the previous assignments, completing the first point should not take much more time than just combining the functions you have already written.
* once again, the testing is better done with the now usual ``if __name__ == '__main__' :`` strategy

## Exercise 3.6 (Bonus):

If you make a module or a package out of the above solutions, solving the last exercise will be easier.

> This is not really an exercise as if you have done the above correctly it should be already done.
> You can also avoid testing everything and just make a simple module with just a couple of safe-checks in the ``if __name__ == '__main__':`` control scope.
