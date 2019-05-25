#= require ./namespace

class App.Dashboards.Clients.Census extends App.Dashboards.Clients.Base
  _build_chart: () =>
    data =
      x: 'x'
      color: @_colors
      columns: @data
    @chart = bb.generate({
      data: data,
      axis:
        x:
          type: 'category'
          tick:
            culling:
              max: 8
        y:
          tick:
            count: 7
            format: d3.format(",.0f")
          padding: 0
          min: 0
      grid:
        x:
          show: true
          ticks: 4
        y:
          show: true
          ticks: 4
      legend:
        show: false
      size:
        height: 200
      bindto: @chart_selector
    })