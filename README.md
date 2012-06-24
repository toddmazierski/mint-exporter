# mint-exporter

Regularly export your Mint.com transactions.

## Dependencies

  * Ruby > 1.8.7 (tested with 1.8.7-p357 and 1.9.3-p125)
  * [Bundler](http://gembundler.com/)

## Installation

```
$ git clone git://github.com/toddmazierski/mint-exporter.git
$ cd mint-exporter
$ bundle
```

## Usage
```
$ ruby mint-exporter.rb foo@bar.com password > mint-transactions.csv
```

## Note

Unfortunately, [because Mint.com does not yet have an open API](http://www.quora.com/Mint-com/Does-Mint-com-have-an-open-API), mint-exporter relies on screen-scraping to get the data. Because of this, this script could stop working at any time.
