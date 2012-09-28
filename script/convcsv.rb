# db/original.csv -> db/sample.csv
require 'csv'
require 'date'

COL_DAY = 0
COL_SENT = 1
COL_RECEIVED = 2

CSV.open('db/sample.csv', 'wb') do |csv|
  i = -1
  CSV.foreach('db/original.csv') do |row|
    i += 1
    next if i == 0
    break unless row[COL_SENT]
    d = Date.today.to_s
    csv << [i.to_s, row[COL_DAY], row[COL_SENT], row[COL_RECEIVED], d, d]
  end
end

