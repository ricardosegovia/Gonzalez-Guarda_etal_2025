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

* **`datasets/`**: Contains the raw and processed datasets used in the analysis.
    * `frugivory_data.csv`: Data related to frugivory interactions.
    * `plant_data.csv`: Data on plant species characteristics.
    * `environmental_data.csv`: Environmental variables used in the model.
    * `extinction_risk_data.csv`: Data on plant extinction risk.
    * (Add other relevant dataset descriptions here)
* **`code/`**: Contains the scripts used for data processing, analysis, and modeling.
    * `data_preprocessing.R`: R script for cleaning and preparing the datasets.
    * `machine_learning_model.py`: Python script implementing the machine learning model.
    * `statistical_analysis.R`: R script for statistical analyses.
    * `visualization.R`: R script for generating figures and plots.
    * (Add other relevant code descriptions here)
* **`results/`**: Contains the output of the analyses, including figures, tables, and model outputs.
    * `model_output.csv`: Results from the machine learning model.
    * `figures/`: Directory containing generated figures.
    * `tables/`: Directory containing generated tables.
* **`README.md`**: This file, providing an overview of the repository.
* **`requirements.txt`**: List of Python dependencies.
* **`R_packages.txt`**: List of R packages used.

## Getting Started

### Prerequisites

* Python (>= 3.6)
* R (>= 4.0)
* Required Python packages (see `requirements.txt`)
* Required R packages (see `R_packages.txt`)

### Installation

1.  Clone the repository:

    ```bash
    git clone [repository URL]
    cd [repository directory]
    ```

2.  Create a virtual environment (recommended for Python):

    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Linux/macOS
    venv\Scripts\activate  # On Windows
    ```

3.  Install Python dependencies:

    ```bash
    pip install -r requirements.txt
    ```

4.  Install R packages:
    Open R and run:
    ```R
    install.packages(c("package1", "package2", "package3")) #replace with packages from R_packages.txt
    ```

### Usage

1.  Run the data preprocessing scripts:

    ```bash
    Rscript code/data_preprocessing.R
    ```

2.  Run the machine learning model:

    ```bash
    python code/machine_learning_model.py
    ```

3.  Run the statistical analysis scripts:

    ```bash
    Rscript code/statistical_analysis.R
    ```

4.  Run the visualization scripts:

    ```bash
    Rscript code/visualization.R
    ```

5. Review the results in the `results/` directory.

## License

[Specify the license, e.g., MIT License]

## Contact

* Erwin González-Guarda: [email address]
* Claudio Latorre: [email address]

## Acknowledgments

[Add any acknowledgments here]