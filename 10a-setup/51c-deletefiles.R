# Delete Files from command

write.csv(mtcars, 'mcars.csv')
file.exists('mcars.csv')
unlink('mcars.csv')
file.exists('mcars.csv')

write.csv(mtcars, './data/mcars2.csv')
file.exists('./data/mcars2.csv')
unlink('./data/mcars2.csv')
file.exists('./data/mcars2.csv')

#fileremove----
write.csv(mtcars, 'mcars3.csv')
file.exists('mcars3.csv')
file.remove('mcars3.csv')
file.exists('mcars3.csv')


