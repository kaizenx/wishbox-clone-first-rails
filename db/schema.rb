# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140425184616) do

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_us", force: true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.string   "Email"
    t.text     "Comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: true do |t|
    t.integer  "FeedId"
    t.string   "Name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", force: true do |t|
    t.string   "UserId"
    t.boolean  "IsAdmin"
    t.boolean  "IsSponsor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "restricted"
    t.string   "ImageUrl"
    t.string   "Title"
    t.string   "Subtitle"
    t.boolean  "IsPublished"
    t.text     "Description"
    t.string   "slug"
    t.decimal  "lat",         precision: 10, scale: 6
    t.decimal  "lng",         precision: 10, scale: 6
    t.string   "Blurb"
  end

  add_index "feeds", ["slug"], name: "index_feeds_on_slug", unique: true, using: :btree

  create_table "friend_lists", force: true do |t|
    t.integer  "UserId"
    t.integer  "FriendUserId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.integer  "feeid"
    t.integer  "productid"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invited_to_trips", force: true do |t|
    t.integer  "InviterId"
    t.integer  "InviteeId"
    t.string   "NonMemberInviteeId"
    t.integer  "TripId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "itineraries", force: true do |t|
    t.integer  "UserId"
    t.integer  "ProductId"
    t.integer  "TripId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: true do |t|
    t.string   "Name"
    t.string   "Title"
    t.string   "CompanyName"
    t.string   "Address"
    t.string   "Country"
    t.string   "ContactPhone"
    t.string   "MobilePhone"
    t.string   "Email"
    t.string   "Password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "UserId"
    t.string   "PaymentId"
    t.string   "PaymentPortal"
    t.decimal  "Amount",          precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "PayerId"
    t.decimal  "GatewayPrice",    precision: 10, scale: 0
    t.string   "GatewayCurrency"
  end

  create_table "page_feeds", force: true do |t|
    t.string   "FeedList"
    t.integer  "UserId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "picture_galleries", force: true do |t|
    t.string   "Name"
    t.string   "image_uid"
    t.string   "image_name"
    t.integer  "TargetId"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "preview_sign_ups", force: true do |t|
    t.string   "EmailAddress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_in_feeds", force: true do |t|
    t.integer  "productid"
    t.integer  "feedid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_price_lists", force: true do |t|
    t.decimal  "Price",      precision: 10, scale: 0
    t.integer  "DayOfYear"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ProductId"
  end

  create_table "products", force: true do |t|
    t.string   "Title"
    t.string   "SubTitle"
    t.string   "ImageURL"
    t.string   "TargetURL"
    t.integer  "Wants"
    t.integer  "CreatedByUserId"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Currency"
    t.decimal  "Price",              precision: 10, scale: 0
    t.boolean  "IsPublished"
    t.string   "MerchantId"
    t.string   "SKUId"
    t.string   "Category"
    t.datetime "StartDate"
    t.datetime "EndDate"
    t.integer  "DestinationId"
    t.text     "Description"
    t.text     "Highlights"
    t.text     "Condition"
    t.decimal  "BasePrice",          precision: 10, scale: 0
    t.integer  "DiscountPercentage"
    t.string   "slug"
    t.boolean  "IsInfinite"
    t.string   "Blurb"
    t.text     "Widget1"
    t.text     "Widget2"
    t.datetime "ValidityStart"
    t.datetime "ValidityEnd"
    t.text     "Address"
    t.string   "LocationName"
  end

  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "trending_tags", force: true do |t|
    t.string   "Tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.integer  "userid"
    t.integer  "feedid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "TripCreator"
    t.string   "DestinationId"
    t.datetime "StartDate"
    t.datetime "EndDate"
  end

  create_table "user_details", force: true do |t|
    t.string   "FirstName"
    t.string   "LastName"
    t.integer  "Age"
    t.string   "Email"
    t.integer  "UserId"
    t.string   "StreetAddr"
    t.string   "State"
    t.string   "City"
    t.string   "Zipcode"
    t.string   "Country"
    t.integer  "Income"
    t.string   "Gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "IsReceiveWeekly"
    t.boolean  "IsReceiveTripUpdate"
    t.boolean  "IsReceiveTripUserUpdate"
    t.boolean  "IsReceivePromo"
    t.integer  "Credit"
    t.string   "Currency"
  end

  create_table "user_shopping_carts", force: true do |t|
    t.integer  "userid"
    t.integer  "productid"
    t.boolean  "isshow"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "IsBought"
    t.string   "Title"
    t.decimal  "Price",       precision: 8, scale: 2
    t.string   "VoucherCode"
    t.integer  "Quantity"
    t.integer  "OrderId"
    t.integer  "TripId"
  end

  create_table "user_wants", force: true do |t|
    t.integer  "UserId"
    t.integer  "ProductId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
