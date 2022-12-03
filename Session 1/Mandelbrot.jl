"""
    mandelbrot( c, N )
Computes the number of iterations of the Mandelbrot set equations.
- Input: `c::Number` also used as the initial z.
        `N` is the maximum number of iterations
"""
function mandelbrot( c, N )
    z = c
    z_old = z
    for n in 1:N
        if abs(z) > 2
            return n-1
        end
        z = z_old^2 + c
        z_old = z
    end
    return N
end

"""
    plotMandelbrot( xval::Vector, yval::Vector; N = 100 )
Plots the results of `mandelbrot()` function for the xval and yval value using the `heatmap()` function.

-Input: `xval` is the values for x-components and the real part of `c`.

        `yval` is the values for the y-components and the imaginary part of `c`.
        
        `N` is the number of iterations of the `mandelbrot()` function.

-Output: Plot of the Mandelbrot.

Special case: `plotMandelbrot( val::Vector; N=100 ) = plotMandelbrot( val, val; N )`
"""
function plotMandelbrot( xval::Vector, yval::Vector; N = 100 )
    x = length(xval);
    y = length(yval);
    M = rand(y,x);
    for i in 1:y
        for j in 1:x
            M[i,j] = mandelbrot( xval[i] + yval[j]*im, N )
        end
    end
    heatmap( M, c=:delta, aspect_ratio=1.0, xaxis=nothing, yaxis=nothing )
end
# Special case
plotMandelbrot( val::Vector; N=100 ) = plotMandelbrot( val, val; N )
