require 'csv'

desc 'Import csv files into the DB'
task import: :environment do

  Dir.chdir 'accounts'
  Dir.glob('*/').each do |account_number|
    account = Account.find_or_create_by_number account_number.chomp('/')

    Dir.chdir(account_number) do
      Dir.glob('*.csv').each do |csv|
        contents = File.read(csv, :encoding => 'iso-8859-1')
        data = CSV.parse(contents.encode('utf-8'), col_sep: ';', return_headers: false, headers: true)
        data.each do |row|
          transaction = Transaction.parse(row, account, csv)
          transaction.save
        end
      end
    end
  end
end
