FROM tsutomu7/scientific-python

ENV LANG=ja_JP.UTF-8
COPY python-dep.py /root/
RUN apt-get update --fix-missing && apt-get install -y libltdl7 && \
    apt-get clean && \
    conda install -y --no-update-deps graphviz && pip install graphviz pipdeptree && \
    cd && python python-dep.py && \
    rm -rf /var/lib/apt/lists/* /python-dep /root/.c* /opt/conda/pkgs/* \

