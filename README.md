# mint-exporter

Regularly export your Mint.com transactions.

## Dependencies

  * Ruby > 1.9.2 (tested with 1.9.3-p194)
  * [Bundler](http://gembundler.com/)

## Installation

```bash
git clone git://github.com/toddmazierski/mint-exporter.git
cd mint-exporter
bundle
```

## Configuration

Please rename `.env.example` to `.env` and fill in your Mint credentials.

## Usage

```bash
foreman run ruby mint-exporter.rb > mint-transactions.csv
```

## Note

Unfortunately, [because Mint.com does not yet have an open API](http://www.quora.com/Mint-com/Does-Mint-com-have-an-open-API?share=1), mint-exporter relies on private APIs to get the data. Because of this, this script could stop working at any time.
