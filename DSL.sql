# Welcome to the Dev Tools Console!
GET /_cat/indices?v


GET /app-web-prod-other-2025-12-10
GET /app-web-prod-other-2025-12-10/_search

GET /app-web-prod-other-2025-12-10/_search
{
    "query": {
        "match": {
          "message": "Get is 200"
        }
    }
}
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
          "message.keyword": "404"
        }
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





GET app-web-beat-2025-12-09/_search
{
  "size": 0,
  "aggs": {
    "status_counts": {
      "terms": { "field": "http.response.status_code" }
    }
  }
}


GET /_cat/nodes?v

GET /_cat/indices?v
# You can use Console to explore the Elasticsearch API. See the Elasticsearch API reference to learn more:
# https://www.elastic.co/guide/en/elasticsearch/reference/current/rest-apis.html
#
# Here are a few examples to get you started.

GET /_cat/health?v

GET /_cat/indices

GET /_cat/master

# Create an index
PUT /my-index-vimal

POST /emp/_doc
{
 "name": "jaipur",
"mob": 135355435,
"city": "delhi" 
}

GET /emp/_search?q=vimal

GET /emp/_search

GET /emp/_search_shards

GET /_cat/shards?h=index,ip,shard&v

GET /emp/_shard_stores?pretty

GET /_cat/shards/emp?v

GET /_cluster/health

GET /_cluster/stats

#GET /_cluster/allocation/explain?pretty


# Add a document to my-index
POST /my-index/_doc
{
    "id": "park_rocky-mountain",
    "title": "Rocky Mountain",
    "description": "Bisected north to south by the Continental Divide, this portion of the Rockies has ecosystems varying from over 150 riparian lakes to montane and subalpine forests to treeless alpine tundra."
}


# Perform a search in my-index
GET /my-index/_search?q="rocky mountain"




GET /app-web-prod-other-2025-12-10/_search
{
    "profile": true,

    "query": {
        "match": {
          "message": "GET"
        }
    }
}


GET /app-web-prod-other-2025-12-10/_search
{
    "explain": true,
    "query": {
        "match": {
            "message": "GET"
        }
    }
}


GET /app-web-prod-other-2025-12-10/_search?filter_path=took,_shards
{
    "query": {
        "term": {
          "http.response.status_code": 404
        }
    }
}

GET _tasks?detailed=true&actions=*search*

PUT /app-web-prod-other-2025-12-10/_settings
{
    
  "index.search.slowlog.threshold.query.warn": "10s",
  "index.search.slowlog.threshold.query.info": "5s",
  "index.search.slowlog.threshold.query.debug": "2s",
  "index.search.slowlog.threshold.query.trace": "500ms",
  "index.search.slowlog.threshold.fetch.warn": "1s",
  "index.search.slowlog.threshold.fetch.info": "800ms",
  "index.search.slowlog.threshold.fetch.debug": "500ms",
  "index.search.slowlog.threshold.fetch.trace": "200ms",
  "index.search.slowlog.include.user": true
}

GET /app-web-prod-other-2025-12-10/_settings


GET _nodes/stats

GET /app-web-prod-other-2025-12-10/_stats 




