jenkins = Jenkins.instance.getAllItems()
startDate = new Date().parse('yyyy-MM-dd HH:mm:ss','2015-05-01 00:00:00')
endDate = new Date().parse('yyyy-MM-dd HH:mm:ss','2015-05-02 00:00:00')
long startTime = startDate.getTime();
long endTime = endDate.getTime();
int totalNum = 0

allItems = jenkins.allItems
allJobs = allItems.findAll { job ->job instanceof BuildableItemWithBuildWrappers }
allJobs.each() { job -> 
  runs = job.builds.byTimestamp(startTime,endTime).size()
  totalNum = totalNum + runs
}
println 'Total count: '+totalNum
