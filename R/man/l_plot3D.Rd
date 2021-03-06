% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/l_plot3D.R
\name{l_plot3D}
\alias{l_plot3D}
\title{Create an interactive loon 3d plot widget}
\usage{
l_plot3D(x, y, z, ...)
}
\arguments{
\item{x}{the coordinates of points in the plot. Alternatively, a
      single plotting structure, function or \emph{any \R object with a
        \code{plot} method} can be provided.}

\item{y}{the y coordinates of points in the plot, \emph{optional}
    if \code{x} is an appropriate structure.}

\item{z}{the z coordinates of points in the plot, optional if x is an appropriate structure.}

\item{...}{named arguments to modify plot states}
}
\value{
widget handle
}
\description{
\code{l_plot3D} is a generic function for creating interactive
  visualization environments for \R objects.
}
\details{
\ifelse{html}{
\out{<div style="background: #dff0d8; padding: 15px;"> To get started with loon it is recommended to read loons website
  which can be accessed via the <code>l_help()</code> function call. </div>
}}{
To get started with loon it is recommended to read loons website
  which can be accessed via the \code{l_help()} function call.
}


  \if{html}{ The general direct manipulation and interaction gestures are
  outlined in the following figures.

  Rotating

  Press 'R' to toggle rotation mode.
  When rotation mode is active, either use the below mouse gestures or arrow keys to rotate the plot.

  \figure{gestures_rotate.png}{options: alt="Rotate gestures"}

  The centre of the rotation can be changed by panning the plot.
  To reset the rotation, use the tripod icon in the plot inspector.

  Zooming and Panning

  \figure{gestures_zoom_pan.png}{options: alt="Zoom pan gestures"}

  Selecting Points/Objects

  \figure{gestures_select.png}{options: alt="Select gestures"}

  Moving Points on the Scatterplot Display

  \figure{gestures_move.png}{options: alt="Move gestures"}

  }

  NOTE: Although it is possible to programmatically add layers to an l_plot3D, these will not
  appear as part of the 3D plot's display. There is no provision at present to incorporate
  rotation of 3D geometric objects other than point glyphs.
}
\examples{

with(quakes,
     l_plot3D(long, lat, depth, linkingGroup = "quakes")
)


with(l_scale3D(quakes),
     l_plot3D(long, lat, depth, linkingGroup = "quakes")
)

scaled_quakes <- l_scale3D(quakes)
with(scaled_quakes,
          l_plot3D(long, lat, depth, linkingGroup = "quakes")
)

with(scaled_quakes,
     l_plot3D(mag, stations, depth, linkingGroup = "quakes")
)

# Or together:
with(scaled_quakes,{
     l_plot3D(long, lat, depth, linkingGroup = "quakes")
     l_plot3D(mag, stations, depth, linkingGroup = "quakes")
     }
)


# Get an R (grid) graphics plot of a loon plot
p <- with(scaled_quakes,
          l_plot3D(long, lat, depth, linkingGroup = "quakes"))
plot(p)
# or with more control about grid parameters
grid.loon(p)
# or to save the grid data structure (grob) for later use
pg <- loonGrob(p)

# Use with other tk widgets
tt <- tktoplevel()
p1 <- l_plot3D(parent=tt, x=c(1,2,3), y=c(3,2,1), z=c(1,2,3))
p2 <- l_plot3D(parent=tt, x=c(4,3,1), y=c(6,8,4), z=c(3,2,1))

tkgrid(p1, row=0, column=0, sticky="nesw")
tkgrid(p2, row=0, column=1, sticky="nesw")
tkgrid.columnconfigure(tt, 0, weight=1)
tkgrid.columnconfigure(tt, 1, weight=1)
tkgrid.rowconfigure(tt, 0, weight=1)

tktitle(tt) <- "Loon plots with custom layout"
}
\seealso{
\code{\link{l_info_states}}
}
