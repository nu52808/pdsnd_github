ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')
head(ny, 50)
library(ggplot2) #I added this to create the plots.
summary(wash$User.Type) #I used the summary function to easily pull up the total amounts for each user type.
qplot(x=User.Type, data=wash)+
labs(y='Counts', x='User Type')+
ggtitle("Bikeshare Users in Washington")

# The histogram graph shows the data for each user type. The two user types are Customer and Subscriber.

#I chose to use the loop/if statements just to practice. The loop counts how many times 'Male' or 'Female' shows up in the Gender column.
m=0
f=0
for (variable in ny$Gender) {if(variable=='Male'){
  m=m+1
}
  else if(variable=='Female'){f=f+1
  }


}

print(m)
print(f)

wonder=subset(ny, Gender=='Male'|Gender== 'Female')
summary (wonder$Gender)
# created a subset of data to only pull up two genders: Male and Female. The reason I had to do this is because there were rows in the datatable where data was omitted. Using !is.na would not have worked.
#Used summary to check and make sure my use of loops/if statements was correct. My results match up with the total amounts for the summary.

qplot(data=wonder, x=Gender)+
ggtitle("NYC Bikeshare Users by Gender")+
labs(x='Gender', y='Count')

#used the previous subset to graph data. Included Graph title, x/y axis, etc. The graph now only shows the two genders, Male and Female. It does not include the rows that had no data.

summary(ny$Birth.Year)
# I used the summary data only to get the min and max of the years within the ny$BirthYear column. This information allowed me to answer the first part of my question.

qplot(data=ny, x=Birth.Year, binwidth=1)+
labs(x='Birth Year', y="Count")+
scale_x_continuous(breaks= seq(0, 2001, 10))+
ggtitle("Bikeshare Birth Years")

#I used this graph to give a visual representation of the most common birth year. Zooming into the graph, I was able to find that the most common year was 1989.
