# !/bin/bash	

#!/bin/bash
curl https://raw.githubusercontent.com/jupyterhub/the-littlest-jupyterhub/master/bootstrap/bootstrap.py \
 | sudo python3 - \
   --plugin git+https://github.com/voila-dashboards/tljh-voila-gallery@master#"egg=tljh-voila-gallery&subdirectory=tljh-voila-gallery"