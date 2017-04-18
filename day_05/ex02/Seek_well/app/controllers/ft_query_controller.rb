require 'sqlite3'
class FtQueryController < ApplicationController
  def create_db
    $db ||= SQLite3::Database.new('db/ft_sql')
    redirect_to :root
  end

  def create_table
    # sql = <<~SQL
    #   CREATE TABLE IF NOT EXISTS clock_watch(
    #   ts_id INTEGER PRIMARY KEY,
    #   day INTEGER
    #   month INTEGER,
    #   year INTEGER,
    #   hour INTEGER,
    #   min INTEGER,
    #   sec INTEGER,
    #   race INTEGER,
    #   name VARCHAR(50),
    #
    # SQL
    # # PRIMARY KEY (ts_id));
    sql = 'CREATE TABLE IF NOT EXISTS clock_watch(ts_id INTEGER PRIMARY KEY,
     day INTEGER, month INTEGER, year INTEGER, hour INTEGER, min INTEGER,
     sec INTEGER, lap INTEGER, name VARCHAR(50), race INTEGER);'
    $db.execute(sql)
    sql = 'CREATE TABLE IF NOT EXISTS race(r_id INTEGER PRIMARY KEY, start VARCHAR(50));'
    $db.execute(sql)
    redirect_to :root
  end

  def drop_table
    $db.execute 'DROP TABLE IF EXISTS clock_watch;'
    $db.execute 'DROP TABLE IF EXISTS race;'
    redirect_to :root
  end

  def index
    $time_stamps = $db.execute('SELECT * FROM clock_watch') if $db
    $time_stamps = ['Database is empty or an other error occured'] if $time_stamps.nil?
    $all = ['Not so fast, young padawan']
  end

  def start_race
    $db = SQLite3::Database.open('db/ft_sql')
    $runner_1 = params[:name_1].empty? ? 'anonymous' : params[:name_1]
    $runner_2 = params[:name_2].empty? ? 'anonymous' : params[:name_2]
    $runner_3 = params[:name_3].empty? ? 'anonymous' : params[:name_3]
    $runner_4 = params[:name_4].empty? ? 'anonymous' : params[:name_4]
    temps = Time.now.getlocal
    day = temps.day
    month = temps.month
    year = temps.year
    hour = temps.hour
    min = temps.min
    sec = temps.sec
    lap = 1
    sql = 'INSERT INTO race (start) VALUES (?);'
    tmp = $db.prepare(sql)
    tmp.execute temps.to_s
    r_id = $db.execute("SELECT r_id FROM race WHERE start IS '#{temps}'")
    sql = ' INSERT INTO clock_watch (name, day, month, year, hour, min, sec, lap, race)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);'
    tmp = $db.prepare(sql)
    [$runner_1, $runner_2, $runner_3, $runner_4].each do |runner|
      tmp.execute(runner, day, month, year, hour, min, sec, lap, r_id)
    end
    redirect_to :root
  end

  def insert_time_stamp; end

  def delete_last; end

  def destroy_all; end

  def all_by_name; end

  def all_by_race; end

  def update_time_stamp; end
end
