require 'open3'

#Apache scenerio
When(/^I install Apache$/) do 
	cmd = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'apache_setup'"

	output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^it should be successful$/) do 
	expect(@status.success?).to eq(true)
end

And(/^Apache should be running$/) do
	command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'sudo service apache2 status'"
  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
  expect(output).to match("apache2 is running")
end

And(/^it should be accepting connections on Port ([^"]*)$/) do |port|
  command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'curl -f http://localhost:#{port}'"
  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
end


#SQL Scenario
When(/^I install MySQL$/) do
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'sql_setup'"
  
  output, error, @status = Open3.capture3 "#{command}"
end

And(/^MySQL should be running$/) do 
	command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com '/etc/init.d/mysql status'"
	output, error, status = Open3.capture3 "#{command}"

	expect(status.success?).to eq(true)
	expect(output).to match("mysql start/running")
end

#PHP Scenario
When(/^I install PHP$/) do
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'php_setup'"
  
  output, error, @status = Open3.capture3 "#{command}"
end

#Nagios Scenario
When(/^I create a group$/) do
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'group'"

	output, error, @status = Open3.capture3 "#{command}"
end

And(/^I add a user to a group$/) do 
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'user_group'"
  
  output, error, @status = Open3.capture3 "#{command}"
end

When(/^I install nagios dependencies$/) do
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'dependencies'"
  
  output, error, @status = Open3.capture3 "#{command}"
end

When(/^I download nagios source code$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'source_code'"

  output, error, @status = Open3.capture3 "#{command}"
end

And(/^I extract nagios source code$/) do
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'extract'"
  output, error, status = Open3.capture3 "#{command}"

end

When(/^I configure nagios$/) do 
	command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'configure'"

  output, error, @status = Open3.capture3 "#{command}"
end

When(/^I compile nagios$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'compile'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I add web server to group$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'web_server'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I download nagios plugins$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'nagios_plugin'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

And(/^I extract nagios plugins$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'extract_nagios_plugin'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I configure nagios plugins$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'configure_nagios_plugins'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I compile and install nagios plugins$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'compile_nagios_plugins'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 


When(/^I download nrpe$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'nrpe'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

And(/^I extract nrpe$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'extract_nrpe'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I configure nrpe$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'configure_nrpe'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I compile and install nrpe$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'compile_nrpe'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I add server ip address$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'server_ip_address'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

And(/^I restart xinetd service$/) do
  command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'sudo service xinetd status'"
  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
  expect(output).to match("xinetd start/running,")
end

Given(/^I set config directory$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'set_config'"

  output, error, @status = Open3.capture3 "#{command}"
end 

And(/^config directory was set$/) do
	command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'cat /usr/local/nagios/etc/nagios.cfg | grep cfg_dir=/usr/local/nagios/etc/servers'"
  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
  expect(output).to match("cfg_dir=/usr/local/nagios/etc/servers")
end

When(/^I create server config directory$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'create_config_dir'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

And(/^server directory should exist$/) do
	command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'ls /usr/local/nagios/etc/ | grep servers'"
  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
  expect(output).to match("servers")
end

When(/^I add email to contacts config$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'set_email'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I add check_nrpe command$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'add_check_nrpe'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

When(/^I create nagios user and password$/) do
  command = "ansible-playbook -i inventory.ini --private-key=~/Downloads/pem_keys/orezi-wiki-key.pem -u ubuntu playbook.main.yml --tags 'password'"	
  
  output, error, @status = Open3.capture3 "#{command}"
end 

Then(/^it should exist in password file$/) do
  command = "ssh -i '/Users/orezi/Downloads/pem_keys/orezi-wiki-key.pem' ubuntu@ec2-184-72-122-220.compute-1.amazonaws.com 'cat /usr/local/nagios/etc/htpasswd.users | grep nagiosadmin'" 

  output, error, status = Open3.capture3 "#{command}"

  expect(status.success?).to eq(true)
  expect(output).to match("nagiosadmin")
end














