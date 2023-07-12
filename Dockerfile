FROM erlang:25.3

RUN apt-get update && apt-get install -y gnuplot sudo
RUN useradd -m examplesuser
RUN git clone https://github.com/lfex/plottah.git
RUN chown -R examplesuser:examplesuser plottah

WORKDIR ./plottah

RUN sudo -u examplesuser rebar3 compile
RUN sudo -u examplesuser rebar3 as examples compile
RUN sudo -u examplesuser rebar3 as examples list
RUN which gnuplot
RUN gnuplot --version
RUN sudo -u examplesuser rebar3 as examples lfe run -- 3d-heatmap true
RUN sudo -u examplesuser rebar3 as examples lfe run -- all true

CMD ["ls", "-l", "priv/output/*.jpg", "&&", "make", "output-md5sum", "make", "md5sum", ">", "priv/output/examples.md5sum", "&&", "diff", "-u", "examples/output.md5sum", "priv/output/examples.md5sum"]
