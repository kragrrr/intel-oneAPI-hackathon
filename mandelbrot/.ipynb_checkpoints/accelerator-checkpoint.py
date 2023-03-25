import ipywidgets as widgets
device = widgets.RadioButtons(
    options=['GPU Gen9', 'GPU Iris XE Max', 'CPU Xeon 6128', 'CPU Xeon 8153', 'CPU Xeon 8256'],
    value='GPU Gen9',    
    description='Device:',
    disabled=False
)
display(device)
