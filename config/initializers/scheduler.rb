require 'rufus-scheduler'
include UserimportHelper

$currentPage = 1

s = Rufus::Scheduler.singleton

# Awesome recurrent task
#s.every '1m' do
s.every '10s' do
    import($currentPage)
    $currentPage += 1
end