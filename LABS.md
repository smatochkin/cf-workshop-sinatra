# CF Workshop Sinatra LABS

(Assumption EC2 cf-workshop AMI is running and logged into)

## Module 2

### Lab: Sample Application -- Application Menu -> Terminal Emulator

git clone https://github.com/skahler-pivotal/cf-workshop-sinatra.git

cd cf-workshop-sinatra cd basic

rackup config.ru

-- Application Menu -> Web browser -> go to http://localhost:9292

verify basic ruby app is working and environment variables are displayed

close browser

Ctrl-C to stop webserver

### Lab: Application Push

cf target https://api.run.pivotal.io

cf login

cf push

-- AppName: testapp -- Instances: 1 -- Memory: 128M -- Subdomain: -- Domain: cfapps.io -- Create Service: No -- Bind Service: No -- Save Configuration: Yes

cat manifest.yml

-- Web browser ( http://.cfapps.io

### Lab: Working with Deployed Applications

cf apps

cf instances testapp

cf stats testapp

cf stop testapp

cf delete testapp

## Module 4

### Lab: Environmental Variables

cd ~ cd cf-workshop-sinatra cd basic

cf push

-- Web browser -> http://

cf stop

cf delete

### Lab: Services

Note the Service Lab in Sinatra cannot be pushed without a database backend and then started Instead we will

cd ~ cd cf-workshop-sinatra cd advanced mv manifest.yml manifest.bak

cf push --command 'bundle exec rake --trace cf:on_first_instance db:migrate && bundle exec rackup -p $PORT'

-- Name: rubylab -- Instances: 2 -- Memory: 128M -- Subdomain: rubylab- -- Domain: cfapps.io -- Create Services: Yes -- What Kind: 5 elephantsql -- Name: rubylab -- Plan: 4 tiny turtle -- Save Config: Yes

-- Web browser -> http:// -- Navigate to the Attendees

## Module 5

### Lab: Scaling

cf scale --instances 3

cf apps (verify app has scaled to # of instances0

### Lab: URL Mapping

cf app rubylab

cf map rubylab cfapps.io

cf app rubylab

-- Web browser -> http://

## Module 6

### Lab: Health Management Application

cf stats

-- Web browser -> http:///kill

cf stats (should show one app down)

cf stats (repeat until app shows up and running)

### Lab: Application Logging

cf logs

cf tail rubylab -- Web browser -> http://

Ctrl+C

cf files rubylab

cf files rubylab /logs/

cf files rubylab /logs/staging_task.log

cf events
