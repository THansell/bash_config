if [ $0 != $BASH_SOURCE ]; then
  #
  # Keeping track if file has already been sourced
  # 
  if [ ! -v SOURCED_FILES ]; then
    declare -A SOURCED_FILES
  fi
  if [ ! ${SOURCED_FILES[$BASH_SOURCE]+_} ]; then
    SOURCED_FILES["$BASH_SOURCE"]=1

    declare -a MTI_REPOSITORIES
  
    MTI_REPOSITORIES=(
      mti-ingest
      mti-nifi-lib
      mti-index
      mti-visualize
      mti-rest
      mti-processing
      mti-testing
      mti-extractor-app
      mti-conditioner-app
      mti-dotExtractor-app
      mti-retrieval-app
      mti-transformation-app
      mti-shapefile-app
      mti-associated-app
      mti-editionb-app
      ods-odiss-api
      ods-odiss-engine
      ods-odiss-notifier
      ods-odiss-ui
      gdc_view
      mti-linking-service
      ods-extractor
      ods-coordinate-conversion-service
      ods-geospatial-conditioning-service
      ods-validation-service
      ods-nitf-proxy
      mti-infrastructure
    )
  fi
else
  echo "[$BASH_SOURCE] is intended to be a bash include file."
  echo "This script should never be run directly"
  echo "It should be included using the 'source' command in"
  echo "another bash script."
fi