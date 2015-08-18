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

ActiveRecord::Schema.define(version: 20150813093251) do

  create_table "account_details", force: true do |t|
    t.integer  "account_id"
    t.string   "occupation",  default: "Gladiator"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "email",                             default: "",     null: false
    t.string   "gender"
    t.string   "oauth_token"
    t.string   "provider"
    t.string   "refresh_token"
    t.datetime "oauth_expires_at"
    t.string   "display_name",           limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "privilege",                         default: "user"
    t.string   "channel_key"
    t.string   "encrypted_password",                default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "uid",                    limit: 8
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "challenges", force: true do |t|
    t.integer  "topic_id"
    t.integer  "challenger_id"
    t.integer  "challengee_id"
    t.string   "challengee_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",           default: "accepted"
  end

  create_table "comments", force: true do |t|
    t.integer  "account_id"
    t.integer  "post_id"
    t.integer  "reply_level",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "main_comment_id"
  end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "contents", force: true do |t|
    t.integer  "content_owner_id"
    t.string   "content_owner_type"
    t.string   "content_type",       limit: 5, default: "text"
    t.text     "content_body"
    t.integer  "likes",                        default: 0
    t.integer  "dislikes",                     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
    t.string   "video"
    t.integer  "topic_id"
  end

  add_index "contents", ["content_owner_id", "content_owner_type"], name: "index_contents_on_content_owner_id_and_content_owner_type", using: :btree
  add_index "contents", ["topic_id"], name: "index_contents_on_topic_id", using: :btree

  create_table "debate_participations", force: true do |t|
    t.integer  "account_id"
    t.integer  "debate_id"
    t.string   "role"
    t.string   "side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debate_participations", ["account_id", "debate_id"], name: "index_debate_participations_on_account_id_and_debate_id", using: :btree

  create_table "debate_rooms", force: true do |t|
    t.integer  "topic_id"
    t.text     "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debates", force: true do |t|
    t.integer  "topic_id"
    t.integer  "time_limit"
    t.integer  "back_and_forth_limit"
    t.integer  "character_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "audience_number",      default: 0
    t.integer  "left_side_number",     default: 0
    t.integer  "right_side_number",    default: 0
    t.integer  "neutral_number",       default: 0
  end

  add_index "debates", ["topic_id"], name: "index_debates_on_topic_id", using: :btree

  create_table "evidences", force: true do |t|
    t.integer  "post_id"
    t.string   "og_topic"
    t.text     "og_description"
    t.text     "og_image_url"
    t.string   "og_type"
    t.string   "og_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "image_owner_id"
    t.string   "image_owner_type"
    t.string   "url"
    t.string   "picture"
    t.string   "image_use"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["image_owner_id"], name: "index_images_on_image_owner_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "account_id"
    t.integer  "sender_id"
    t.integer  "sender_type"
    t.text     "message"
    t.boolean  "checked",     default: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.integer  "account_id"
    t.integer  "debate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["account_id"], name: "index_posts_on_account_id", using: :btree
  add_index "posts", ["debate_id"], name: "index_posts_on_debate_id", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.string   "followed_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "reports", force: true do |t|
    t.integer  "account_id"
    t.text     "issue"
    t.string   "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.integer  "topic_id"
    t.string   "og_topic"
    t.text     "og_description"
    t.text     "og_image_url"
    t.string   "og_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "og_url"
  end

  create_table "timers", force: true do |t|
    t.integer  "timed_id"
    t.string   "timed_type"
    t.datetime "start_time", default: '2015-08-14 21:53:29', null: false
    t.datetime "pos"
    t.datetime "end_time",   default: '2015-08-21 21:53:29', null: false
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timers", ["timed_id"], name: "index_timers_on_timed_id", using: :btree

  create_table "topics", force: true do |t|
    t.integer  "account_id"
    t.string   "topic_sentence",   default: "Debate Topic", null: false
    t.text     "description"
    t.string   "left_side_topic",  default: "For"
    t.string   "right_side_topic", default: "Against"
    t.string   "category"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "visibility",       default: "visible"
  end

  add_index "topics", ["account_id"], name: "index_topics_on_account_id", using: :btree

  create_table "user_activities", force: true do |t|
    t.integer  "account_id"
    t.datetime "last_seen"
    t.string   "status"
    t.string   "update_status", default: "expired"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_activities", ["account_id"], name: "index_user_activities_on_account_id", using: :btree

end
