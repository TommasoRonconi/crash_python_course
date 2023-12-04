# Exercise 4 - Classes

This last exercise wraps up everything we have discussed up to now. It is recommended to solve this after having addressed all the points of [Exercise 3](../exercise3_pythonbasics).

We have seen basic built-in types and containers and, in particular, numbers and how they are stored in memory through python.

We now want to create our custom type.

In particular, we want to create a new type for handling [**RATIONAL NUMBERS**](https://en.wikipedia.org/wiki/Rational_number) and we want to make it the more pythonic as possible.

## Deliverable

You will have to produce a Python module or Package, something that can be imported from another python program.
Conceptually, this could be simply hosted in a module, but if you are using other functions to do the computations that are not part of the class itself (i.e. the functions developed in the previous exercise and wrapped in a module as suggested on the bonus point), it might make sense to build a package.

* You must give me some explanation of what is going on and of your choices, so, write a report describing the solution.
  - Ideally you will create a sub-directory: ``exercise4_classes/solution/``
  - inside the sub-directory you will write a ``readme.md`` so that I can check it directly in your github forked repository

* The class you are going to write will have to have the following characteristics
  - a constructor (``__init__``) taking
    - a positional argument for the number to convert into a rational number
    - a keyword argument to set the required precision of the approximation, this should have a default value of precision so that the class can be instantiated without providing any other input argument than the number to convert
  - obviously, `precision` should be $0 \le \text{precision} \le 1$, check for this and print an error message if the criterion is not reached. 
  - store internally the numerator and denominator representing the rational number (``self.numerator`` and ``self.denominator``)
  - overload of ``__str__`` and ``__repr__``:
    e.g. if the rational number is 0.5, encoded with precision $10^{-5}$, the two strings should be something like ``'1/2'`` and ``'rational( 0.5, precision=1.e-5)'``, respectively.
  - overload of the arithmetic dundler functions (e.g. ``__add__``, ``__mul__``, ...)
  - overload of the comparison operators (e.g. ``__eq__``, ``__gt__``, ...)

* The class should perform a consistent casting of the rational number into integers and floats, i.e. it should overload the dundler functions ``__int__`` and ``__float__``

* A fraction is said to be in its reduced or simplified form when the numerator and denominator have no common factors other than 1. In other words, the fraction is expressed in its simplest form, and both the numerator and denominator cannot be further divided by any common divisor. Simplify your rational number's representation!

### Optional:

If the ratio representing a rational number has been reduced to prime factors, rational numbers are univoquely represented in memory.
This means that, if we implement it correctly, our new type can be made **HASHABLE**, i.e., numbers of rational type can be used as keys in dictionaries and as elements in sets.
To achieve this, overload the dundler method ``__hash__``.

## Hints:

The structure of the class should look something like this

```python
class rational () :
    """Documentation of the class
    """
    def __init__ ( self, num, precision = 1.e-5 ) :
        pass
    def __str__ ( self ) :
    	pass
    def __repr__ ( self ) :
    	pass
    def __add__ ( self ) :
    	pass
    # [ ... ] overload all the arithmetic operators
    def __eq__ ( self ) :
    	pass
    # [ ... ] overload all the comparison operators

    ####################################################
    # Optional functions:
    
    def __hash__ ( self ) :
    	pass
    def to_integer_low ( self ) :
    	"""Documentation of function `to_integer_low`"""
    	pass
    def to_integer_upp ( self ) :
    	"""Documentation of function `to_integer_upp`"""
    	pass
```

* In order to simplify the fraction representing your rational number, you can start from the solution of Ex.3.5, by applying the primes decomposition you will then check numerator and denominator for commont elements and erase them.

* Note that you will have to design an **approximation algorithm** for all those numbers that are not perfectly rational within the precision required.

### Approximation algorithm: Continued Fractions

Of course you can easily reach the required precision by dividing the input number by the precision required, but are you sure this will be efficient? And most notably, if you implement this method you will have to work with very large numbers (depending on the precision required). This might make the simplification of the fraction unfeasible or very time consuming.
  A better method would be to implement [**CONTINUED FRACTIONS**](https://en.wikipedia.org/wiki/Continued_fraction#Best_rational_approximations):
  1. Initialisation of variables:
     * Let $x$ be the real number you want to approximate
     * Set $a_0 = \floor{x} (the floor function gives the greatest integer less than or equal to $x$)
     * Let $x_1 = x - a_0$
  2. Generate continued fractions by iterating the following steps until the required precision (e.g. $p=10^{-5}$) is not met:
     * Let $a_i$ be the floor of $1/x_i$
     * update $x_{i+1} = \dfrac{1}{x_i} - a_i$
     * check that $|\dfrac{n_i}{d_i}-x|>p$ if not, stop the iterations.
       ($n_i$ and $d_i$ are the numerator and denominator of the approximate fraction at step $i$)
  3. Return result as a tuple of numerator and denominator

  **Note that**
  * $n_0 = 1$ and $n_1 = a_0$
  * $d_0 = 0$ and $d_1 = 1$
  * $n_i = a_i \cdot n_{i-1} + n_{i-2}$
  * $d_i = a_i \cdot d_{i-1} + d_{i-2}$
  
