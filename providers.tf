terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 4176494
  api_key = "NRAK-X7B7YN275VT0MX4J0CBM8QUVVW5"   # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}