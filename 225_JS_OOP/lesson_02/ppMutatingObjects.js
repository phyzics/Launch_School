// ppMutatingObjects.js
/* #1
The call to `func()` with the global variable `message` as it's argument will
log 'Hello from the function scope!'. This is because the function parameter
`message` shadows the global variable, and is then reassigned to a new string
primitive on the first line within the function body.

When we call `log` on the `console` object and pass the global variable
`message` as an argument, it will log 'Hello from the global scope!' This is
because we do not mutate the value of message within the previous call to 
`func` since string primitives are immutable

#2
Both `func()` and `log()` will log 'Greetings from the function scope' since
we mutate the `message` property of `myObj` when it is passed as an argument
to `func()`. This demonstrates how objects, unlike primitives, are mutable

#3
'Hello from the function scope!'
'Hello from the function scope!'

This is because since `message` is never declared within `func()`, lexical
scoping resolves it to be the global variable `message`, in which case `func()`
reassigns the variable's value

#4
false
true

First is false because we increment the value of the `a` property by 10, whereas
we never change the value of the global scope `a` variable. Thus since 10 !== 20
it returns false

Second is true because both variables contain a reference to the same object

#5
Because when we set the property of `warthog` to `animal`, we store a reference
to the object. When we then reassign animal after on line 10, the reference to
the original object on line 7 still holds -- we are not mutating animal on line
10, but storing a new reference to a different object!
