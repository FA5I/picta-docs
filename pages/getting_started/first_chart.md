---
id: first_chart
title: Your First Chart
sidebar: sidebar
permalink: first_chart.html
folder: getting_started
summary: This section will outline how to create your first chart using the Picta library.
---

### Building a Chart

Charts can be built by composing smaller elements together to create bigger ones. 

The main components for building charts are:

1. `Canvas`: This is is the top-level component for representing the display. A `Canvas` may consist of multiple charts.

2. `Chart`: This is the component that corresponds to an actual chart (i.e. scatter, pie etc).

3. `Series`: This is the data series that is plotted on a `Chart`. `Series` come in 3 types:

    - `XY`:   This is series data for constructing a 2D chart
    - `XYZ`:  This is series data for constructing a 3D chart
    - `Map`:  This is series data that constructs a Map chart
    
4. `ChartLayout`: This configures various parts of how the `Chart` is represented on screen.

`Chart` may occassionally also make use of the `Config` component for further configuration. `Config` specifies whether the plot is responsive.

For the code examples that follow, it will be assumed that the reader is working in a Jupyter notebook.

### 1. Loading the Library

The library can be loaded in the notebook using the following commands:

```scala
interp.repositories() ++= Seq(coursierapi.MavenRepository.of(
    "https://jitpack.io"
))
```

```scala
import $ivy. `org.carbonateresearch::picta:0.1`

// required to initialize jupyter notebook mode
import org.carbonateresearch.picta.render.Html.initNotebook 

// stops ugly output
initNotebook() 

import org.carbonateresearch.picta._
```

### 2. Create some dummy data

First we will create some dummy data:

```scala
// lets create some dummy data to use in our examples
val x = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)
val y = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)
```

### 3. Construct the Chart

We are ready to construct the first main component for our chart; the **Series**.

As we are going to plot 2D data, we can use the appropriately named **XY** class:

```scala
// create some dummy data
val x = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)
val y = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)

// create a 2D series
val series = XY(x, y) asType SCATTER drawStyle MARKERS

// create a chart by adding to it a data series. We set the title as 'First Chart'
val chart = Chart() addSeries series setTitle "First Chart"

// if we have a single chart, then we do not need to use the Canvas and can simply call chart.plot
chart.plotInline
```

### 4. Admire the Result

Your chart should like something below:

![first_chart](images/first_chart/first_chart.png)

Congratulations! You have created your first chart using Picta.