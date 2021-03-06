require 'erb'
require 'terminal-table'

namespace :qmeter do
  desc "Run Qmeter"
  task :run do
		extend Qmeter
		self.generate_final_report
    puts "======= Saving Current Analysis Details ======="
    self.save_report
    
    rows = []
    rows << ['Security Warning', @warnings_count]
    rows << ['Flog', @flog_average_complexity]
    rows << ['Stats', @stats_code_to_test_ratio]
    rows << ['Rails Best Practices', @rails_best_practices_total]
    table = Terminal::Table.new :title => "Qmeter Analysis", :headings => ['Type', 'Number'], :rows => rows, :style => {:width => 80}
    puts table
    puts "======= Please visit localhost:3000/qmeter for detailed report ======="
  end
end
