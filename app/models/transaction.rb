class Transaction < ActiveRecord::Base
  belongs_to :account
  class Parser
    def initialize(row)
      @row = row
    end

    def date
      Time.strptime @row[2], '%d.%m.%Y'
    rescue
      Time.now
    end

    def kind
      @row[3]
    end

    def use
      @row[4]
    end

    def partner
      @row[5]
    end

    def account
      @row[6]
    end

    def blz
      @row[7]
    end

    def amount
      @row[8].gsub(',','.').to_f
    end

    def infos
      @row[10]
    end

    def text
      [kind, use, partner, infos].join(', ')
    end
  end

  def self.parse(row, account, filename)
    parser = Parser.new(row)
    new(
      date: parser.date,
      kind: parser.kind,
      use: parser.use,
      partner: parser.partner,
      infos: parser.infos,
      amount: parser.amount,
      identifier: (row.to_csv + account.id.to_s + filename).hash,
      account_id: account.id
    )
  end

  def self.kinds
   Transaction.pluck(:kind).uniq
  end

  def self.interesting_kinds
   kinds - ['ABSCHLUSS', 'ENTGELTABSCHLUSS', 'BAR KASSE', 'AUTOM.KARTENENTGELTBUCHUNG', 'AUFWENDUNGSERSATZ', 'AUSLANDSUEBERWEISUNG', 'LOHN/GEHALT', 'UEBERWEISUNGSGUTSCHRIFT', 'GUTSCHRIFT']
  end

  def self.compulsory_kinds
    ['SONSTIGER EINZUG', 'LASTSCHRIFT','DAUERAUFTRAG', ' EINZUG RATE/ANNUITAET', 'SONST.LASTSCHRIFT']
  end

  def text
    [kind, use, partner, infos].join(', ')
  end
end
