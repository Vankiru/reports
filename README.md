# Reports

Library for defining and rendering tabular reports in multiple formats

## The idea

The idead of Reports (working title) is to make generating tabular reports easier.

A report consists of four parts: 
  - structure defines how the report should look like,
  - data defines what data to use,
  - formatter defines styles and formats,
  - renderer renders a report in a particular format.

```ruby
class UserReport < Reports::Report
  worksheet 'Users' do
    data do |params|
      User.where(params)
    end
    
    column :name, header: 'Name'
    column :email, header: 'Email'
    column :phone, header: 'Phone', format: :phone
  end
end

report = UserReport.new

csv = report.render(:csv)
xslx = report.render(:xlsx)
```

## Roadmap

- [x] Introduce and implenet the reports structure.
- [ ] Implement report validation to make sure that its structure, references and formats are valid and do not conflict with each other.
- [ ] Introduce an API for creating and registering a report renderer.
- [ ] Implement a CSV renderer.
- [ ] Implement an Excel renderer.

## Syntax

### Data

Data defines how to fetch data for a report. It can be defined with a block:

```ruby
data do |params|
  User.where(params)
end
```

Or in a separate class

```ruby
data UserData

class UserData
  def call(params)
    User.where(params)
  end
end
```

### Formatter

Formatter defines styles/formats that will be used to render a report. It can be defined with a block:

```ruby
formatter do
  format :currency do |value|
    number_to_currency(value)
  end
end
```

Or in a separate class

```ruby
formatter UserFormatter

class UserFormatter < Reports::Formatter
  format :currency do |value|
    number_to_currency(value)
  end
end
```

### Worksheets

If a report renderer supports worksheets (e.g. Excel), it allows to add multiple worksheets to it.
You can define one table with `columns`, `rows` or `cell`, or multiple tables with `table`.

```ruby
class UserReport < Reports::Report
  worksheet 'Users' do
    column :name, header: 'Name'
    column :email, header: 'Email'
    column :phone, header: 'Phone', format: :phone
  end
end
```

```ruby
class UserReport < Reports::Report
  worksheet 'Users', UserWorksheet
  worksheet 'Logins', LoginWorksheet
end

class UserWorksheet < Reports::Worksheet
  column :name, header: 'Name'
  column :email, header: 'Email'
  column :phone, header: 'Phone', format: :phone
end

class LoginWorksheet < Reports::Worksheet
  column :login
  column :last_login_at
end
```

### Tables

It allows to add tables to a report. Why do we need `table` if we can just use `column`/`rows`? There are cases when 
a report must contain multiple tables with different data and formatting.

```ruby
class UserReport < Reports::Report
  table do
    column :name, header: 'Name'
    column :email, header: 'Email'
    column :phone, header: 'Phone', format: :phone
  end
end
```

```ruby
class UserReport < Reports::Report
  table UserTable
  tabel LoginTable
end

class UserTable < Reports::Table
  column :name, header: 'Name'
  column :email, header: 'Email'
  column :phone, header: 'Phone', format: :phone
end

class LoginTable < Reports::Table
  column :login
  column :last_login_at
end
```

### Columns

Columns allow to define a horizontal table. They can be defined as a one liner:

```ruby
column :name, header: 'Name'
column :email, header: 'Email'
column :phone, header: 'Phone', format: :phone
```

Or with a block:

```ruby
column 'Name' do |user|
  "#{user.first_name} #{user.last_name}"
end
```

Options:

- `header` - the column name.
- `format` - a format that will be applied to the column. For example, `:date`, `:number`.
- `reference` - the column address where data will be rendered. For example, `'A'`, `:B`.

### Rows

Rows allow to define a vertical table. They can be defined as a one liner:

```ruby
row :name, header: 'Name'
row :email, header: 'Email'
row :phone, header: 'Phone', format: :phone
```

Or with a block:

```ruby
row 'Name' do |user|
  "#{user.first_name} #{user.last_name}"
end
```

Options:

- `header` - the column name.
- `format` - a format that will be applied to the column. For example, `:date`, `:number`.
- `reference` - the column address where data will be rendered. For example, `'1'`, `2`.

### Cells

Cells allow to place certain values in a separate cells. They can be defined as a one liner:

```ruby
cell :name
cell :email, reference: 'A2'
cell :phone, reference: 'A3', format: :phone
```

Or with a block:

```ruby
cell do |user|
  "#{user.first_name} #{user.last_name}"
end
```

Options:

- `format` - a format that will be applied to the column. For example, `:date`, `:number`.
- `reference` - the column address where data will be rendered. For example, `'A1'`, `:B3`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
