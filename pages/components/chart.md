---
id: chart
title: Chart
sidebar: sidebar
permalink: chart.html
folder: components
summary: Charts structure how the graph is rendered
---

### Introduction

Charts are created from multiple Components, and are highly customizable. The best way to get acquainted with charts is to create different types of plots.

### Creating a Chart

The following is the constructor for the chart. Now in practice not all of these items need to be individually specified. The example will make this clearer.

 * ```series```: A list of series we wish to plot.
 * ```layout```: This specifies how the chart will be laid out.
 * ```config```: This configures the chart.
 * ```animated```: This specifies whether the chart is animated.
 * ```transition_duration```: If the chart is animated, this specifies the duration between the frames.



### The Chart in Action

As the following example makes  clear, we do not need to specify every single Component that constructs a Chart fully. We can sculpt the Chart specifying options where we need to.

Run the following in a Jupyter notebook.

```scala
interp.repositories() ++= Seq(coursierapi.MavenRepository.of(
    "https://jitpack.io"
))
```

```scala
import $ivy. `org.carbonateresearch::picta:0.1`
import org.carbonateresearch.picta.render.Html.initNotebook
initNotebook()
```

```scala
import org.carbonateresearch.picta._
```

```scala
val x = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)
val y = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)
val z = List.range(0, 100).map(x => scala.util.Random.nextDouble() * 50)

val chart2 = (
    Chart()
    addSeries (XY(x, y).setName("a").drawMarkers)
).plotInline
```

If the above was succesful, you should see something like the following.

![chart](images/components/chart/chart.png)