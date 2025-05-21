Here’s a comprehensive `README.md` for your **Affiliate Marketing Platform** built with **Rails 8, Hotwire, TailwindCSS, and PostgreSQL**. It includes setup instructions, architecture overview, features, tech stack, and contribution guidelines.

---

```markdown
# 🎯 Affiliate Marketing Platform

A full-stack **Affiliate Marketing Platform** built with **Ruby on Rails 8**, **Hotwire**, **TailwindCSS**, and **PostgreSQL**. It allows **Traders** to generate products and links, and **Affiliates** to promote those links for **commission-based earnings**. An **Admin** oversees the system, user accounts, and payouts.

---

## 🚀 Features

### ✅ User Roles
- **Trader**: Creates products, tracks link performance, views orders.
- **Affiliate**: Shares links, earns commissions, tracks conversions, requests withdrawals.
- **Admin**: Manages users, oversees commissions, withdrawal requests, and system-wide stats.

### ✅ Functionalities
- Secure User Authentication (Devise)
- Product & Order Management
- Unique Affiliate Link Generation
- Real-Time Click & Conversion Tracking
- Commission Calculation
- Withdrawal Requests & Admin Approvals
- Role-based Dashboards
- Turbo Streams for Live UI Updates
- Responsive TailwindCSS Design

---

## 🛠️ Tech Stack

| Layer       | Technology                      |
|-------------|----------------------------------|
| Backend     | Ruby on Rails 8                  |
| Frontend    | Hotwire (Turbo + Stimulus)       |
| Styling     | TailwindCSS                      |
| Database    | PostgreSQL                       |
| Auth        | Devise                           |
| Charts      | Chartkick + Groupdate (optional) |
| Deployment  | Heroku / Render / Fly.io         |

---

## 📦 Project Structure

```

app/
├── controllers/
│   ├── traders/
│   ├── affiliates/
│   └── admin/
├── models/
│   ├── user.rb
│   ├── product.rb
│   ├── affiliate\_link.rb
│   ├── order.rb
│   ├── commission.rb
│   └── withdrawal\_request.rb
├── views/
│   ├── traders/dashboards/
│   ├── affiliates/dashboards/
│   └── admin/dashboards/
└── javascript/controllers/ (Stimulus)

````

---

## 🧪 Local Setup

### 1. Clone the repo
```bash
git clone https://github.com/yourusername/affiliate_platform.git
cd affiliate_platform
````

### 2. Install dependencies

```bash
bundle install
yarn install --check-files # if using jsbundling
```

### 3. Database setup

```bash
rails db:create db:migrate db:seed
```

### 4. Start the server

```bash
bin/dev
```

Visit: `http://localhost:3000`

---

## 👥 User Roles & Access

| Role      | Dashboard URL           | Capabilities                        |
| --------- | ----------------------- | ----------------------------------- |
| Trader    | `/traders/dashboard`    | Manage products, track orders/links |
| Affiliate | `/affiliates/dashboard` | Share links, track earnings         |
| Admin     | `/admin/dashboard`      | Global insights, manage users       |

Roles are set via `User#role` enum: `:trader`, `:affiliate`, `:admin`.

---

## 🧱 Key Models

| Model               | Description                                           |
| ------------------- | ----------------------------------------------------- |
| `User`              | Base user with enum role                              |
| `Product`           | Created by traders                                    |
| `AffiliateLink`     | Generated per product per affiliate with unique token |
| `Order`             | Created when a product is purchased                   |
| `Commission`        | Assigned to affiliate per conversion                  |
| `WithdrawalRequest` | Affiliates request payouts from commissions           |

---

## 🔒 Authentication

Handled with **Devise**. Run this to set up:

```bash
rails generate devise:install
rails generate devise User
```

After login, users are redirected based on role:

```ruby
def after_sign_in_path_for(resource)
  case resource.role
  when "trader"
    traders_dashboard_path
  when "affiliate"
    affiliates_dashboard_path
  when "admin"
    admin_dashboard_path
  else
    root_path
  end
end
```

---

## ⚙️ Stimulus Controllers

Stimulus enhances interactivity (e.g., chart refreshes, turbo navigation reloads). All controllers live under:

```bash
app/javascript/controllers/
```

---

## 📊 Charts & Analytics (Optional)

Install Chartkick & Groupdate:

```bash
bundle add chartkick groupdate
```

Then use in your views:

```erb
<%= line_chart current_user.orders.group_by_day(:created_at).count %>
```

---

## ✅ Testing (Optional)

Use RSpec, Minitest or any preferred testing framework.

```bash
rails test
```

---

## 📤 Deployment

Use your preferred host (e.g., Fly.io, Heroku):

### Heroku Example:

```bash
heroku create
heroku buildpacks:add heroku/nodejs
heroku buildpacks:add heroku/ruby
git push heroku main
heroku run rails db:migrate
```

---

## 🤝 Contributing

1. Fork the repo
2. Create a new branch (`git checkout -b feature/fooBar`)
3. Commit changes (`git commit -am 'Add feature'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

---

## 📄 License

MIT License. See `LICENSE` for details.

---

## 💡 Roadmap (Planned)

* ✅ Affiliate performance charts
* ✅ Admin approval flow for withdrawals
* 🔜 AI-suggested products for affiliates
* 🔜 Stripe / Momo payouts
* 🔜 Referral link shortening
* 🔜 Mobile-friendly dashboard

---

## 👋 Acknowledgements

Built with ❤️ using Rails 8, Hotwire, Tailwind, and PostgreSQL.
