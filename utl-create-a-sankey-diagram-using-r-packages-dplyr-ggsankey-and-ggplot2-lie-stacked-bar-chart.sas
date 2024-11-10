%let pgm=utl-create-a-sankey-diagram-using-r-packages-dplyr-ggsankey-and-ggplot2-like-stacked-bar-chart;

Create a sankey diagram using r packages dplyr  ggsankey and ggplot2 lie stacked bar chart
                       _                   _               _
  __ _ _ __ __ _ _ __ | |__     ___  _   _| |_ _ __  _   _| |_
 / _` | `__/ _` | `_ \| `_ \   / _ \| | | | __| `_ \| | | | __|
| (_| | | | (_| | |_) | | | | | (_) | |_| | |_| |_) | |_| | |_
 \__, |_|  \__,_| .__/|_| |_|  \___/ \__,_|\__| .__/ \__,_|\__|
 |___/          |_|                           |_|

guthub graph
you have to download to see graphic (used to work)
https://tinyurl.com/y3cphbyd
https://github.com/rogerjdeangelis/utl-create-a-sankey-diagram-using-r-packages-dplyr-ggsankey-and-ggplot2-lie-stacked-bar-chart/blob/main/ggsankey.pdf

github
https://tinyurl.com/2s3t5zus
https://github.com/rogerjdeangelis/utl-create-a-sankey-diagram-using-r-packages-dplyr-ggsankey-and-ggplot2-lie-stacked-bar-chart

stackoverflow r
https://stackoverflow.com/questions/79171889/geom-sankey-in-r-ordering-columns


For complex hi-res graphic see

INSTALLTION OPTIONS FOR GGSANKEY

ggsankey package is not available from cran

for intall directions go to
https://github.com/davidsjoberg/ggsankey

EASIEST METHOD

# install.packages("devtools")
devtools::install_github("davidsjoberg/ggsankey")

IF YOU HAVE PROBLEMS YOU CAN (DOWNLOAD THE SOURCE)

1  interactively open https://github.com/davidsjoberg/ggsankey
2  clck on source directory
3  click on code (you will geta zip file  ggsankey-main.zip
4  download source directory (you will geta zip file  ggsankey-main.zip)
5  unzip into c:/zip
5  run install.packages("c:/zip/ggsankey-main", repos = NULL, type = "source")


RELATED REPOS

https://github.com/rogerjdeangelis/utl-interaction-between-a-Network-Diagram-and-a-Sankey-diagram-r-networkD3
https://github.com/rogerjdeangelis/mySQL-uml-modeling-to-create-entity-diagrams-for-sas-datasets
https://github.com/rogerjdeangelis/utl-create-simpe-venn-diagram
https://github.com/rogerjdeangelis/utl-R-Diagramming-tool-for-UML-YAML
https://github.com/rogerjdeangelis/utl-r-reproducitible-example-of-the-fishbone-diagram
https://github.com/rogerjdeangelis/utl_diagramme_a_flow_with_a_predefined_order_of_the_nodes
https://github.com/rogerjdeangelis/utl_fishbone_diagram_and_team_solutions_to_a_complex_problem
https://github.com/rogerjdeangelis/utl_voronoi_diagram_on_a_shapefile_of_singapore


/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/************************************************************************************************************************************************/
/*                                                 |                                               |                                            */
/*                INPUTS                           |         PROCESS (RELATED EXAMPLE)             |                   OUTPUT                   */
/*                ------                           |         --------------------------            |         (RELATED TO STACKED BAR CHARTS)    */
/*                                                 |                                               |                                            */
/*  SD1.NORM total obs=17                          |                                               |                                            */
/*                                                 |                                               |                                            */
/*  YEAR    DEPT         DESC               FREQ   | %utl_rbeginx;                                 |      / SHOES         PLACE ON FEET         */
/*                                                 | parmcards4;                                   |      | SHOES         PLACE ON FEET         */
/*  2010    Shoes        Place on feet        4    | library(ggsankey)                             | 2010 | SHOES    ---> PLACE ON FEET         */
/*  2010    Bridal       Wedding Dresses      1    | library(haven)                                |      \ SHOES  4      PLACE ON FEET  4      */
/*  2011    Bridal       Flowerly             3    | library(dplyr)                                |                                            */
/*  2011    Bridal       Wedding Dresses      2    | library(ggplot2)                              |                                            */
/*  2011    Maternity    Comfortable          2    | source("c:/oto/fn_tosas9x.R")                 | 2010 / BRIDAL   ---> WEDDING DRES          */
/*  2011    Maternity    Stretchy             5    | df_stack <- read_sas("d:/sd1/have.sas7bdat")  | 2011 | BRIDAL        WEDDING DRES          */
/*  2012    Maternity    Comfortable          2    | df_stack$x <- as.factor(df_stack$x)           |      | BRIDAL   ---> WEDDING DRES  1+2     */
/*  2013    Maternity    Comfortable          1    | df_stack$next_x <- as.factor(df_stack$next_x) |      | BRIDAL                              */
/*  2013    Winter       Thick Socks          3    | str(df_stack)                                 |      | BRIDAL            FLOWERLY          */
/*  2014    Make Up      Foundation           1    | pdf(file="d:/pdf/ggsankey.pdf");              |      \ BRIDAL 1+3+2 -->  FLOWERLY          */
/*  2014    Make-Up      Foundation           2    | ggplot(df_stack, aes(x = x,                   |                      FLOWERLY      3       */
/*  2014    Make-Up      Lipstick             2    |  next_x = next_x,                             |                                            */
/*  2015    Make-Up      Lipstick             1    |  node = node,                                 | +-----------------+                        */
/*  2015    Suits        Full Gear            3    |  next_node = next_node,                       | |2011 FLOWERLY    |                        */
/*  2015    Vehicle      Sedan                1    |  fill = factor(node),                         | |2011 FLOWERLY    |   +------------------+ */
/*  2022    Games        Console              2    |  label = node,                                | |2011 FLOWERLY    |   |2010 PLACE ON FEET| */
/*  2022    Games        PC                   1    |  color = factor(node))) +                     | |2010 WEDDING DRES|   |2010 PLACE ON FEET| */
/*                                                 |   geom_sankey(flow.alpha=0.5,node.color=1,    | |2011 WEDDING DRES|   |2010 PLACE ON FEET| */
/*                                                 |   smooth=6,width=0.2,)+#width=widthofnodes    | |2011 WEDDING DRES|   |2010 PLACE ON FEET| */
/*                                                 |   geom_sankey_label(size=3.5                  | +-----------------+   +------------------+ */
/*                                                 |     ,color=1,fill="white") +                  |     BRIDAL                  SHOES          */
/*                                                 |   scale_fill_viridis_d(direction=-1           |                                            */
/*  PREP DATA FOR SANKEY                           |      ,option="turbo") +                       |                                            */
/*                                                 |   scale_colour_viridis_d(direction=-1         |                                            */
/*    X      NEXT_X  NODE           NEXT_NODE      |      ,option="turbo") +                       |                                            */
/*                                                 |   theme_sankey(base_size=15) +                |                                            */
/*   1 year  1 year  2010           Bridal         |   theme(legend.position="none")+xlab('')      |                                            */
/*   2 dept  2 dept  Bridal         Wedding Dress  | pdf();                                        |                                            */
/*   3 desc          Wedding Dress                 | ;;;;                                          |                                            */
/*   1 year  1 year  2010           Shoes          | %utl_rendx;                                   |                                            */
/*   2 dept  2 dept  Shoes          Place on feet  |                                               |                                            */
/*   3 desc          Place on feet                 |                                               |                                            */
/*   1 year  1 year  2010           Shoes          |                                               |                                            */
/*   2 dept  2 dept  Shoes          Place on feet  |                                               |                                            */
/*   3 desc          Place on feet                 |                                               |                                            */
/*                   ...                           |                                               |                                            */
/*                                                 |                                               |                                            */
/*   1 year  1 year  2022           Games          |                                               |                                            */
/*   2 dept  2 dept  Games          Console        |                                               |                                            */
/*   3 desc          Console                       |                                               |                                            */
/*   1 year  1 year  2022           Games          |                                               |                                            */
/*   2 dept  2 dept  Games          Console        |                                               |                                            */
/*   3 desc          Console                       |                                               |                                            */
/*   1 year  1 year  2022           Games          |                                               |                                            */
/*   2 dept  2 dept  Games          PC             |                                               |                                            */
/*                                                                                                                                              */
/************************************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

data sd1.norm;
options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.norm;
  informat year $4. Dept $10. Desc $16.;
  input Year & Dept & Desc & freq;
cards4;
2010    Bridal       Wedding Dresses      1
2010    Shoes        Place on feet        4
2011    Bridal       Flowerly             3
2011    Bridal       Wedding Dresses      2
2011    Maternity    Comfortable          2
2011    Maternity    Stretchy             5
2012    Maternity    Comfortable          2
2013    Maternity    Comfortable          1
2013    Winter       Thick Socks          3
2014    Make Up      Foundation           1
2014    Make-Up      Foundation           2
2014    Make-Up      Lipstick             2
2015    Make-Up      Lipstick             1
2015    Suits        Full Gear            3
2015    Vehicle      Sedan                1
2022    Games        Console              2
2022    Games        PC                   1
;;;;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*   SD1.NORM total obs=17                                                                                                */
/*                                                                                                                        */
/*   YEAR    DEPT         DESC               FREQ                                                                         */
/*                                                                                                                        */
/*   2010    Bridal       Wedding Dresses      1                                                                          */
/*   2010    Shoes        Place on feet        4                                                                          */
/*   2011    Bridal       Flowerly             3                                                                          */
/*   2011    Bridal       Wedding Dresses      2                                                                          */
/*   2011    Maternity    Comfortable          2                                                                          */
/*   2011    Maternity    Stretchy             5                                                                          */
/*   2012    Maternity    Comfortable          2                                                                          */
/*   2013    Maternity    Comfortable          1                                                                          */
/*   2013    Winter       Thick Socks          3                                                                          */
/*   2014    Make Up      Foundation           1                                                                          */
/*   2014    Make-Up      Foundation           2                                                                          */
/*   2014    Make-Up      Lipstick             2                                                                          */
/*   2015    Make-Up      Lipstick             1                                                                          */
/*   2015    Suits        Full Gear            3                                                                          */
/*   2015    Vehicle      Sedan                1                                                                          */
/*   2022    Games        Console              2                                                                          */
/*   2022    Games        PC                   1                                                                          */
/*                                                                                                                        */
/**************************************************************************************************************************/
                         __                              _
 _ __  _ __ ___ _ __    / _| ___  _ __   ___  __ _ _ __ | | _____ _   _
| `_ \| `__/ _ \ `_ \  | |_ / _ \| `__| / __|/ _` | `_ \| |/ / _ \ | | |
| |_) | | |  __/ |_) | |  _| (_) | |    \__ \ (_| | | | |   <  __/ |_| |
| .__/|_|  \___| .__/  |_|  \___/|_|    |___/\__,_|_| |_|_|\_\___|\__, |
|_|            |_|                                                |___/


options validvarname=v7;
data sd1.have;
  retain x next_x;
  length node next_node $16;
  set sd1.norm;
    do i=1 to freq;
       x='1 year' ;node=year;next_x='1 year'; next_node=dept; output;
       x='2 dept'; node=dept;next_x='2 dept'; next_node=desc; output;
       x='3 desc'; node=desc;next_x=""; next_node="";   output;
    end;
    drop year dept desc i freq ;
run;quit;


/**************************************************************************************************************************/
/*                                                                                                                        */
/*  PREP DATA FOR SANKEY  SD1.HAVE total obs=108                                                                          */
/*                                                                                                                        */
/*    X      NEXT_X  NODE           NEXT_NODE                                                                             */
/*                                                                                                                        */
/*   1 year  1 year  2010           Bridal                                                                                */
/*   2 dept  2 dept  Bridal         Wedding Dress                                                                         */
/*   3 desc          Wedding Dress                                                                                        */
/*   1 year  1 year  2010           Shoes                                                                                 */
/*   2 dept  2 dept  Shoes          Place on feet                                                                         */
/*   3 desc          Place on feet                                                                                        */
/*   1 year  1 year  2010           Shoes                                                                                 */
/*   2 dept  2 dept  Shoes          Place on feet                                                                         */
/*   3 desc          Place on feet                                                                                        */
/*                   ...                                                                                                  */
/*                                                                                                                        */
/*   1 year  1 year  2022           Games                                                                                 */
/*   2 dept  2 dept  Games          Console                                                                               */
/*   3 desc          Console                                                                                              */
/*   1 year  1 year  2022           Games                                                                                 */
/*   2 dept  2 dept  Games          Console                                                                               */
/*   3 desc          Console                                                                                              */
/*   1 year  1 year  2022           Games                                                                                 */
/*   2 dept  2 dept  Games          PC                                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*                                    ___                 _               _              _  __
 _ __  _ __ ___   ___ ___  ___ ___   ( _ )     ___  _   _| |_ _ __  _   _| |_  _ __   __| |/ _|
| `_ \| `__/ _ \ / __/ _ \/ __/ __|  / _ \/\  / _ \| | | | __| `_ \| | | | __|| `_ \ / _` | |_
| |_) | | | (_) | (_|  __/\__ \__ \ | (_>  < | (_) | |_| | |_| |_) | |_| | |_ | |_) | (_| |  _|
| .__/|_|  \___/ \___\___||___/___/  \___/\/  \___/ \__,_|\__| .__/ \__,_|\__|| .__/ \__,_|_|
|_|                                                          |_|              |_|
*/

%utl_rbeginx;
parmcards4;
library(ggsankey)
library(haven)
library(dplyr)
library(ggplot2)
source("c:/oto/fn_tosas9x.R")
df_stack <- read_sas("d:/sd1/have.sas7bdat")
df_stack$x <- as.factor(df_stack$x)
df_stack$next_x <- as.factor(df_stack$next_x)
str(df_stack)
pdf(file="d:/pdf/ggsankey.pdf");
ggplot(df_stack, aes(x = x,
 next_x = next_x,
 node = node,
 next_node = next_node,
 fill = factor(node),
 label = node,
 color = factor(node))) +
  geom_sankey(flow.alpha=0.5,node.color=1,
  smooth=6,width=0.2,)+#width=widthofnodes
  geom_sankey_label(size=3.5
    ,color=1,fill="white") +
  scale_fill_viridis_d(direction=-1
     ,option="turbo") +
  scale_colour_viridis_d(direction=-1
     ,option="turbo") +
  theme_sankey(base_size=15) +
  theme(legend.position="none")+xlab('')
pdf();
;;;;
%utl_rendx;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
