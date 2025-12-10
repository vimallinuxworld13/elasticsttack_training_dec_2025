# Welcome to the Dev Tools Console!
GET /_cat/indices?v


GET /app-web-prod-other-2025-12-10
GET /app-web-prod-other-2025-12-10/_search

GET /app-web-prod-other-2025-12-10/_search
{
    "query": { 
        "match_all": {} 
        }
}


GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "match": {
          "message": "GET 196"
        }
    }
}

GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "term": {
          "http.response.status_code": 200
        }
    }
}


GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "bool": {
            "must": [
              { "match": { "message": "wwert235"}}
            ],
            "filter": [
              { "term": {  "http.response.status_code": 404}}
            ]
        }
    }
}


GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "range": {
          "http.response.body.bytes": {
            "gte": 100,
            "lte": 200
          }
        }
    }
}



GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "range": {
          "@timestamp": {
            "gte": "now-1d",
            "lte": "now"
          }
        }
    }
}



GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "wildcard": {
            "source.address" : "192.168.*"
        }
    }
}

GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "regexp": {
          "url.original": ".*\\.html"
        }
    }
}

GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "match": {
          "http.request.method": { "query": "GOT", "fuzziness": "AUTO"}
        }
    }
}
