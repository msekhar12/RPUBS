prop.table(table(sample(c(-10,-10,-10,0,0,14),100000,replace=T)))

mean(sample(c(-10,-10,-10,0,0,14),100000,replace=T))

#Let us get some sample values
x <- rpois(100000,1)
y <- rpois(100000,2)


var((3*x^2) - y)

mean((x^4) * (y^4))

cov(x,x^2)

var(x^2 * y^2)