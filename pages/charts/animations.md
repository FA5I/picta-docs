---
id: animations
title: Animations
sidebar: sidebar
permalink: animations.html
folder: charts
summary: All plots can be animated as a sequence of frames
---

### Introduction

In Picta plots can be animated as a sequence of frames. In order to do this we pass in a list of series frames to the ```Chart``` component, then set ```animated=true``` in the ```Canvas``` component.

### An Example: Constructing an 2D Animated Chart

#### Imports

```scala
interp.repositories() ++= Seq(coursierapi.MavenRepository.of(
    "https://jitpack.io"
))
```

```scala
import $ivy. `org.carbonateresearch::picta:0.1`

import org.carbonateresearch.picta.render.Html.initNotebook

initNotebook()

import org.carbonateresearch.picta._

import org.carbonateresearch.picta.options.ColorOptions._
```

#### 2D Animated Chart

```scala
// creates random XY for testing purposes
def createXYSeries[T: Color]
(numberToCreate: Int, count: Int = 0, length: Int = 10): List[XY[Int, Double, T, T]] = {
    if (count == numberToCreate) Nil
    else {
      val xs = List.range(0, length)
      val ys = xs.map(x => scala.util.Random.nextDouble() * x)
      val series = XY(x = xs, y = ys, name = "series " + count).drawMarkers
      series :: createXYSeries(numberToCreate, count + 1, length)
    }
}
```

```scala
val xaxis = XAxis(title = "X Variable") setRange (0.0, 10.0)
val yaxis = YAxis(title = "Y Variable") setRange (0.0, 10.0)

// we can also specifiy the underlying layout directly - sometimes this can be useful
val layout = ChartLayout("Animation XY") setAxes(xaxis, yaxis)

val series = createXYSeries(numberToCreate = 50, length = 30)

val chart = Chart(animated = true, transition_duration=100) setChartLayout layout addSeries series

chart.plotInline
```

#### 3D Animated Chart

```scala
def createXYZSeries(numberToCreate: Int, count: Int = 0, length: Int = 10): List[XYZ[Int, Double, Double]] = {
    if (count == numberToCreate) Nil
    else {
      val xs = List.range(0, length)
      val ys = xs.map(x => scala.util.Random.nextDouble() * x)
      val zs = xs.map(x => scala.util.Random.nextDouble() * x * scala.util.Random.nextInt())
      val series = XYZ(x = xs, y = ys, z = zs, name = "series " + count, `type` = SCATTER3D).drawMarkers
      series :: createXYZSeries(numberToCreate, count + 1, length)
    }
}
```

```scala
val series = createXYZSeries(numberToCreate = 10, length = 100)

val layout = ChartLayout()

val chart = Chart(animated = true) setTitle "Animation 3D" addSeries series 

chart.plotInline
```
