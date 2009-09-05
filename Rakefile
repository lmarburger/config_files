desc 'Copy config files into the repository'
task :update_repository do
  home_directory = File.expand_path '~'
  current_directory = File.dirname(__FILE__)

  Dir.glob(File.join(current_directory, '*')) do |filename|
    config_file = File.join(home_directory, ".#{ File.basename(filename) }")
    #p [ filename, File.exist?(config_file) ]

    if File.exist?(config_file)
      rm_rf filename
      cp_r config_file, filename
    end
  end
end

task :default => :update_repository
