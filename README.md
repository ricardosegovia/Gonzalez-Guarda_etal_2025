# Lasting impact of proboscidean frugivory on South American ecosystems

This repository contains the datasets and code used in the research paper:

**Lasting impact of proboscidean frugivory on South American ecosystems**

By: Erwin González-Guarda<sup>1,2*</sup>, Andrea P. Loayza<sup>3</sup>, Ricardo A. Segovia<sup>3,4</sup>, Florent Rivals<sup>2,5,6</sup>, Alia Petermann-Pichincura<sup>5</sup>, Iván Ramírez-Pedraza<sup>2,5,7</sup>, Lidiane Asevedo<sup>8</sup>, Carlos Tornero<sup>2,9</sup>, Rafael Labarca<sup>10</sup>, Claudio Latorre<sup>3,11,12*</sup>

<sup>1</sup>Instituto de Ciencias de la Ingeniería, Universidad de O’Higgins, Libertador Bernardo O’Higgins, 611, Rancagua, Chile
<sup>2</sup>Institut Català de Paleoecologia Humana i Evolució Social (IPHES-CERCA), Tarragona, Spain
<sup>3</sup>Instituto de Ecología y Biodiversidad (IEB), Santiago, Chile
<sup>4</sup>Departamento de Botánica, Facultad de Ciencias Naturales y Oceanográficas, Universidad de Concepción.
<sup>5</sup>Universitat Rovira i Virgili (URV), Departament d’Història i Història de l’Art, Tarragona, Spain
<sup>6</sup>ICREA, Barcelona, Spain
<sup>7</sup>IsoTROPIC Research Group, Max Planck Institute of Geoanthropology, Jena, Germany
<sup>8</sup>Universidade do Estado do Rio de Janeiro, Faculdade de Geologia, Departamento de Estratigrafia e Paleontologia, Rua São Francisco Xavier, 524, 20550-013, Maracanã, Rio de Janeiro, RJ, Brazil.
<sup>9</sup>Department of Prehistory, Autonomous University of Barcelona (UAB). 08193 Bellaterra, Spain
<sup>10</sup>Departamento de Antropología, Facultad de Ciencias Sociales, Pontificia Universidad Católica de Chile, Santiago, Chile
<sup>11</sup>Centro UC Desierto de Atacama & Facultad de Ciencias Biológicas, Pontificia Universidad Católica de Chile, Santiago, Chile
<sup>12</sup>Centro para la regulación del Genoma (CGR), Santiago, Chile

**Abstract:**

Most megaherbivores in the Americas went extinct around 10,000 years ago, presumably disrupting the long-distance seed dispersal of large, fleshy-fruited plant species. The neotropical anachronism hypothesis, proposed by Janzen and Martin, suggests that large fruits evolved in response to past selective pressures from now extinct megafauna. While this explains many key adaptations of "megafaunal fruit" plants, it lacks robust paleoecological evidence. Here, we use a multiproxy approach that provides evidence of frugivory by the extinct South American proboscidean *Notiomastodon platensis*. Using a machine learning model that reveals the extinction effects of these megafaunal dispersers in modern ecosystems, we show how losing seed-dispersal interactions increases the extinction risk of megafaunal fruit plants in regions across South America lacking smaller surrogate dispersers. Our results imply that current ecosystems may undergo further functional changes under continuing anthropogenic pressures.

## Repository Contents

* **`Data/`**: Contains the raw and processed datasets used in the analysis.
    * `frugivory_data.csv`: Data related to frugivory interactions.
    * `extinction_risk_data.csv`: Data on plant extinction risk.
    * `speciesXcountry.csv`: Data on species list by Botnaical Country
    
* **`Code/`**: Contains the scripts used for data processing, analysis, and modeling.
    * `extraction_extinction_risk_data.R`: R script for extracting IUCN extnction risk labesl.
    * `iucnn_models.R`: R script implementing the machine learning IUCNN model.
    * `viz_and_signific_analises.R`: R script for generating figures and statistical analyses.
* **`README.md`**: This file, providing an overview of the repository.

## Contact

* Erwin González-Guarda: erwin.gonzalez@uoh.cl
* Claudio Latorre: clatorreh@uc.cl
* Ricardo Segovia: rsegovia@ieb-chile.cl