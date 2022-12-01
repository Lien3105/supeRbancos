#' GET Endpoints SB
#'
#' Esta funcion carga los datos del endpoint solicitado en formato data frame
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
#' @return Un dataframe

#' @export
sb_get <- function(api_key, end_point, periodo_inicial, periodo_final = NULL,
                   entidad = NULL, tipo_entidad = NULL){

  ## Define base_url
  base_url <- "https://apis.sb.gob.do/estadisticas/"

  ## Get json
  response_df <- httr::GET(paste0(base_url, end_point),
            httr::add_headers("Ocp-Apim-Subscription-Key" = api_key),
            query = list(
              periodoInicial = periodo_inicial,
              periodoFinal = periodo_final,
              entidad = entidad,
              tipoEntidad = tipo_entidad),
            encode = "json")
  print(response_df)

  ## Parse json to df
  df <- httr::content(response_df, as = "text", encoding = "UTF-8")
  df <- jsonlite::fromJSON(df)

  ## JSON to dataframe
  df <- as.data.frame(df$data)

  return(df)
}
