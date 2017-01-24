FROM jupyter/scipy-notebook

USER $NB_USER

# Install Python 3 packages
# Remove pyqt and qt pulled in for matplotlib since we're only ever going to
# use notebook-friendly backends in these images
RUN conda install --quiet --yes -c https://conda.binstar.org/pymc pymc && \
    conda remove --quiet --yes --force qt pyqt && \
	conda clean -tipsy

RUN conda install --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 -c https://conda.binstar.org/pymc pymc && \
    conda remove -n python2 --quiet --yes --force qt pyqt && \
	conda clean -tipsy

USER $NB_USER
