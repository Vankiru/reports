class Report
  worksheet 'Users' do
    data UserData
    formatter UserFormatter

    formatter do
      format :data do |args|
      end

      format :currency do |args|
      end
    end

    data do |params|
      User.where(params)
    end

    column 'Email', format: :string do |user|
      user.email
    end

    column 'Name' do |user|
      user.name
    end

    column 'Address' do |user|
      user.address
    end

    column 'Date of Birth', format: :date do |user|
      user.birth_date
    end

    column 'Email', :email
    column 'Name', :name
    column 'Address', :address
    column 'Date of Birth', :birth_date, format: :date

    column :email
    column :name
    column :address
    column :birth_date, format: :date

    column :email, header: 'Email'
    column :name, header: 'Name'
    column :address, header: 'address'
    column :birth_date, header: 'Birth Date', format: :date
  end


  worksheet "Contact" do
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

  worksheet "Loans" do
    headers true

    column :total_amount, header: "Loan Amount"
    column :term, header: "Term"
    column :interest_rate, header: "Interest Rate"
    column :origination_fee, header: "Origination Fee"
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

    cell "G#{START_INDEX + 2 + quotation.lots.count}" do |quation|
      "=SUM(G16:G#{START_INDEX + 1 + quotation.lots.count})"
    end

    cell "G#{START_INDEX + 3 + quotation.lots.count}" do |quation|
      number_to_percentage(quotation.deal.vat_value)
    end

    cell "E#{START_INDEX + 11 + quotation.lots.count}" do |quation|
      quotation.payment_terms
    end

    cell "C#{START_INDEX + 12 + quotation.lots.count}" do |quation|
      advance_payment(quotation)
    end
  end

  worksheet do
    table do
      column do
      end
    end

    table "C:E" do
      row do
      end
    end

    table "C:" do
    end

    table ":E" do
    end

    table "3:6" do
    end

    range do
    end
  end
end

class UserData < Report::Data
end

class UserFormatter < Report::Formatter
end
