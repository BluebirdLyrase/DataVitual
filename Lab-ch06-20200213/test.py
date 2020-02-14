from bokeh.core.properties import value
from bokeh.io import show, output_file
from bokeh.plotting import figure
from bokeh.models import Legend
import pandas

read_data = pandas.read_csv(open('data/us-population-by-age.csv', 'r'), delimiter=",")

issue = read_data['Year'].values
vote = ['Under 5', '5 to 19', '20 to 44','45 to 64','65+']
colors = ["#66c2a5", "#e84d60", "#bdbdbd","#EA340D","#68CC74"]
yearlist = []
for i in range(len(issue)):
    yearlist.insert(i, str(issue[i]))
    print(i, issue[i])

output_file("stacked.html")

p = figure(x_range=yearlist, height=350, title="Approval ratings for Barack Obama in 2010",
           toolbar_location="right", tools="hover,tap, save", tooltips="$name: @$name")

v = p.vbar_stack(vote, x='Year', width=0.9, color=colors, source=read_data)

p.y_range.start = 0
p.yaxis[0].axis_label = 'Percentage (%)'
p.x_range.range_padding = 0.1
p.xaxis.major_label_orientation = 1
p.xgrid.grid_line_color = None
p.axis.minor_tick_line_color = None
p.outline_line_color = None
# p.legend.location = "top_right"
# p.legend.orientation = "vertical"

legend = Legend(items=[
    ("Approve", [v[0]]),
    ("Disapprove", [v[1]]),
    ("None", [v[2]]),
    ], location=(0, 100))

p.add_layout(legend, 'right')

show(p)

