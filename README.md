# CloudyGo

Frontend for displaying
[MiniGo](https://github.com/tensorflow/minigo),
[Leela-Zero](https://github.com/gcp/leela-zero),
and other Go data.

*This is not an official Google product.*

## Getting Started

Visit [CloudyGo.com](http://CloudyGo.com) to see a live version.

### Prerequisites

The site requires several python libraries, this may not be a complete list
```
pip3 install choix flask numpy tqdm sqlite3 requests
```
sgftopng is required to render some images, but isn't required to run.

For local development I suggest using
[devel_instance.7z](https://drive.google.com/file/d/1IwvvSLpKnrzNQUX6XaRaAQ5KXkjn9rrG/view?usp=sharing) to bootstrap.

devel_instance.7z contains enough of MiniGo v3-9x9 and v7-19x19 data to test the UI.

```
7z x devel_instance.7z
mv -n devel_instance instance
./oneoff/repopulate_db.sh
./updater.py models True v3-9x9 v5-19x19 v7-19x19 leela-zero-v1
./updater.py games v3-9x9 v5-19x19 v7-19x19 leela-zero-v1
./updater.py eval_games v3-9x9 v5-19x19 v7-19x19 leela-zero-v1
./updater.py position_evals v3-9x9 v5-19x19 v7-19x19 leela-zero-v1
FLASK_DEBUG=1 FLASK_APP="web/serve.py" flask run --host 0.0.0.0 --port 5000
# follow instructions in SETUP so SGFS can be rendered with WGo.js
```

### Coding style

Style guide is a mix of Google Python + PEP8,
Some older code may not be perfectly compliant.

## Deployment CloudyGo

CloudyGo.com is run by Seth Troisi, local deployment is normally tested with
```
FLASK_DEBUG=1 FLASK_APP="web/serve.py" flask run --host 0.0.0.0 --port 6000
```

## Full Site Setup

* Some initial instructions are in [SETUP](SETUP).

* [rsync-data.sh](rsync-data.sh) helps copy data from [MiniGo's Google Cloud Storage public bucket](https://console.cloud.google.com/storage/browser/minigo-pub)

<big><pre>
instance/             # Created with oneoff/repopulate_db.sh from schema.sql
    ├── cloudygo.db       # Created with oneoff/repopulate_db.sh from schema.sql
    ├── data/             # directory (or link to directory) of MiniGo training data
    │   ├── v7-19x19/     # Training Run #1
    │   │   ├── models/   # See minigo-pub Google Cloud Storage Bucket
    │   │   ├── sgf/      # See minigo-pub Google Cloud Storage Bucket
    │   └── ...           # Other Training Runs
    ├── eval/v7-19x19/    # [Figure 3 details](http://cloudygo.com/v7-19x19/figure-three) produced by [minigo/oneoffs](https://github.com/tensorflow/minigo/blob/master/oneoffs/training_curve.py)
    ├── policy/v7-19x19/  # [Policy heatmaps](http://cloudygo.com/v7-19x19/models_evolution/?M=189&P=13) produced by [minigo/oneoffs](https://github.com/tensorflow/minigo/blob/master/oneoffs/heatmap.py)
    ├── pv/v7-19x19/      # [Principle variations](http://cloudygo.com/v7-19x19/models_evolution/?M=189&P=13) produced by [minigo/oneoffs](https://github.com/tensorflow/minigo/blob/master/oneoffs/position_pv.py)
    ├── openings/         # PNGs of openings (deprecated)
    ├── debug/            # various logs served by easter egg secrets page
    </pre></big>



## Contributing

Please read [CONTRIBUTING](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## License

This project is licensed under the Apache 2 License - see [LICENSE](LICENSE) file for details

## Authors

See also the list of [AUTHORS](AUTHORS) who participated in this project.

## Acknowledgments

* [MiniGo](https://github.com/tensorflow/minigo)
* Andrew Jackson for his infinite patience with my questions

## Links

* [MiniGo](https://github.com/tensorflow/minigo)
    website: [CloudyGo.com](http://CloudyGo.com)
* [Leela-Zero](https://github.com/gcp/leela-zero)
    website: [sjeng.org](http://zero.sjeng.org/home)
* [Leela Chess Zero](https://github.com/LeelaChessZero/lc0)
    website: [lczero.org](https://lczero.org/)

