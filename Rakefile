task default: %w[test]

task :test do |t|
  ruby "./test/User_test.rb"
  ruby "./test/Utils_test.rb"
  ruby "./test/Equipo_test.rb"
  ruby "-W0 ./test/Routes_test.rb"
end

task :exec do
  ruby "index.rb"
end
