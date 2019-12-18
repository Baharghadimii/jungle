# Jungle

Jungle is a mini e-commerce application built with Rails 4.2 for the purposes of teaching Rails by example. This project was not just about learning a new language, ecosystem and framework. It was moreso a simulation of the real world, as I inherited an existing code base in a language / framework that I was not comfortable with.

## Final Product

!["Product Cataloge"](https://github.com/Baharghadimii/jungle/blob/master/app/docs/Product_Catalog.png?raw=true)
!["Product Cataloge"](https://github.com/Baharghadimii/jungle/blob/master/app/docs/Product_Catalog_Continued.png?raw=true)
!["Product Details"](https://github.com/Baharghadimii/jungle/blob/master/app/docs/Product_Details_Page.png?raw=true)
!["Purchase Page"](https://github.com/Baharghadimii/jungle/blob/master/app/docs/Purchase_Window.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
