class ChartController < ApplicationController
  def index
    categories = []
    sent = []
    received = []
    total = []

    #@start_at = NetworkDatum.first[:day]
    #@end_at = NetworkDatum.last[:day]
    #@categories = @start_at.upto(@end_at).to_a

    NetworkDatum.order("day").all.each do |nd|
      categories << nd[:day]
      sent << nd[:sent]
      received << nd[:received]
      total << nd[:sent] + nd[:received]
    end

    @h = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(type: 'line')
      f.title(text: "Cellular Network Data")
      f.xAxis(categories: categories)
      f.yAxis(title: "", min: 0)
      f.series(name: 'Received', data: received)
      f.series(name: 'Sent', data: sent)
      f.series(name: 'Total', data: total)
    end
  end
end
