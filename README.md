# YTB-Combiner

This GitHub Action download video from Youtube and upload it via rclone.

## Usage

### Pre-requisites

Create a workflow `.yml` file in your repositories `.github/workflows` directory. An [example workflow](#example-workflow) is available below. For more information, reference the GitHub Help Documentation for [Creating a workflow file](https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file).

### Inputs

* `bucket` - Upload destination, in `dest:full/path` format. Will be directly passed to rclone
* `video_url` - Video's url

### Example workflow

```yaml
name: Combiner

on:
  workflow_dispatch:
    inputs:
      url:
        description: 'Video Url'
        required: true
        default: ''

jobs:
  Example:
    name: Combine and upload video
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
        
      - name: Combiner
        uses: nekomiyakumi/ytb-combiner@v1
        with:
          bucket: target:bucket
          video_url: ${{ github.event.inputs.url }}
        env:
          RCLONE_CONFIG_TARGET_TYPE: s3
          RCLONE_CONFIG_TARGET_ACCESS_KEY_ID: ${{ secrets.ACCESS_KEY_ID }}
          RCLONE_CONFIG_TARGET_SECRET_ACCESS_KEY: ${{ secrets.SECRET_ACCESS_KEY }}

```

> See the [rclone documentation on environment variables](https://rclone.org/docs/#environment-variables) for info on remote access configuration.

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
