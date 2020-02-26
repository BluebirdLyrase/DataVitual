from bokeh.io import output_file, show
from bokeh.plotting import figure
from bokeh.palettes import Category20c
from bokeh.transform import cumsum
from math import pi
import pandas

read_data = pandas.read_csv(open('data/obama-approval-ratings.csv', 'r'), delimiter=",")

issue = read_data['Issue'].values
approve_data = read_data[["Issue","Approve"]]
approve_data = approve_data.sort_values('Approve',ascending=False)

#create Html
output_file("pie.html")

#Prepare data frame to plot
approve_data['angle'] = 2*pi*approve_data['Approve']/approve_data['Approve'].sum()
approve_data['color'] = Category20c[len(approve_data)]

#Plot

p = figure(plot_height=350, title="Pie Chart", toolbar_location=None,
           tools="hover", tooltips="@Issue: @Approve", x_range=(-0.5, 1.0))

p.wedge(x=0,y=1,radius=0.4,
        start_angle=cumsum('angle', include_zero=True),end_angle=cumsum('angle'),
        line_color="white",fill_color='color',legend='Issue',source=approve_data)

p.axis.axis_label=None
p.axis.visible=False
p.grid.grid_line_color=None
show(p)