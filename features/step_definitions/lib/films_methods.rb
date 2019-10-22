def films
  payload = {
    query:
      "query {
        allFilms {
          films {
            id
            title
            episodeID
          }
        }
      }"
  }
  all_films = parse_and_report('POST', BASE_HOST, payload, nil)
  @films = all_films[:data][:allFilms][:films]
end

def film(id)
  payload = {
    query: 'query ($film_id: ID) {
      film(filmID: $film_id) {
        title
      }
    }',
    variables: {
      film_id: id.to_i
    }
  }
  @film = parse_and_report('POST', BASE_HOST, payload, nil)
  puts @film
end
