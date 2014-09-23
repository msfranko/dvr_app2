require 'fileutils'
require 'pry'

desc "default task"
task :default do
  puts "default task"
end

namespace :greeting do
  desc "greeting"
  task :greeting do
    puts "why hello"
  end

   desc "greeting by name"
  task :greet, [:name] do |cmd, args|
    puts "Why hello, #{args[:name]}"
  end
end

namespace :cake do

  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flower, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flower => :get_flower do
    puts "Adding flower"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flower => :go_to_store do
    puts "Get Flower"
  end

  task :go_to_store do
    puts "Go to Store"
  end
end

  desc "things i can't spell"
  task :learn_how_to_spell, [:word] do |cmd, args|
    puts "need to learn how to spell, #{args[:word]}"
  end

namespace :dozer do
  desc "print ENV"
  task :env do
    # executed in bash shell
    sh("ENV")
  end

  desc "print PWD"
  task :pwd do
    # both do the same
    sh("pwd")
    system("pwd")
  end

  desc "adds views for a resource"
  task :make_views, [:resource_name] do |cmd, args|
    resource = args[:resource_name]
    sh("mkdir views/#{resource}")
    sh("touch views/#{resource}/index.erb")
    FileUtils.touch("views/#{resource}/new.erb")
    # we can call touch directly because we included fileutils
    touch("views/#{resource}/edit.erb")
    touch("views/#{resource}/show.erb")
  end
end

# $ rake db:create
#hard code name
#should create a db called dvr_app_test

namespace :db do
  desc "creates a db"
    task :create, [:dbname] do |cmd, args|
    dbname = args[:dbname] || "dvr_app_test"
    sh("createdb #{dbname}")
  end

  desc "drop a db"
  task :drop do
    sh("dropdb dvr_app_test")
  end

  desc "seed my db"
  task :seed, [:env] do |cmd, args|
    #default environment
    env = args[:env] || "development"
    #load sinatra environment then pouplate my database
    #calls rake environment[env]
    Rake::Task['environment'].invoke(env)
    require './db/seeds.rb'
  end
end

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  Bundler.require(:default, ENV["RACK_ENV"])
  require "./config/boot"
end

























