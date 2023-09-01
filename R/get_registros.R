#' GET Endpoints SB
#'
#' Esta nueva version permite utilizar la V2 del API. Ahora utiliza paginacion para
#' hacer las consultas indicando la cantidad de paginas y de registros a
#' consultar
#'
#' @param api_key Primary Key de la suscripcion.
#' @param end_point Endpoint a consultar. Usa 'end_points()' para ver
#' todas las opciones
#' @param periodo_inicial Fecha en donde incian las series solicitadas
#' @param periodo_final Fecha en donde terminan las series. No obligatoria.
#' @param entidad ID de la entidad a consultar. No se puede introducir al mismo
#' tiempo que 'tipo_entidad'. Usa 'entidades()' para ver todos los IDs.
#' @param tipo_entidad ID del tipo de entidad a consulta. No se puede introducir
#' al mimo tiempo que 'entidad'. Usa 'tipo_entidad()' para ver todas
#' las opciones
#' @return string con el número de registros totales. Esta cantidad de
#' registros está basada en que los datos están divididos en 100 páginas.

#' @export
get_num_registros <- function(api_key, end_point, periodo_inicial, periodo_final = NULL,
                              entidad = NULL, tipo_entidad = NULL, registros = NULL){
  # base_url
  base_url <- "https://apis.sb.gob.do/estadisticas/v2"

  response <- GET(paste0(base_url, end_point),
                  add_headers("Ocp-Apim-Subscription-Key" = api_key),
                  query = list(
                    periodoInicial = periodo_inicial,
                    periodoFinal = periodo_inicial,
                    tipoEntidad = tipo_entidad,
                    entidad = entidad),
                  encode = "json")

  num_records <- fromJSON(headers(response)$`x-pagination`)$TotalRecords

  return(as.character(num_records))
}
