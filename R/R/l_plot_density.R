#' @title Loon methods for Kernel Density Estimation
#'
#' @description The loon plot method for \code{density} objects.
#'
#' @inheritParams loon::l_plot
#' @param x a \code{density} object
#' @param y NULL .  This argument is ignored.
#' @param ylabel the graphical parameter ylabel labelling the y axis of the plot. If \code{NULL} (the default), an ylabel is created 
#' based on the combination of data name and "density".
#' @param xlabel the graphical parameter xlabel labelling the x axis of the plot. If \code{NULL} (the default), an xlabel is created 
#' based on the information available from the \code{density} objects.
#' @param title providing a title for the plot. If \code{NULL} (the default), the title will be the call which produced the result.
#' @param linewidth line width, default value is 2.
#' @param color line colour.  If NULL (the default) colour will be taken from \code{l_getOption("foreground")}.
#' @param size points size, default value is 0.5 
#' @param ... named arguments being states passed to l_plot()
#' 
#' @examples
#' ds <- density(faithful$eruptions)
#' p <- l_plot(ds, color = "steelblue")
#'
#' @export

l_plot.density <- function(x, y = NULL, ylabel = NULL, xlabel = NULL, title = NULL, 
                           linewidth = 2, color = NULL, size = 0.5, 
                           ...){
    if (!is.null(y)) warning("value of y argument is ignored")
    density <- x
    if (is.null(color)) color <- l_getOption("foreground")
    if(is.null(ylabel)){ylabel <- paste(density$data.name, "density")}
    if(is.null(xlabel)){xlabel <- paste("N =", density$n, " ", "Bandwidth =", round(density$bw, 3))}
    if(is.null(title)){title <- paste("density of", density$data.name)}
    
    p <- l_plot(title = title, xlabel = xlabel, ylabel = ylabel, ...)
    l <- l_layer.density(p, density, color = color, linewidth = linewidth)
    l_scaleto_world(p)
    p
}
