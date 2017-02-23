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

ActiveRecord::Schema.define(version: 20170223164606) do

  create_table "hashtags", force: :cascade do |t|
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "text"
  end

  create_table "source_tweets", id: false, force: :cascade do |t|
    t.integer "tweet_id"
    t.integer "client_id"
  end

  create_table "source_words", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "word_id"
    t.integer  "source_id"
    t.integer  "year"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweet_hashtags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hashtag_id"
    t.integer  "tweet_id"
    t.integer  "year"
  end

  create_table "tweet_mentions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "mention_id"
    t.integer  "tweet_id"
    t.integer  "year"
  end

  create_table "tweet_words", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "year"
    t.integer  "tweet_id"
    t.integer  "word_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.datetime "tweeted_at"
    t.datetime "updated_at", null: false
    t.integer  "source_id"
    t.string   "text"
    t.string   "id_str"
  end

  create_table "words", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "text"
  end

  create_table "years", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
