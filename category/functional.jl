using Base: @pure
foldr(+, 0:4)
map(+, 1:4)
filter(>=(3), 1:4)

@pure f(x) = x

# currying
g(a,b,c) = a + b + c

(>>)(x, ƒ) = (args...) -> ƒ(x, args...)

(2 >> (3 >> g))(5)

double = 2 >> *
double(5)
