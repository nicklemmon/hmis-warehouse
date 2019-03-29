#= require ./namespace

class App.DataQualityReports.Income extends App.DataQualityReports.Base
  _build_chart: ->
    @chart = bb.generate
      bindto: @chart_selector
      size:
        height: 250
      data:
        json: @data['data'],
        type: "bar",
        color: @_colors,
        onclick: @_follow_link
        types:
          "This Project": "bar",
          "Goal": "line",
      point:
        show: false,
      line:
        classes: [
          'data-quality__target-line'
        ]
      axis:
        x:
          type: "category",
          categories: @data['labels'],
      tooltip:
        format:
          value: (v) ->
            "#{v}%"
  _follow_link: (d, element) =>
    x = @data.labels[d.x]
    suffix = ''
    if x == '20% Increase'
      suffix = ' 20'
    key = d.name + suffix
    url = @support_url + key.toLowerCase().replace(/ /g,"_") + "&layout=false"
    $('.modal').modal('show')
    $('.modal .modal-content').load(url)