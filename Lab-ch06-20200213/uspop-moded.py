from bokeh.core.properties import value
from bokeh.io import show, output_file
from bokeh.plotting import figure
from bokeh.models import Legend
import pandas

read_data = pandas.read_csv(open('data/us-population-by-age-moded.csv', 'r'), delimiter=",")

year = read_data['Year'].values
# yearlist = []
# for i in range(len(year)):
#     yearlist.insert(i, str(year[i]))
#     print(i, year[i])

age = ['Under 5', '5 to 19', '20 to 44','45 to 64','65+']
colors = ["#66c2a5", "#e84d60", "#bdbdbd","#bdbdbd","#68CC74"]

output_file("uspop-moded.html")

p = figure(x_range=year, height=350, title="US Population Age for each year",
           toolbar_location="right", tools="hover,tap, save", tooltips="$name: @$name")

v = p.vbar_stack(age, x='Year', width=0.9, color=colors, source=read_data)

p.y_range.start = 0
p.yaxis[0].axis_label = 'Population (%)'
p.x_range.range_padding = 0.1
p.xaxis.major_label_orientation = 1
p.xgrid.grid_line_color = None
p.axis.minor_tick_line_color = None
p.outline_line_color = None
# p.legend.location = "top_right"
# p.legend.orientation = "vertical"

legend = Legend(items=[
    ("Under 5", [v[0]]),
    ("5 to 19", [v[1]]),
    ("20 to 44", [v[2]]),
    ("45 to 64", [v[3]]),
    ("65+", [v[4]]),
    ], location=(0, 100))

p.add_layout(legend, 'right')

show(p)

