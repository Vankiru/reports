class Report
  worksheet 'Contact' do
    data ContactsData

    column do |contact|
      contact.first_name
    end

    column do |contact|
      contact.last_name
    end

    column do |contact|
      contact.email
    end

    column do |contact|
      contact.phone
    end
  end

  worksheet 'Loans' do
    headers true

    column :total_amount, header: 'Loan Amount'
    column :term, header: 'Term'
    column :interest_rate, header: 'Interest Rate'
    column :origination_fee, header: 'Origination Fee'
  end

  worksheet do
    column :A, :total_amount
    column :C, :term
    column :E, :interest_rate
    column :G, :origination_fee
  end

  worksheet do
    range do
    end
  end

  worksheet do
    cell :C8 do |quotation|
      quotation.deal.person&.name
    end

    cell :C11 do |quotation|
    end

    cell :C12 do |quotation|
      vat_number(quotation.deal)
    end

    cell :D6 do |quotation|
      quotation.drive_file_name
    end

    cell :G6 do |quotation|
      quotation.issue_date
    end

    cell :G8 do |quotation|
      quotation.deal.customer_order_code
    end

    cell :G9 do |quotation|
      quotation.deal.created_at.strftime('%d/%m/%Y')
    end

    cell :G11 do |quotation|
      quotation.valid_until
    end

    cell "G#{START_INDEX + 2 + quotation.lots.count}" do |_quation|
      "=SUM(G16:G#{START_INDEX + 1 + quotation.lots.count})"
    end

    cell "G#{START_INDEX + 3 + quotation.lots.count}" do |_quation|
      number_to_percentage(quotation.deal.vat_value)
    end

    cell "E#{START_INDEX + 11 + quotation.lots.count}" do |_quation|
      quotation.payment_terms
    end

    cell "C#{START_INDEX + 12 + quotation.lots.count}" do |_quation|
      advance_payment(quotation)
    end
  end

  worksheet do
    table do
      column do
      end
    end

    table 'C:E' do
      row do
      end
    end

    table 'C:' do
    end

    table ':E' do
    end

    table '3:6' do
    end

    range do
    end
  end

  column :email
  column :email, header: 'Email'

  column 'Email' do
  end

  column 'Start Date' do
  end

  cell :emai
  cell :email, format: :string

  cell format: :string do |data|
    data.email
  end
end
