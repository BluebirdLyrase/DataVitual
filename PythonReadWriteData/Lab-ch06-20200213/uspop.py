from bokeh.core.properties import value
from bokeh.io import show, output_file
from bokeh.plotting import figure
from bokeh.models import Legend
import pandas

read_data = pandas.read_csv(open('Lab-ch06-20200213/data/us-population-by-age.csv', 'r'), delimiter=",")

year = read_data['Year'] = list(map(str, read_data['Year']))

age = ['Under 5', '5 to 19', '20 to 44','45 to 64','65+']
colors = ["#D6DBDF", "#85C1E9", "#2980B9","#45B39D","#68CC74"]

output_file("Lab-ch06-20200213/uspop.html")

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

